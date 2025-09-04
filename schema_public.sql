--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.audit_action AS ENUM (
    'create',
    'update',
    'delete'
);


--
-- Name: notification_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.notification_type AS ENUM (
    'auto',
    'manual'
);


--
-- Name: send_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.send_status AS ENUM (
    'success',
    'failed'
);


--
-- Name: station_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.station_status AS ENUM (
    'operating',
    'maintenance',
    'planned'
);


--
-- Name: storage_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.storage_type AS ENUM (
    'local',
    's3',
    'azure'
);


--
-- Name: tax_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tax_status AS ENUM (
    'accounting_review',
    'payment_scheduled',
    'payment_completed'
);


--
-- Name: tax_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tax_type AS ENUM (
    'acquisition',
    'property',
    'other'
);


--
-- Name: user_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_role AS ENUM (
    'viewer',
    'admin'
);


--
-- Name: can_change_tax_status(public.tax_type, public.tax_status, public.tax_status); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_change_tax_status(p_tax_type public.tax_type, p_current_status public.tax_status, p_new_status public.tax_status) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Acquisition tax workflow
    IF p_tax_type = 'acquisition' THEN
        IF p_current_status = 'accounting_review' AND p_new_status = 'payment_scheduled' THEN
            RETURN TRUE;
        ELSIF p_current_status = 'payment_scheduled' AND p_new_status = 'payment_completed' THEN
            RETURN TRUE;
        ELSIF p_current_status = 'payment_scheduled' AND p_new_status = 'accounting_review' THEN
            RETURN TRUE; -- Allow rollback
        ELSIF p_current_status = 'payment_completed' AND p_new_status = 'payment_scheduled' THEN
            RETURN TRUE; -- Allow rollback
        ELSE
            RETURN FALSE;
        END IF;
    -- Property tax and other tax workflow
    ELSE
        IF p_current_status = 'payment_scheduled' AND p_new_status = 'payment_completed' THEN
            RETURN TRUE;
        ELSIF p_current_status = 'payment_completed' AND p_new_status = 'payment_scheduled' THEN
            RETURN TRUE; -- Allow rollback
        ELSE
            RETURN FALSE;
        END IF;
    END IF;
END;
$$;


--
-- Name: create_auto_notifications(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.create_auto_notifications() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    schedule_record RECORD;
    station_name_var VARCHAR(100);
BEGIN
    -- Get station name
    SELECT charging_stations.station_name INTO station_name_var
    FROM public.charging_stations
    WHERE id = NEW.station_id;
    
    -- Create notifications for each active schedule
    FOR schedule_record IN 
        SELECT id, days_before, notification_time 
        FROM public.notification_schedules 
        WHERE is_active = TRUE
    LOOP
        INSERT INTO public.notifications (
            tax_id, 
            notification_type, 
            schedule_id,
            notification_date, 
            notification_time,
            message,
            created_by
        ) VALUES (
            NEW.id,
            'auto',
            schedule_record.id,
            NEW.due_date - INTERVAL '1 day' * schedule_record.days_before,
            schedule_record.notification_time,
            FORMAT('세금 납부 알림: %s일 후 만료 - %s', 
                   schedule_record.days_before, 
                   COALESCE(station_name_var, 'Unknown Station')),
            NEW.created_by
        );
    END LOOP;
    
    RETURN NEW;
END;
$$;


--
-- Name: generate_tax_reminders(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generate_tax_reminders() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    tax_record RECORD;
    schedule_record RECORD;
    reminder_date DATE;
    reminder_message TEXT;
BEGIN
    -- Loop through all active taxes that are not completed
    FOR tax_record IN 
        SELECT t.*, cs.station_name, cs.location
        FROM public.taxes t
        JOIN public.charging_stations cs ON t.station_id = cs.id
        WHERE t.status != 'payment_completed'
    LOOP
        -- Loop through all active notification schedules
        FOR schedule_record IN 
            SELECT * FROM public.notification_schedules 
            WHERE is_active = true
        LOOP
            -- Calculate reminder date
            IF schedule_record.days_before >= 0 THEN
                reminder_date := tax_record.due_date - INTERVAL '1 day' * schedule_record.days_before;
            ELSE
                -- For overdue reminders (days_before = -1), set reminder for day after due date
                reminder_date := tax_record.due_date + INTERVAL '1 day';
            END IF;
            
            -- Generate appropriate message
            IF schedule_record.days_before > 0 THEN
                reminder_message := format('세금 납부 기한 %s일 전 알림: %s (%s) - %s원, 납부 기한: %s',
                    schedule_record.days_before,
                    tax_record.station_name,
                    CASE tax_record.tax_type
                        WHEN 'acquisition' THEN '취득세'
                        WHEN 'property' THEN '재산세'
                        ELSE '기타세금'
                    END,
                    tax_record.tax_amount::text,
                    tax_record.due_date::text
                );
            ELSIF schedule_record.days_before = 0 THEN
                reminder_message := format('세금 납부 당일 알림: %s (%s) - %s원, 오늘이 납부 기한입니다!',
                    tax_record.station_name,
                    CASE tax_record.tax_type
                        WHEN 'acquisition' THEN '취득세'
                        WHEN 'property' THEN '재산세'
                        ELSE '기타세금'
                    END,
                    tax_record.tax_amount::text
                );
            ELSE
                reminder_message := format('세금 연체 알림: %s (%s) - %s원, 납부 기한이 지났습니다! 즉시 납부하세요.',
                    tax_record.station_name,
                    CASE tax_record.tax_type
                        WHEN 'acquisition' THEN '취득세'
                        WHEN 'property' THEN '재산세'
                        ELSE '기타세금'
                    END,
                    tax_record.tax_amount::text
                );
            END IF;
            
            -- Insert notification if it doesn't already exist
            INSERT INTO public.notifications (
                tax_id,
                notification_type,
                schedule_id,
                notification_date,
                notification_time,
                message,
                is_sent,
                created_by
            )
            SELECT 
                tax_record.id,
                'auto',
                schedule_record.id,
                reminder_date,
                schedule_record.notification_time,
                reminder_message,
                false,
                tax_record.created_by
            WHERE NOT EXISTS (
                SELECT 1 FROM public.notifications 
                WHERE tax_id = tax_record.id 
                AND schedule_id = schedule_record.id
                AND notification_date = reminder_date
            );
        END LOOP;
    END LOOP;
END;
$$;


--
-- Name: handle_user_update(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_user_update() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  UPDATE public.users
  SET 
    email = NEW.email,
    updated_at = NEW.updated_at,
    is_email_verified = NEW.email_confirmed_at IS NOT NULL,
    last_login_at = CASE 
      WHEN NEW.last_sign_in_at IS NOT NULL AND NEW.last_sign_in_at != OLD.last_sign_in_at 
      THEN NEW.last_sign_in_at 
      ELSE last_login_at 
    END
  WHERE id = NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: set_initial_tax_status(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_initial_tax_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Acquisition tax starts with accounting review
    IF NEW.tax_type = 'acquisition' THEN
        NEW.status = 'accounting_review';
    ELSE
        -- Property tax and other tax start with payment scheduled
        NEW.status = 'payment_scheduled';
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: track_tax_status_change(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.track_tax_status_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF OLD.status != NEW.status THEN
        INSERT INTO public.tax_status_history (
            tax_id,
            previous_status,
            new_status,
            changed_by,
            reason
        ) VALUES (
            NEW.id,
            OLD.status,
            NEW.status,
            NEW.updated_by,
            'Status updated via system'
        );
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: update_overdue_tax_status(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_overdue_tax_status() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Update taxes to overdue status if past due date and not completed
    UPDATE public.taxes 
    SET status = 'accounting_review'  -- Using existing enum value as closest to overdue
    WHERE due_date < CURRENT_DATE 
    AND status != 'payment_completed'
    AND status != 'accounting_review';
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


--
-- Name: validate_tax_status_change(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.validate_tax_status_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Only validate if status is changing
    IF OLD.status != NEW.status THEN
        -- Acquisition tax workflow validation
        IF NEW.tax_type = 'acquisition' THEN
            -- Cannot go directly from accounting_review to payment_completed
            IF OLD.status = 'accounting_review' AND NEW.status = 'payment_completed' THEN
                RAISE EXCEPTION 'Acquisition tax cannot go directly from accounting review to payment completed';
            END IF;
        -- Property tax and other tax validation
        ELSE
            -- Cannot have accounting_review status
            IF NEW.status = 'accounting_review' THEN
                RAISE EXCEPTION 'Property tax and other tax cannot have accounting review status';
            END IF;
        END IF;
        
        -- General workflow validation
        IF NOT can_change_tax_status(NEW.tax_type, OLD.status, NEW.status) THEN
            RAISE EXCEPTION 'Invalid status change from % to % for tax type %', OLD.status, NEW.status, NEW.tax_type;
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    menu text NOT NULL,
    action public.audit_action NOT NULL,
    actor_id uuid NOT NULL,
    actor_name text NOT NULL,
    description text NOT NULL,
    target_table text,
    target_id text,
    changes jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: charging_stations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.charging_stations (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    station_name character varying(100) NOT NULL,
    location character varying(200) NOT NULL,
    address character varying(255),
    status public.station_status DEFAULT 'operating'::public.station_status,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: email_recipients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_recipients (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    is_active boolean DEFAULT true,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.holidays (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    holiday_date date NOT NULL,
    holiday_name character varying(50) NOT NULL,
    is_recurring boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: notification_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification_logs (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    notification_id uuid NOT NULL,
    send_status public.send_status NOT NULL,
    error_message text,
    sent_at timestamp with time zone DEFAULT now()
);


--
-- Name: notification_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification_schedules (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    schedule_name character varying(50) NOT NULL,
    days_before integer NOT NULL,
    notification_time time without time zone DEFAULT '09:00:00'::time without time zone,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    tax_id uuid,
    notification_type public.notification_type NOT NULL,
    schedule_id uuid,
    notification_date date NOT NULL,
    notification_time time without time zone DEFAULT '09:00:00'::time without time zone,
    message text NOT NULL,
    is_sent boolean DEFAULT false,
    sent_at timestamp with time zone,
    teams_channel_id uuid,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: tax_status_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_status_history (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    tax_id uuid NOT NULL,
    previous_status public.tax_status,
    new_status public.tax_status,
    changed_by uuid,
    changed_at timestamp with time zone DEFAULT now(),
    reason text
);


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxes (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    station_id uuid NOT NULL,
    tax_type public.tax_type NOT NULL,
    tax_amount numeric(15,2) NOT NULL,
    due_date date NOT NULL,
    status public.tax_status DEFAULT 'payment_scheduled'::public.tax_status,
    payment_date date,
    tax_notice_number character varying(50),
    tax_year integer,
    tax_period character varying(20),
    notes text,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: teams_channels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams_channels (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    channel_name character varying(100) NOT NULL,
    webhook_url character varying(500) NOT NULL,
    is_active boolean DEFAULT true,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: user_activity_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_activity_logs (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    entity_type character varying(50),
    entity_id uuid,
    old_value jsonb,
    new_value jsonb,
    details text,
    ip_address inet,
    user_agent character varying(255),
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(50) NOT NULL,
    role public.user_role DEFAULT 'viewer'::public.user_role,
    is_email_verified boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_login_at timestamp with time zone,
    CONSTRAINT chk_email CHECK (((email)::text ~~ '%@watercharging.com'::text))
);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: charging_stations charging_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT charging_stations_pkey PRIMARY KEY (id);


--
-- Name: email_recipients email_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_recipients
    ADD CONSTRAINT email_recipients_pkey PRIMARY KEY (id);


--
-- Name: holidays holidays_holiday_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_holiday_date_key UNIQUE (holiday_date);


--
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: notification_logs notification_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_pkey PRIMARY KEY (id);


--
-- Name: notification_schedules notification_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_schedules
    ADD CONSTRAINT notification_schedules_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: tax_status_history tax_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_pkey PRIMARY KEY (id);


--
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- Name: teams_channels teams_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams_channels
    ADD CONSTRAINT teams_channels_pkey PRIMARY KEY (id);


--
-- Name: user_activity_logs user_activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_actor_id_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_actor_id_created_at_idx ON public.audit_logs USING btree (actor_id, created_at DESC);


--
-- Name: audit_logs_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_created_at_idx ON public.audit_logs USING btree (created_at DESC);


--
-- Name: audit_logs_menu_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_menu_created_at_idx ON public.audit_logs USING btree (menu, created_at DESC);


--
-- Name: idx_charging_stations_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_charging_stations_location ON public.charging_stations USING btree (location);


--
-- Name: idx_charging_stations_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_charging_stations_name ON public.charging_stations USING btree (station_name);


--
-- Name: idx_notifications_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_date ON public.notifications USING btree (notification_date);


--
-- Name: idx_notifications_sent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_sent ON public.notifications USING btree (is_sent);


--
-- Name: idx_taxes_due_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_due_date ON public.taxes USING btree (due_date);


--
-- Name: idx_taxes_station_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_station_id ON public.taxes USING btree (station_id);


--
-- Name: idx_taxes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_status ON public.taxes USING btree (status);


--
-- Name: idx_taxes_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_type ON public.taxes USING btree (tax_type);


--
-- Name: idx_user_activity_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_activity_logs_created_at ON public.user_activity_logs USING btree (created_at);


--
-- Name: idx_user_activity_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_activity_logs_user_id ON public.user_activity_logs USING btree (user_id);


--
-- Name: taxes create_auto_notifications_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER create_auto_notifications_trigger AFTER INSERT ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.create_auto_notifications();


--
-- Name: taxes set_initial_tax_status_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_initial_tax_status_trigger BEFORE INSERT ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.set_initial_tax_status();


--
-- Name: taxes track_tax_status_change_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER track_tax_status_change_trigger AFTER UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.track_tax_status_change();


--
-- Name: charging_stations update_charging_stations_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_charging_stations_updated_at BEFORE UPDATE ON public.charging_stations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: email_recipients update_email_recipients_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_email_recipients_updated_at BEFORE UPDATE ON public.email_recipients FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: notification_schedules update_notification_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_notification_schedules_updated_at BEFORE UPDATE ON public.notification_schedules FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: notifications update_notifications_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_notifications_updated_at BEFORE UPDATE ON public.notifications FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: taxes update_taxes_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_taxes_updated_at BEFORE UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: teams_channels update_teams_channels_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_teams_channels_updated_at BEFORE UPDATE ON public.teams_channels FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: users update_users_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: taxes validate_tax_status_change_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER validate_tax_status_change_trigger BEFORE UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.validate_tax_status_change();


--
-- Name: audit_logs audit_logs_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.users(id);


--
-- Name: charging_stations charging_stations_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT charging_stations_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: email_recipients email_recipients_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_recipients
    ADD CONSTRAINT email_recipients_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id);


--
-- Name: notification_logs notification_logs_notification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_notification_id_fkey FOREIGN KEY (notification_id) REFERENCES public.notifications(id);


--
-- Name: notifications notifications_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: notifications notifications_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.notification_schedules(id);


--
-- Name: notifications notifications_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_teams_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_teams_channel_id_fkey FOREIGN KEY (teams_channel_id) REFERENCES public.teams_channels(id);


--
-- Name: tax_status_history tax_status_history_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.users(id);


--
-- Name: tax_status_history tax_status_history_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(id) ON DELETE CASCADE;


--
-- Name: taxes taxes_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: taxes taxes_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.charging_stations(id);


--
-- Name: taxes taxes_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- Name: teams_channels teams_channels_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams_channels
    ADD CONSTRAINT teams_channels_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: user_activity_logs user_activity_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: charging_stations All users can view charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view charging stations" ON public.charging_stations FOR SELECT USING (true);


--
-- Name: holidays All users can view holidays; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view holidays" ON public.holidays FOR SELECT USING (true);


--
-- Name: notification_logs All users can view notification logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notification logs" ON public.notification_logs FOR SELECT USING (true);


--
-- Name: notification_schedules All users can view notification schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notification schedules" ON public.notification_schedules FOR SELECT USING (true);


--
-- Name: notifications All users can view notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notifications" ON public.notifications FOR SELECT USING (true);


--
-- Name: tax_status_history All users can view tax status history; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view tax status history" ON public.tax_status_history FOR SELECT USING (true);


--
-- Name: taxes All users can view taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view taxes" ON public.taxes FOR SELECT USING (true);


--
-- Name: teams_channels All users can view teams channels; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view teams channels" ON public.teams_channels FOR SELECT USING (true);


--
-- Name: users Authenticated users can create their profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can create their profile" ON public.users FOR INSERT WITH CHECK (((auth.uid() IS NOT NULL) AND (id = auth.uid())));


--
-- Name: charging_stations Only admins can delete charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can delete charging stations" ON public.charging_stations FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: taxes Only admins can delete taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can delete taxes" ON public.taxes FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: charging_stations Only admins can insert charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert charging stations" ON public.charging_stations FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: tax_status_history Only admins can insert tax status history; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert tax status history" ON public.tax_status_history FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: taxes Only admins can insert taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert taxes" ON public.taxes FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: holidays Only admins can manage holidays; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage holidays" ON public.holidays USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: notification_schedules Only admins can manage notification schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage notification schedules" ON public.notification_schedules USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: notifications Only admins can manage notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage notifications" ON public.notifications USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: teams_channels Only admins can manage teams channels; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage teams channels" ON public.teams_channels USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: charging_stations Only admins can update charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can update charging stations" ON public.charging_stations FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: taxes Only admins can update taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can update taxes" ON public.taxes FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- Name: user_activity_logs Only system can insert activity logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only system can insert activity logs" ON public.user_activity_logs FOR INSERT WITH CHECK (true);


--
-- Name: users Service role can insert users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Service role can insert users" ON public.users FOR INSERT WITH CHECK (((auth.jwt() ->> 'role'::text) = 'service_role'::text));


--
-- Name: email_recipients Users can delete email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can delete email recipients" ON public.email_recipients FOR DELETE USING (true);


--
-- Name: email_recipients Users can insert email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert email recipients" ON public.email_recipients FOR INSERT WITH CHECK (true);


--
-- Name: email_recipients Users can update email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can update email recipients" ON public.email_recipients FOR UPDATE USING (true);


--
-- Name: users Users can update their own profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can update their own profile" ON public.users FOR UPDATE USING ((auth.uid() = id));


--
-- Name: email_recipients Users can view all email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view all email recipients" ON public.email_recipients FOR SELECT USING (true);


--
-- Name: user_activity_logs Users can view their own activity logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view their own activity logs" ON public.user_activity_logs FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: users Users can view their own profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view their own profile" ON public.users FOR SELECT USING ((auth.uid() = id));


--
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: audit_logs audit_logs_insert_admin; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY audit_logs_insert_admin ON public.audit_logs FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users u
  WHERE ((u.id = auth.uid()) AND (u.role = 'admin'::public.user_role)))));


--
-- Name: audit_logs audit_logs_select_admin; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY audit_logs_select_admin ON public.audit_logs FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.users u
  WHERE ((u.id = auth.uid()) AND (u.role = 'admin'::public.user_role)))));


--
-- Name: charging_stations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.charging_stations ENABLE ROW LEVEL SECURITY;

--
-- Name: email_recipients; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.email_recipients ENABLE ROW LEVEL SECURITY;

--
-- Name: holidays; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.holidays ENABLE ROW LEVEL SECURITY;

--
-- Name: notification_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notification_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: notification_schedules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notification_schedules ENABLE ROW LEVEL SECURITY;

--
-- Name: notifications; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

--
-- Name: tax_status_history; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tax_status_history ENABLE ROW LEVEL SECURITY;

--
-- Name: taxes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.taxes ENABLE ROW LEVEL SECURITY;

--
-- Name: teams_channels; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.teams_channels ENABLE ROW LEVEL SECURITY;

--
-- Name: user_activity_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_activity_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

