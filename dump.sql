--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-09-04 15:27:18

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
-- TOC entry 19 (class 2615 OID 16494)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- TOC entry 15 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- TOC entry 18 (class 2615 OID 16624)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- TOC entry 17 (class 2615 OID 16613)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- TOC entry 11 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- TOC entry 9 (class 2615 OID 16605)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- TOC entry 20 (class 2615 OID 16542)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- TOC entry 16 (class 2615 OID 16653)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- TOC entry 6 (class 3079 OID 16689)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16443)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16654)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 3 (class 3079 OID 16432)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1070 (class 1247 OID 16782)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- TOC entry 1094 (class 1247 OID 16923)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- TOC entry 1067 (class 1247 OID 16776)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- TOC entry 1064 (class 1247 OID 16771)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- TOC entry 1205 (class 1247 OID 19900)
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- TOC entry 1100 (class 1247 OID 16965)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- TOC entry 1199 (class 1247 OID 19850)
-- Name: audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.audit_action AS ENUM (
    'create',
    'update',
    'delete'
);


--
-- TOC entry 1160 (class 1247 OID 17358)
-- Name: notification_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.notification_type AS ENUM (
    'auto',
    'manual'
);


--
-- TOC entry 1163 (class 1247 OID 17364)
-- Name: send_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.send_status AS ENUM (
    'success',
    'failed'
);


--
-- TOC entry 1151 (class 1247 OID 17334)
-- Name: station_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.station_status AS ENUM (
    'operating',
    'maintenance',
    'planned'
);


--
-- TOC entry 1166 (class 1247 OID 17370)
-- Name: storage_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.storage_type AS ENUM (
    'local',
    's3',
    'azure'
);


--
-- TOC entry 1157 (class 1247 OID 17350)
-- Name: tax_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tax_status AS ENUM (
    'accounting_review',
    'payment_scheduled',
    'payment_completed'
);


--
-- TOC entry 1154 (class 1247 OID 17342)
-- Name: tax_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tax_type AS ENUM (
    'acquisition',
    'property',
    'other'
);


--
-- TOC entry 1148 (class 1247 OID 17329)
-- Name: user_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_role AS ENUM (
    'viewer',
    'admin'
);


--
-- TOC entry 1115 (class 1247 OID 17190)
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- TOC entry 1131 (class 1247 OID 17150)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- TOC entry 1134 (class 1247 OID 17165)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- TOC entry 1121 (class 1247 OID 17232)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- TOC entry 1118 (class 1247 OID 17203)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- TOC entry 1125 (class 1247 OID 17132)
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


--
-- TOC entry 345 (class 1255 OID 16540)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 345
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 364 (class 1255 OID 16753)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- TOC entry 344 (class 1255 OID 16539)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 344
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 343 (class 1255 OID 16538)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 343
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 346 (class 1255 OID 16597)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 350 (class 1255 OID 16618)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 350
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 347 (class 1255 OID 16599)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 347
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 348 (class 1255 OID 16609)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- TOC entry 349 (class 1255 OID 16610)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- TOC entry 351 (class 1255 OID 16620)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 351
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 293 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


--
-- TOC entry 401 (class 1255 OID 17592)
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
-- TOC entry 405 (class 1255 OID 17596)
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
-- TOC entry 407 (class 1255 OID 17633)
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
-- TOC entry 406 (class 1255 OID 17604)
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
-- TOC entry 402 (class 1255 OID 17593)
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
-- TOC entry 404 (class 1255 OID 17595)
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
-- TOC entry 408 (class 1255 OID 17634)
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
-- TOC entry 400 (class 1255 OID 17585)
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
-- TOC entry 403 (class 1255 OID 17594)
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


--
-- TOC entry 393 (class 1255 OID 17225)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- TOC entry 399 (class 1255 OID 17308)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- TOC entry 395 (class 1255 OID 17241)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- TOC entry 391 (class 1255 OID 17187)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


--
-- TOC entry 390 (class 1255 OID 17182)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- TOC entry 394 (class 1255 OID 17233)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- TOC entry 396 (class 1255 OID 17248)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


--
-- TOC entry 389 (class 1255 OID 17181)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- TOC entry 398 (class 1255 OID 17307)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- TOC entry 388 (class 1255 OID 17179)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- TOC entry 392 (class 1255 OID 17214)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- TOC entry 397 (class 1255 OID 17301)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- TOC entry 377 (class 1255 OID 17110)
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


--
-- TOC entry 370 (class 1255 OID 17031)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- TOC entry 378 (class 1255 OID 17111)
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


--
-- TOC entry 381 (class 1255 OID 17114)
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


--
-- TOC entry 387 (class 1255 OID 17129)
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- TOC entry 367 (class 1255 OID 17005)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- TOC entry 366 (class 1255 OID 17004)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


--
-- TOC entry 365 (class 1255 OID 17003)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- TOC entry 374 (class 1255 OID 17092)
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


--
-- TOC entry 375 (class 1255 OID 17108)
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


--
-- TOC entry 376 (class 1255 OID 17109)
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


--
-- TOC entry 385 (class 1255 OID 17127)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- TOC entry 372 (class 1255 OID 17075)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- TOC entry 371 (class 1255 OID 17037)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


--
-- TOC entry 380 (class 1255 OID 17113)
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- TOC entry 386 (class 1255 OID 17128)
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- TOC entry 373 (class 1255 OID 17091)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- TOC entry 379 (class 1255 OID 17112)
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


--
-- TOC entry 368 (class 1255 OID 17020)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


--
-- TOC entry 384 (class 1255 OID 17125)
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- TOC entry 383 (class 1255 OID 17124)
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- TOC entry 382 (class 1255 OID 17119)
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


--
-- TOC entry 369 (class 1255 OID 17021)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 16525)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 255 (class 1259 OID 16927)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- TOC entry 246 (class 1259 OID 16725)
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 237 (class 1259 OID 16518)
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 250 (class 1259 OID 16814)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 249 (class 1259 OID 16802)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 248 (class 1259 OID 16789)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 281 (class 1259 OID 19905)
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_id text NOT NULL,
    client_secret_hash text NOT NULL,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


--
-- TOC entry 256 (class 1259 OID 16977)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- TOC entry 236 (class 1259 OID 16507)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 235 (class 1259 OID 16506)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 235
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 253 (class 1259 OID 16856)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 254 (class 1259 OID 16874)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 239 (class 1259 OID 16533)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 247 (class 1259 OID 16755)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 252 (class 1259 OID 16841)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 251 (class 1259 OID 16832)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 234 (class 1259 OID 16495)
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 280 (class 1259 OID 19858)
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
-- TOC entry 279 (class 1259 OID 19857)
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
-- TOC entry 269 (class 1259 OID 17397)
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
-- TOC entry 278 (class 1259 OID 17608)
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
-- TOC entry 276 (class 1259 OID 17547)
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
-- TOC entry 275 (class 1259 OID 17532)
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
-- TOC entry 273 (class 1259 OID 17486)
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
-- TOC entry 274 (class 1259 OID 17498)
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
-- TOC entry 271 (class 1259 OID 17447)
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
-- TOC entry 270 (class 1259 OID 17417)
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
-- TOC entry 272 (class 1259 OID 17468)
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
-- TOC entry 277 (class 1259 OID 17559)
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
-- TOC entry 268 (class 1259 OID 17377)
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
-- TOC entry 267 (class 1259 OID 17311)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


--
-- TOC entry 257 (class 1259 OID 17032)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- TOC entry 264 (class 1259 OID 17167)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 17166)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16546)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 261 (class 1259 OID 17138)
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 16588)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 241 (class 1259 OID 16561)
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 260 (class 1259 OID 17093)
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- TOC entry 258 (class 1259 OID 17040)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


--
-- TOC entry 259 (class 1259 OID 17054)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 3612 (class 2604 OID 16510)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 4144 (class 0 OID 16525)
-- Dependencies: 238
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	aceff960-673c-4174-af10-e9027cf43a4c	{"action":"user_confirmation_requested","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-27 13:11:31.19407+00	
00000000-0000-0000-0000-000000000000	6e482aad-a42e-47f7-98a7-03879c01eefb	{"action":"user_signedup","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-08-27 13:11:56.695621+00	
00000000-0000-0000-0000-000000000000	b889e243-92eb-492f-b9c0-7a2267da8e99	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:12:11.86128+00	
00000000-0000-0000-0000-000000000000	11767753-faba-4455-9e10-b8de1beaf489	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:12:59.712671+00	
00000000-0000-0000-0000-000000000000	de7021f3-9ae9-4cfa-9e1c-e75d848ff205	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:19:47.44869+00	
00000000-0000-0000-0000-000000000000	a2cf2e39-7212-4176-82b3-5954db415839	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:22:39.483926+00	
00000000-0000-0000-0000-000000000000	40300251-d0b7-4c2a-bb0e-2c0925a6f1cf	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:25:18.105686+00	
00000000-0000-0000-0000-000000000000	7182656a-7bf0-4f6d-95f1-3bfe39859e0d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:29:58.22896+00	
00000000-0000-0000-0000-000000000000	7ae43279-3b39-46e3-aa98-a24139f412be	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:35:31.028528+00	
00000000-0000-0000-0000-000000000000	3de63793-90df-471b-a0eb-9a68d2bd0867	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:39:55.323648+00	
00000000-0000-0000-0000-000000000000	ee63a755-2e37-4444-ac0f-4ed955e3d68f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:43:50.232949+00	
00000000-0000-0000-0000-000000000000	28ace505-b2d6-4b25-bab4-ecafc475c0f1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:46:31.369513+00	
00000000-0000-0000-0000-000000000000	50b29d46-6c13-4c75-a628-1675b6d9c6ab	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:52:22.592915+00	
00000000-0000-0000-0000-000000000000	0ff604cc-8bb5-4deb-80cd-8e8c5d81d4b9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 13:57:52.866216+00	
00000000-0000-0000-0000-000000000000	50b1e0d7-2ded-4807-b4d6-639b8362caf3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:01:44.333566+00	
00000000-0000-0000-0000-000000000000	c540f9f8-2559-4a20-9005-606422bdea01	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:04:15.735686+00	
00000000-0000-0000-0000-000000000000	13c63bff-6862-4439-9f7f-953692cc9bc9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:05:26.956259+00	
00000000-0000-0000-0000-000000000000	4dd50131-cac1-4e7a-b287-8fc87036503a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:06:48.233576+00	
00000000-0000-0000-0000-000000000000	4c64ed9e-2b39-4c97-ac83-97d472b22e9b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:08:41.719121+00	
00000000-0000-0000-0000-000000000000	adb1994a-ff64-4dd0-984e-77c1c95ae294	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:10:23.42818+00	
00000000-0000-0000-0000-000000000000	97211ca3-fa82-483a-b6b6-9b5a88d77108	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:12:09.092503+00	
00000000-0000-0000-0000-000000000000	44e9caf0-6f41-4842-84c7-2f8581696c6f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:13:25.952928+00	
00000000-0000-0000-0000-000000000000	edf0bc78-a42a-4288-8438-26f4ce64e36b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:15:12.113112+00	
00000000-0000-0000-0000-000000000000	695fa2f6-ed9c-4b6a-8bd8-66187d8f9cf8	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:16:53.659908+00	
00000000-0000-0000-0000-000000000000	9f18c8e9-4847-462e-998d-8e76c2ac81a1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:19:17.00343+00	
00000000-0000-0000-0000-000000000000	6f183abc-d99e-4a76-988e-3770f48ce2bc	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:27:05.641529+00	
00000000-0000-0000-0000-000000000000	9296aff3-b057-4078-a1cc-c40eeaeaaec8	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:29:33.627915+00	
00000000-0000-0000-0000-000000000000	bd232200-0fe6-4724-aad2-86b75520073e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:35:16.416815+00	
00000000-0000-0000-0000-000000000000	fcfc7e15-5a49-456d-be03-8aa7c6f39b73	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:38:01.821054+00	
00000000-0000-0000-0000-000000000000	d4720b7c-461c-4221-b0e3-93f6bad1d9dd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:39:20.036556+00	
00000000-0000-0000-0000-000000000000	04a1133c-8789-4677-b698-2cda541884d4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:41:49.597603+00	
00000000-0000-0000-0000-000000000000	c4d92b31-cf48-40e8-8976-0622f7677ed3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:47:52.262237+00	
00000000-0000-0000-0000-000000000000	8d2307e1-7f01-45d2-9a9c-97a59495dedd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:52:02.762962+00	
00000000-0000-0000-0000-000000000000	31111334-647a-42e6-baa8-ff088095d506	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 14:58:51.259958+00	
00000000-0000-0000-0000-000000000000	4d8f336e-e706-4e60-baf7-0629e1752c6b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:01:13.180688+00	
00000000-0000-0000-0000-000000000000	21b599b5-ae52-490a-a7d1-81bbc995a0d6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:03:35.325425+00	
00000000-0000-0000-0000-000000000000	6b5d5ea8-fa2e-4098-bdfb-efb4e6a8e8ef	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:04:53.834351+00	
00000000-0000-0000-0000-000000000000	20cbe9b0-014c-4821-85af-a6756ca77245	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:08:10.477238+00	
00000000-0000-0000-0000-000000000000	defb801f-b0e7-4da2-a089-c2edf9f6b703	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:14:25.526468+00	
00000000-0000-0000-0000-000000000000	bb3ffcb9-a772-4765-b871-b53af0023bb6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:16:39.154416+00	
00000000-0000-0000-0000-000000000000	6c33f5e8-1110-4baf-9ae8-3c2277cd3734	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:19:31.780394+00	
00000000-0000-0000-0000-000000000000	c7e11260-9866-4b46-a9b3-38043d215af0	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:21:55.025066+00	
00000000-0000-0000-0000-000000000000	ae17d2e9-3581-434c-8678-3139f2f936d1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:24:24.949215+00	
00000000-0000-0000-0000-000000000000	357aa120-e6ee-4241-bbdd-3f51334366be	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:26:24.71655+00	
00000000-0000-0000-0000-000000000000	7e2f0818-cb56-405b-bb59-9f7fc9e3ee1a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:31:31.371319+00	
00000000-0000-0000-0000-000000000000	0048ce32-9ed5-4901-9bfd-b64503f065dd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:33:41.892561+00	
00000000-0000-0000-0000-000000000000	8c32a9ec-39c8-4e14-bb8e-7d8edc005122	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:40:20.737843+00	
00000000-0000-0000-0000-000000000000	2e91e969-8f51-40fb-a4a4-9b4c6732bd3a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:44:56.941336+00	
00000000-0000-0000-0000-000000000000	b0c06921-654e-49f6-93da-a517075472d2	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:57:33.982985+00	
00000000-0000-0000-0000-000000000000	5a11046c-0ef6-4183-a672-1e9b3ff7832c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 15:58:47.632826+00	
00000000-0000-0000-0000-000000000000	ded99f97-9342-4fcd-8994-402fa24f5cc4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:33:09.222777+00	
00000000-0000-0000-0000-000000000000	4df38d83-1fb6-4df6-8d7b-d4a2158534f9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:38:45.206227+00	
00000000-0000-0000-0000-000000000000	43b584b7-68cc-436a-a8db-4446d2038925	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:39:05.373477+00	
00000000-0000-0000-0000-000000000000	bfa8d394-41f1-47a8-9b02-9d415a639a05	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:40:44.173193+00	
00000000-0000-0000-0000-000000000000	fe5f2c68-8042-4bec-a55e-24aa81c23593	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:43:17.494139+00	
00000000-0000-0000-0000-000000000000	bc3f0d51-830b-46cb-aa7d-f050f36af9d5	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:44:38.496753+00	
00000000-0000-0000-0000-000000000000	3d4e9e6e-8c0f-4c75-82e1-f4b1e3084fc0	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:45:48.751339+00	
00000000-0000-0000-0000-000000000000	94183785-ad03-4d0d-8df4-86cdc0f32f93	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:46:59.965097+00	
00000000-0000-0000-0000-000000000000	3b35d1e2-b1e6-43b6-b703-cdc26a941f98	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:49:09.90939+00	
00000000-0000-0000-0000-000000000000	57095c22-b4e1-49a4-a776-a189201f5c7d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:50:46.727798+00	
00000000-0000-0000-0000-000000000000	c03636f1-9285-45ab-a3c6-b9dfec9784c3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:53:35.66338+00	
00000000-0000-0000-0000-000000000000	dfdfc8ab-c7d4-4128-80d7-2c11c699f927	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:56:03.134561+00	
00000000-0000-0000-0000-000000000000	1e0982c6-6475-4d9f-abb4-69f7f34d3ad2	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:59:14.237531+00	
00000000-0000-0000-0000-000000000000	10d65100-5eed-4b5a-a993-d1fc85ad7073	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 16:59:44.73985+00	
00000000-0000-0000-0000-000000000000	5eeaedaf-9311-4cec-a9c0-50dc3ee1917e	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-27 17:01:03.435091+00	
00000000-0000-0000-0000-000000000000	bb767a80-7b60-437b-be55-f6c31400c065	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 17:01:05.259474+00	
00000000-0000-0000-0000-000000000000	822671fb-fec7-4e79-ab4f-a4799a4eb60e	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-27 17:01:08.715539+00	
00000000-0000-0000-0000-000000000000	6c645271-c8e9-4618-bccb-b3b1ebf65eae	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 17:01:15.083242+00	
00000000-0000-0000-0000-000000000000	4e5d3214-ab1a-4a51-9a13-fca157fb5b76	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-27 22:39:09.502444+00	
00000000-0000-0000-0000-000000000000	e2e30f9f-2696-413d-8cfc-c244d0abcf3d	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-27 22:39:09.525111+00	
00000000-0000-0000-0000-000000000000	027941f2-b292-4898-aa44-6292e89fee79	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 22:40:52.123564+00	
00000000-0000-0000-0000-000000000000	598af653-fdb3-4610-a834-f2ad44435367	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 22:41:14.327627+00	
00000000-0000-0000-0000-000000000000	9fcc4ae2-45b2-4542-9029-c25addbef487	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 22:42:36.000504+00	
00000000-0000-0000-0000-000000000000	7f149970-8749-4945-9835-5e4330c0deb4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 22:45:12.259178+00	
00000000-0000-0000-0000-000000000000	fd180dc0-f595-42c6-998b-b9d550358dbe	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:00:37.600493+00	
00000000-0000-0000-0000-000000000000	60583efa-7a12-47c0-93e7-5a2883bf6ba9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:05:33.313059+00	
00000000-0000-0000-0000-000000000000	52f4756f-0782-42c6-897f-70d9822310dd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:08:40.804405+00	
00000000-0000-0000-0000-000000000000	629149a0-b238-400c-b335-a534847fa70e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:12:26.382704+00	
00000000-0000-0000-0000-000000000000	dcc1a4cc-899e-45a4-a25f-f288b8030f7c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:14:39.505648+00	
00000000-0000-0000-0000-000000000000	9eb0a954-6fca-459e-8c39-5fe47b0ad1de	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:18:10.740307+00	
00000000-0000-0000-0000-000000000000	538f74a4-d9fc-4760-96b8-20a53e2693a3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:20:48.051614+00	
00000000-0000-0000-0000-000000000000	a25eb9b0-4eb5-4999-9d1b-c4834e205d6e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:22:47.604108+00	
00000000-0000-0000-0000-000000000000	58b19dc0-4b32-4eed-b54c-b48848a9532c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:25:05.70865+00	
00000000-0000-0000-0000-000000000000	b4638a32-a0df-4239-8069-fe66ad812a69	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:27:02.452655+00	
00000000-0000-0000-0000-000000000000	f419bac9-6d49-492d-b024-1e9a043e21a6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:28:18.576963+00	
00000000-0000-0000-0000-000000000000	03d56ba0-1299-4ef9-89d0-ece442094b75	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:29:38.714322+00	
00000000-0000-0000-0000-000000000000	8c01eee7-4744-46a7-b5b7-2dce39b79175	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:32:01.002027+00	
00000000-0000-0000-0000-000000000000	127ac59d-ec7e-453a-8de8-a53051c48bde	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:33:14.077291+00	
00000000-0000-0000-0000-000000000000	fc495d70-10fc-49cf-8e61-24126d6ad511	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:39:55.617195+00	
00000000-0000-0000-0000-000000000000	653c6e6e-3554-4385-a346-21bb9b50d2d1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:41:35.665377+00	
00000000-0000-0000-0000-000000000000	f5bcc93b-9281-4161-ad00-9d5b88a2eaba	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:43:32.800343+00	
00000000-0000-0000-0000-000000000000	18450935-d951-4a60-be35-893420fa4858	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:46:07.059273+00	
00000000-0000-0000-0000-000000000000	b7695adb-c061-4efd-817a-02c52a3e2653	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-27 23:50:08.161759+00	
00000000-0000-0000-0000-000000000000	4f42877d-053a-42ac-b98f-57fcce4085cf	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-27 23:50:08.163453+00	
00000000-0000-0000-0000-000000000000	1618cfde-e6cc-4a5f-af05-0786b2828769	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:50:29.007992+00	
00000000-0000-0000-0000-000000000000	9ebec767-ff8d-4631-b4bc-d9fc6ce8217e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-27 23:50:39.153422+00	
00000000-0000-0000-0000-000000000000	7a9735b7-5930-4ec5-a479-eb52dac32685	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:12:21.910089+00	
00000000-0000-0000-0000-000000000000	540dd2be-71ca-44c8-b367-a201ac247957	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:12:31.437773+00	
00000000-0000-0000-0000-000000000000	e14d9c0c-afe6-4a68-8bc1-bb09ca14dcee	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:13:33.850227+00	
00000000-0000-0000-0000-000000000000	b95c5a1a-9cc8-40be-b215-1fae8d53f182	{"action":"user_repeated_signup","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-28 00:13:50.653898+00	
00000000-0000-0000-0000-000000000000	756b4bec-457b-4dab-9f43-1afb180c02a1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:14:49.271586+00	
00000000-0000-0000-0000-000000000000	2e6ac46d-9552-4331-974e-590d050268bd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:17:01.801024+00	
00000000-0000-0000-0000-000000000000	3a6d880d-7cd5-483b-b1a4-cfb1a9e0bb3b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:17:41.961051+00	
00000000-0000-0000-0000-000000000000	a815efa9-6bac-4e41-9bf5-20e0b393526b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:20:24.789995+00	
00000000-0000-0000-0000-000000000000	9f755cf2-4e32-4acd-845f-8a0f95c67085	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:21:20.419762+00	
00000000-0000-0000-0000-000000000000	d77793d3-c125-46e9-8a54-49dca07d21d3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 00:23:00.267444+00	
00000000-0000-0000-0000-000000000000	6489d7d4-c786-43ac-8917-9a14701feeb3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:01:47.959393+00	
00000000-0000-0000-0000-000000000000	767d34e0-e964-4bc1-809e-73a049af980e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:02:10.193939+00	
00000000-0000-0000-0000-000000000000	baa994eb-6aeb-4533-bfa7-cfb603c20371	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:02:47.643555+00	
00000000-0000-0000-0000-000000000000	22b505de-9ef9-43ec-ad36-a9436f7adca5	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-28 01:02:58.444681+00	
00000000-0000-0000-0000-000000000000	c49f75a1-33d3-45b4-8878-21b6b6609350	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:05:01.49059+00	
00000000-0000-0000-0000-000000000000	1ca19347-ffb8-4b61-b582-5e85e3a9d0d3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:09:52.374079+00	
00000000-0000-0000-0000-000000000000	8301e736-4804-4770-a18a-67491dcadfce	{"action":"user_confirmation_requested","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-28 01:10:07.140985+00	
00000000-0000-0000-0000-000000000000	c3b6ef11-50f6-40f6-b02f-ac1463542614	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:10:13.230102+00	
00000000-0000-0000-0000-000000000000	271a3feb-9061-44af-a287-f5c36e6acd4d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:12:54.055624+00	
00000000-0000-0000-0000-000000000000	59302c04-2815-4f68-839e-3de52d0194a8	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:17:10.184771+00	
00000000-0000-0000-0000-000000000000	ec5f7692-de0b-4a0e-8dd3-4a3d09b568e0	{"action":"user_signedup","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-08-28 01:18:23.082813+00	
00000000-0000-0000-0000-000000000000	a1fe5d66-6106-4f5a-8448-a28ae9035542	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:18:37.16027+00	
00000000-0000-0000-0000-000000000000	22149a8d-6e8d-4aaf-a321-0b48c7dc16b8	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:23:23.578382+00	
00000000-0000-0000-0000-000000000000	43238d64-ac66-4dbb-872d-42056682395a	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:41:03.204828+00	
00000000-0000-0000-0000-000000000000	38863ff7-e064-40d6-9b7b-cf71720d484f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:46:59.156812+00	
00000000-0000-0000-0000-000000000000	6a85d0f3-7bb2-4285-b57a-fb585f3baac4	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:47:17.398657+00	
00000000-0000-0000-0000-000000000000	a1b01af7-3e6c-458a-bbce-e583dc939ba5	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 01:55:29.388206+00	
00000000-0000-0000-0000-000000000000	d014bf85-eca1-47cb-a6b7-d4e59a47a40b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:05:58.827963+00	
00000000-0000-0000-0000-000000000000	320a8b6a-4e5d-49b2-b87a-3e4b7b7361e6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:07:40.849664+00	
00000000-0000-0000-0000-000000000000	158e468d-ad5d-4eb1-99d8-6f2f3aa52861	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:08:02.668082+00	
00000000-0000-0000-0000-000000000000	5939a8c7-6091-4eee-893b-c3b843df3cd9	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:08:10.384578+00	
00000000-0000-0000-0000-000000000000	d98f0e37-b237-4e61-a913-adf700a9b270	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:08:40.385156+00	
00000000-0000-0000-0000-000000000000	829b45ed-d611-4d19-a247-c645d313ed60	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:09:58.891229+00	
00000000-0000-0000-0000-000000000000	745ac12c-54a2-47fd-a0de-6fc057172c88	{"action":"user_confirmation_requested","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-28 02:16:00.855777+00	
00000000-0000-0000-0000-000000000000	331edc92-de48-45de-a36e-bdcfee37125e	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 02:16:22.487285+00	
00000000-0000-0000-0000-000000000000	207025cd-5c6d-4acb-9acf-59a2ae74e3fd	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 02:16:22.488939+00	
00000000-0000-0000-0000-000000000000	4c8430fd-7065-4b30-9d13-93297bc13d71	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 02:16:23.165904+00	
00000000-0000-0000-0000-000000000000	ac6e3b73-2bec-433d-9e26-22b8834d3236	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 02:16:23.509871+00	
00000000-0000-0000-0000-000000000000	c40ad58b-dae8-49f2-93e1-ba42cce5921e	{"action":"user_confirmation_requested","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-28 02:17:28.547681+00	
00000000-0000-0000-0000-000000000000	ff8cb8d2-d02e-43c5-831b-32a8f3493816	{"action":"user_confirmation_requested","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-28 02:23:23.755329+00	
00000000-0000-0000-0000-000000000000	96c3d265-d035-4653-bc15-2b807fa92c5c	{"action":"user_signedup","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-08-28 02:23:53.376775+00	
00000000-0000-0000-0000-000000000000	d1c649fc-4dee-4340-8be2-8c2217a9e5dc	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"email"}}	2025-08-28 02:23:53.983492+00	
00000000-0000-0000-0000-000000000000	d0593659-e29c-4175-9eec-af49b880817f	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:24:00.663026+00	
00000000-0000-0000-0000-000000000000	da8666e9-9a82-453c-8e92-814d11524b4e	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:24:59.718875+00	
00000000-0000-0000-0000-000000000000	eae3c6a2-868e-4e4f-ac4d-7ca07b6b4dda	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:25:59.934615+00	
00000000-0000-0000-0000-000000000000	7cc3f22b-a817-4514-98db-5ec405e080a9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:35:13.565798+00	
00000000-0000-0000-0000-000000000000	337f1243-79a0-46a1-8ca6-fb61d628c965	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:38:15.912221+00	
00000000-0000-0000-0000-000000000000	ad32a338-5098-4964-b403-2e0fcd4b19c8	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:38:49.524679+00	
00000000-0000-0000-0000-000000000000	64249799-2a88-413c-9bc2-f4a596668771	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:42:16.610607+00	
00000000-0000-0000-0000-000000000000	56721657-d7dd-4763-92d7-bb61749df4bf	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:43:12.438645+00	
00000000-0000-0000-0000-000000000000	32eb79a7-8095-466f-8c64-ad34012a4138	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:48:48.102357+00	
00000000-0000-0000-0000-000000000000	ffe1778b-1c2c-4566-9024-e96919b89a9d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 02:50:28.121968+00	
00000000-0000-0000-0000-000000000000	dbdd1616-a90b-42e9-bc37-d964a5427177	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-28 02:55:37.218423+00	
00000000-0000-0000-0000-000000000000	8639057a-f726-409e-9195-5389fd7fe61e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 03:00:04.548069+00	
00000000-0000-0000-0000-000000000000	80246b03-ffcd-4118-ad7a-ae18c0d33e6c	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 03:58:44.938418+00	
00000000-0000-0000-0000-000000000000	1ba8a504-48c5-480c-b278-d3a9a1cd3b95	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 03:58:44.961949+00	
00000000-0000-0000-0000-000000000000	ea9b9c69-1b64-4b52-b02d-f09f1cf7fbf4	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 03:59:48.522644+00	
00000000-0000-0000-0000-000000000000	2563ce8f-c707-4483-a12b-7333c20f4eb7	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 03:59:48.523374+00	
00000000-0000-0000-0000-000000000000	f5e1cc65-6b5b-4e4a-8973-9598d2c2fc1b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:06:05.375467+00	
00000000-0000-0000-0000-000000000000	697e7add-9757-44cd-97c5-bcfb714d4f89	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:07:34.058446+00	
00000000-0000-0000-0000-000000000000	05e9f176-1f3a-4bc2-a314-992fa3456e2c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:09:04.504696+00	
00000000-0000-0000-0000-000000000000	3176f40a-8e41-400e-8539-d4e3b68ffe8f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:04.452897+00	
00000000-0000-0000-0000-000000000000	fbebd4f5-cd7a-4430-9122-d98fd92b8912	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:10.323316+00	
00000000-0000-0000-0000-000000000000	12885ecc-b3d8-4a5d-ac4e-dcc60a41b4e4	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:30.904157+00	
00000000-0000-0000-0000-000000000000	98ede2df-46c3-4fff-a44a-2f7c8fa05266	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:48.173255+00	
00000000-0000-0000-0000-000000000000	585c8857-2e08-465b-a6ad-8ae4b2c979ad	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-28 04:11:48.227021+00	
00000000-0000-0000-0000-000000000000	5b62ec7e-7c14-4084-a45c-19988cee35ea	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:51.132857+00	
00000000-0000-0000-0000-000000000000	cd5e3249-4754-4568-b745-4a9b9ad5ed4c	{"action":"logout","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-28 04:11:53.44266+00	
00000000-0000-0000-0000-000000000000	c6301430-77a9-4494-b8d8-ca3c6d52c686	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:11:55.812263+00	
00000000-0000-0000-0000-000000000000	49e5ba8d-e836-4dee-8109-a73439bbb9f9	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:12:01.20391+00	
00000000-0000-0000-0000-000000000000	392e1469-4923-424b-ae55-7a3225518bb1	{"action":"logout","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-28 04:41:16.214325+00	
00000000-0000-0000-0000-000000000000	e645cd01-0d47-4ef7-ac21-85e9b88d475f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 04:41:50.284777+00	
00000000-0000-0000-0000-000000000000	fe1072fd-28a2-42ff-91e1-2b8df45054a5	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 04:56:38.532019+00	
00000000-0000-0000-0000-000000000000	3149014a-be93-4c60-af81-e35eccaedc13	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 04:56:38.542574+00	
00000000-0000-0000-0000-000000000000	24336edc-bf8a-421e-914a-c87d1423ae63	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:15:59.732156+00	
00000000-0000-0000-0000-000000000000	190681d6-bd5c-4fe0-a812-3efc1f8cf107	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:17:53.572464+00	
00000000-0000-0000-0000-000000000000	32ec7ef9-e1b2-4e73-9691-8d9a586c3602	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:19:52.514386+00	
00000000-0000-0000-0000-000000000000	779ef369-82b4-4765-98a0-953eef09a399	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:20:18.018134+00	
00000000-0000-0000-0000-000000000000	9014ce4e-282e-455c-a350-e5a015ddcff6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:22:28.823723+00	
00000000-0000-0000-0000-000000000000	e3d7c89c-e08e-4750-8801-5e0fc093d72a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:26:26.116763+00	
00000000-0000-0000-0000-000000000000	7fef91b3-a7c3-4948-8f87-fd77e3f98134	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:28:06.171771+00	
00000000-0000-0000-0000-000000000000	5dc8acc4-d115-4c2f-9f05-b476b5310686	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 05:29:44.139604+00	
00000000-0000-0000-0000-000000000000	3822cdef-0297-4f64-8822-985fd9e2fe44	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 05:29:44.140563+00	
00000000-0000-0000-0000-000000000000	35a5507b-97de-4bbb-9f0d-a3fbb750a2e0	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 05:29:50.667787+00	
00000000-0000-0000-0000-000000000000	3d4f75ea-6c3b-49c4-9b9e-fb98ab6c01f2	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:01:17.64958+00	
00000000-0000-0000-0000-000000000000	d7d3060e-8911-4509-9752-4bdbea8cf69f	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:01:17.671714+00	
00000000-0000-0000-0000-000000000000	862d7a32-4317-4cb6-9877-fd6875cf7d9e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 06:14:08.316198+00	
00000000-0000-0000-0000-000000000000	9ec7cc1a-f6c0-48d8-81fc-e8f2157ce268	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:46:26.224383+00	
00000000-0000-0000-0000-000000000000	e3abaac9-0f86-4195-9ff0-e95080fd4986	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:46:26.23911+00	
00000000-0000-0000-0000-000000000000	4800507c-61d9-42e9-8c2c-066a398d6729	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:52:00.031816+00	
00000000-0000-0000-0000-000000000000	a677bb12-059d-4008-8960-c68997ca6289	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 06:52:00.032798+00	
00000000-0000-0000-0000-000000000000	a665e251-cdc2-4f5c-af18-6f6e6ec34142	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:02:14.714441+00	
00000000-0000-0000-0000-000000000000	090b87af-f2f7-47bf-a936-f97b7629c7c3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:04:17.808325+00	
00000000-0000-0000-0000-000000000000	66fe9409-71d0-4b15-bb71-fc14b06325b6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:06:21.093181+00	
00000000-0000-0000-0000-000000000000	f787aa9d-32ca-483d-87b1-ee79402a64f6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:08:32.52906+00	
00000000-0000-0000-0000-000000000000	b7d219b5-b6c2-436a-9ad1-52ea0712ba0b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:13:07.197322+00	
00000000-0000-0000-0000-000000000000	c186fb63-cb0c-450e-bfa3-543d7915053c	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 07:13:49.924454+00	
00000000-0000-0000-0000-000000000000	0ee68402-773b-4842-ae36-e3758e868d99	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 07:13:49.926431+00	
00000000-0000-0000-0000-000000000000	63668c21-1d99-4a51-a20b-7cae7d195601	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:18:09.482159+00	
00000000-0000-0000-0000-000000000000	1cb177a7-033f-4333-97c1-36e82cbe0e5f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:24:58.774421+00	
00000000-0000-0000-0000-000000000000	b0677268-faa6-446f-8b82-262534e802ab	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:29:45.649278+00	
00000000-0000-0000-0000-000000000000	4aca1551-faae-46a3-bfe4-4e02ac69c1c4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:33:36.142092+00	
00000000-0000-0000-0000-000000000000	4ea1f0dc-ea1c-49d7-94bf-cf5c8ecf9bfa	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:36:36.365116+00	
00000000-0000-0000-0000-000000000000	4ac238cb-6b41-4298-94a0-d8152d68e7a6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:39:19.339338+00	
00000000-0000-0000-0000-000000000000	0f8e1f71-2486-4b31-9bf0-ae912206f9fc	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:40:49.931198+00	
00000000-0000-0000-0000-000000000000	441c2ba8-8d08-44e5-b234-75d394585af7	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 07:54:40.23443+00	
00000000-0000-0000-0000-000000000000	5b2d1d69-84b6-4671-8693-ed2e89c56748	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 08:01:28.053114+00	
00000000-0000-0000-0000-000000000000	2fa2b392-56d8-40f9-bba7-080d435be09f	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 08:01:28.054154+00	
00000000-0000-0000-0000-000000000000	8578f134-07d5-4a84-83d4-5681930f724f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 08:04:09.994535+00	
00000000-0000-0000-0000-000000000000	252ff8cc-a023-4f11-86b9-532398f587ee	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 08:17:08.927447+00	
00000000-0000-0000-0000-000000000000	933bcf2b-9293-4833-b780-c3909af133cb	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 08:17:08.936521+00	
00000000-0000-0000-0000-000000000000	1c1c9cb0-81e9-49e9-9ab8-65784c69320d	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 09:51:32.38028+00	
00000000-0000-0000-0000-000000000000	fb10f841-c735-477b-a356-3dd13e8142c2	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 09:51:32.398679+00	
00000000-0000-0000-0000-000000000000	e510fd1c-19f6-45a9-8f67-35d2d3b8bf28	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 09:51:36.591127+00	
00000000-0000-0000-0000-000000000000	a7ba08a6-2376-4b39-959b-7b7c944454ad	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 10:22:12.817501+00	
00000000-0000-0000-0000-000000000000	0e173286-744f-4f83-b31b-569b6a45b325	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 10:22:12.834399+00	
00000000-0000-0000-0000-000000000000	c916d928-84d8-4e43-bf24-c1910175b4bf	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:28:29.811491+00	
00000000-0000-0000-0000-000000000000	85eba703-8fd9-4c2a-b063-3f099596bfcc	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 10:31:04.249995+00	
00000000-0000-0000-0000-000000000000	7fdf0db1-6778-4378-abbd-b938c527daa9	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 10:31:04.251988+00	
00000000-0000-0000-0000-000000000000	d54dd685-ad9c-4eca-868a-450dbe5744bc	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:31:10.362002+00	
00000000-0000-0000-0000-000000000000	4bf9cf6b-73d3-428c-95fc-5dbaf70011ec	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:34:38.708283+00	
00000000-0000-0000-0000-000000000000	b71dad66-61ed-4678-ae85-aef59e1a99e7	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:35:48.390052+00	
00000000-0000-0000-0000-000000000000	dffc7cb9-f19a-4931-a988-bd7c726be2f1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:38:16.316341+00	
00000000-0000-0000-0000-000000000000	30b977f9-c656-43f3-b83e-87ddf083675c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:42:55.367603+00	
00000000-0000-0000-0000-000000000000	f6f7d3f6-3555-4a15-b21e-38a44eb2787a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:45:06.255615+00	
00000000-0000-0000-0000-000000000000	14609c3b-1aee-48e6-9645-da57624e0b4f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:47:20.690326+00	
00000000-0000-0000-0000-000000000000	8d7903a8-bc3a-47e5-b0d5-a85cd7c14790	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:49:18.753551+00	
00000000-0000-0000-0000-000000000000	56f2022c-dcb6-4e6e-922f-3b0783a1d180	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:52:11.253959+00	
00000000-0000-0000-0000-000000000000	3c26b4a3-f852-41aa-bb08-ef81870961cd	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:54:09.918025+00	
00000000-0000-0000-0000-000000000000	7adf2a88-dfca-4b0a-82f8-f9016f4582b3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:56:27.590279+00	
00000000-0000-0000-0000-000000000000	78df4cd2-0ca1-4ad0-86c0-adbbdd1f309f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 10:58:52.40921+00	
00000000-0000-0000-0000-000000000000	b01dff0d-6483-4ff2-97e3-86ceff0e9da3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:00:59.309482+00	
00000000-0000-0000-0000-000000000000	0816ac99-501a-4be0-846c-16828ec7919f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:07:40.217425+00	
00000000-0000-0000-0000-000000000000	71cae2c5-507e-428e-8b99-9262b77b1474	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:46:21.183396+00	
00000000-0000-0000-0000-000000000000	b762b7fc-d4dc-42a8-8451-f853b3506d0b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:50:36.81583+00	
00000000-0000-0000-0000-000000000000	bc2812e7-cb78-4a18-9ea4-549693a5e44d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:53:46.969006+00	
00000000-0000-0000-0000-000000000000	c60ebab1-5b4a-4274-b256-819ce816b38f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:56:00.274855+00	
00000000-0000-0000-0000-000000000000	dadc430e-edb2-41fd-8a9a-c9ddbc3d0273	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 11:58:25.036215+00	
00000000-0000-0000-0000-000000000000	cec1726b-b0be-45f5-bf08-7541f4b0acbb	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:00:52.53583+00	
00000000-0000-0000-0000-000000000000	f520ef13-6214-48ba-af77-820dac4acd9e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:02:24.095229+00	
00000000-0000-0000-0000-000000000000	c0ed84fd-b2cd-4894-b797-7fd12cf71257	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:07:13.487945+00	
00000000-0000-0000-0000-000000000000	c7600407-1a9a-4b41-8d7b-e9849a151da2	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:09:06.941992+00	
00000000-0000-0000-0000-000000000000	8e85816a-3f1d-4068-872f-cd1842a1b3d3	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:09:55.877214+00	
00000000-0000-0000-0000-000000000000	5d66a381-38e3-4121-b8d8-adb0105ca93e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:12:27.04279+00	
00000000-0000-0000-0000-000000000000	4e8b23f7-be1f-4ca8-8bb9-aa32f49b7c01	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:14:27.443058+00	
00000000-0000-0000-0000-000000000000	85670bf8-334d-4282-ad23-7f769122422f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:16:31.670555+00	
00000000-0000-0000-0000-000000000000	615e67bc-b15f-4668-9c40-a008fad4828a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:18:39.379693+00	
00000000-0000-0000-0000-000000000000	b2ee28f0-f35b-47c7-bfb3-f949c6a18b25	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:19:48.301526+00	
00000000-0000-0000-0000-000000000000	070fbcba-33f0-4229-82c2-f1df8b65f245	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:41:10.090817+00	
00000000-0000-0000-0000-000000000000	6d35f501-ec7d-465c-95c1-007ac70f7d73	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:42:15.919473+00	
00000000-0000-0000-0000-000000000000	7d942623-e37b-4edd-a514-c65d8cebcaad	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:44:53.018426+00	
00000000-0000-0000-0000-000000000000	1e594cad-ff76-4b71-92d8-6e5e1ae2c79a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:46:37.040064+00	
00000000-0000-0000-0000-000000000000	7d74fb8b-9cdf-48bf-a968-5f6305651e8d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:49:32.762549+00	
00000000-0000-0000-0000-000000000000	fafda8d5-7050-4578-b131-3e00de45c3e1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:54:16.057671+00	
00000000-0000-0000-0000-000000000000	0d3b70d2-c5af-4585-a18f-e0b2ab48edb6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:56:57.503434+00	
00000000-0000-0000-0000-000000000000	7f3c00d9-071d-40f8-b48f-20af8003d2da	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 12:59:17.092559+00	
00000000-0000-0000-0000-000000000000	21a86a2c-88a7-46d5-81d4-1d3dd13d091f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:01:02.465273+00	
00000000-0000-0000-0000-000000000000	3a360b6c-f2a9-455d-87e7-150f42058c29	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:02:23.954333+00	
00000000-0000-0000-0000-000000000000	bbd2b14a-ca9d-44ca-8217-9f3451884324	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:03:52.668685+00	
00000000-0000-0000-0000-000000000000	6ab4781f-2c2c-464a-a189-e606c3f91181	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:05:15.116573+00	
00000000-0000-0000-0000-000000000000	195f800b-1d26-4c6f-9db3-63cbefb3639b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:05:46.363992+00	
00000000-0000-0000-0000-000000000000	0b754fc1-a5d8-4289-ab6d-95454ac7efb3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:06:48.273056+00	
00000000-0000-0000-0000-000000000000	4f2ca7ac-caa7-4b7f-a391-6fb943e2ce5d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:08:26.125659+00	
00000000-0000-0000-0000-000000000000	58dd17a7-94af-4b9e-858c-3519a7a85a4e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:10:01.601549+00	
00000000-0000-0000-0000-000000000000	ac5daf4a-2207-4df9-8a74-2ebf55ee7c94	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:13:37.472537+00	
00000000-0000-0000-0000-000000000000	6cb68cb0-c941-4d62-bafd-650d7e716cdc	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:15:41.214351+00	
00000000-0000-0000-0000-000000000000	8cde7dfa-9256-45d4-9c67-6cfdd9fe0af4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:18:43.382327+00	
00000000-0000-0000-0000-000000000000	2de4d77b-7b70-4632-8d5a-3e0c2daa71a3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:23:13.324415+00	
00000000-0000-0000-0000-000000000000	5500e13a-24ec-4641-b9ea-ccb163ac7760	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:26:46.28596+00	
00000000-0000-0000-0000-000000000000	26c33dac-7263-4657-b257-0aacd14434a0	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:28:50.019135+00	
00000000-0000-0000-0000-000000000000	e1a68a6a-cdf0-4668-8b6a-304b52798ad7	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:35:57.080914+00	
00000000-0000-0000-0000-000000000000	c2217ce3-533d-4933-93d9-d406fe199713	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:41:18.848409+00	
00000000-0000-0000-0000-000000000000	dd75c46f-7a3d-4b89-adde-494534b6faa5	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:49:11.128312+00	
00000000-0000-0000-0000-000000000000	d3599b40-89ad-4ed3-9a55-6cc5831c56a4	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:49:42.27408+00	
00000000-0000-0000-0000-000000000000	a02dc781-72e5-4641-abe8-6f54d4682afe	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:50:07.894139+00	
00000000-0000-0000-0000-000000000000	7ea00a38-320c-4500-8de9-7266f016edc6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:51:10.698686+00	
00000000-0000-0000-0000-000000000000	a00bf2b6-994b-4c86-a223-ce76d61eefc9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:52:17.857374+00	
00000000-0000-0000-0000-000000000000	c75a712a-3b2b-4aa2-ae4c-2b3e8d4d580a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:52:41.288338+00	
00000000-0000-0000-0000-000000000000	2511165c-488d-4042-a74d-00c51846f255	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 13:54:39.056835+00	
00000000-0000-0000-0000-000000000000	0d53a5b3-51e9-4c76-ae4e-bfb9e0d658a7	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 13:59:01.894954+00	
00000000-0000-0000-0000-000000000000	3a51ddaa-cce5-4405-a3de-e6165d3b0ada	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 13:59:01.899617+00	
00000000-0000-0000-0000-000000000000	cf874ed0-3966-49f6-bafc-ee7d6bb2cba9	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 13:59:02.665108+00	
00000000-0000-0000-0000-000000000000	a23a7809-ccd8-4449-a296-14eb5eb15c7f	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 13:59:02.915151+00	
00000000-0000-0000-0000-000000000000	b5c60aa1-dbf3-42d2-b67e-47930ffb480c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 14:04:23.938896+00	
00000000-0000-0000-0000-000000000000	d973e7db-ffcf-4587-af33-7f426dcef18c	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 23:18:08.486385+00	
00000000-0000-0000-0000-000000000000	4bc94218-4f51-4249-85a8-a64746dcec71	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 23:18:08.513345+00	
00000000-0000-0000-0000-000000000000	f6429a20-92c9-4d84-b1bb-c41835aa0ec0	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 23:18:10.231028+00	
00000000-0000-0000-0000-000000000000	100ddf0b-59a4-4cf6-a0dd-c8ccbe59964b	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-28 23:18:10.399642+00	
00000000-0000-0000-0000-000000000000	b93b42ac-d0ef-4109-bdfd-02f78efe9f25	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 23:18:15.421466+00	
00000000-0000-0000-0000-000000000000	ca66fe26-cf8e-4d8f-b040-054d1321ea86	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 23:19:37.34602+00	
00000000-0000-0000-0000-000000000000	04f1c283-be8b-499a-9f20-b44b83ea2393	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 23:24:44.309389+00	
00000000-0000-0000-0000-000000000000	6d7b9e50-10a5-4acc-994d-d4599703883f	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-28 23:25:32.144063+00	
00000000-0000-0000-0000-000000000000	9d052790-9d39-4e56-898b-ac637d4ea246	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:43:01.827424+00	
00000000-0000-0000-0000-000000000000	bcd3a666-ced8-4c17-9040-76af6b5706f1	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:43:01.843729+00	
00000000-0000-0000-0000-000000000000	e4eae06a-3479-4ac8-874e-973cbd8b7fd6	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:43:04.084196+00	
00000000-0000-0000-0000-000000000000	54ab0c74-0ab3-497d-9bc1-a9070b749042	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:43:04.092421+00	
00000000-0000-0000-0000-000000000000	2b3e6fe4-78c9-4ba4-891f-e6855784b422	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 00:43:25.553985+00	
00000000-0000-0000-0000-000000000000	78a50f65-fcfb-4dee-82c8-f64b841a9b68	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 00:43:52.05031+00	
00000000-0000-0000-0000-000000000000	eb0e3487-5bc2-4b62-818a-839878b38282	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 00:44:09.426863+00	
00000000-0000-0000-0000-000000000000	319225e7-5aad-433d-85c4-d18ac861c808	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:45:50.230905+00	
00000000-0000-0000-0000-000000000000	f5a51a6f-be31-4011-910e-c8dec57a7ebd	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 00:45:50.232232+00	
00000000-0000-0000-0000-000000000000	85b018d4-cd55-4870-8fa6-79758a6c0791	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 00:48:35.464266+00	
00000000-0000-0000-0000-000000000000	0a0e4f16-0f92-4459-994b-d13cdc9dc498	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 00:51:20.795691+00	
00000000-0000-0000-0000-000000000000	344c6723-8bd6-4eb9-a092-54b35778d289	{"action":"logout","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-29 01:22:22.671118+00	
00000000-0000-0000-0000-000000000000	4c08d9e4-ebe6-4437-b020-c34f061f0d4f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 01:22:31.882641+00	
00000000-0000-0000-0000-000000000000	8c5048e6-17d4-4f9e-a221-9ce15e38b775	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 01:38:35.572118+00	
00000000-0000-0000-0000-000000000000	298759f9-19b5-46a1-bfd9-3369f64a1781	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 01:40:57.45014+00	
00000000-0000-0000-0000-000000000000	0c90b8f4-246a-4e62-9202-249e69027893	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 01:49:50.560854+00	
00000000-0000-0000-0000-000000000000	b2061193-a43c-4064-b7aa-cf0c7b14b729	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 01:52:38.390199+00	
00000000-0000-0000-0000-000000000000	50f32d4c-f7b3-4628-b11f-b5018e0feffa	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 01:52:38.402637+00	
00000000-0000-0000-0000-000000000000	764f5a9a-073c-487b-8f58-b2ed33d8488b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 01:53:42.262159+00	
00000000-0000-0000-0000-000000000000	0132f559-bc42-4f01-a4d7-47a04da9d7af	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:02:02.599128+00	
00000000-0000-0000-0000-000000000000	2827d597-0b2b-45fe-9ae1-edf38a3c68ba	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:05:06.20594+00	
00000000-0000-0000-0000-000000000000	cbaea062-26c6-4142-ad1a-da8f421ec79c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:06:39.774225+00	
00000000-0000-0000-0000-000000000000	f86a29d5-e764-4ff5-815f-a2f30df57bb7	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:08:27.338607+00	
00000000-0000-0000-0000-000000000000	1e979a61-cd85-424d-9d45-f8f35901d419	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:10:08.559856+00	
00000000-0000-0000-0000-000000000000	cf5e6a84-3b52-4f2b-96dd-a15b37349e60	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:13:08.047517+00	
00000000-0000-0000-0000-000000000000	61f6aef3-81ff-4e54-8d12-f6265395f61e	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:15:20.444836+00	
00000000-0000-0000-0000-000000000000	8c7e2292-1737-4cf1-88dd-6b709c7121a3	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:18:10.940357+00	
00000000-0000-0000-0000-000000000000	fb50ffb6-2d71-4fdb-b870-7d3259657f7c	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:20:01.416858+00	
00000000-0000-0000-0000-000000000000	75240117-c23a-4e10-9a6c-73af6eb4381a	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 02:22:33.056659+00	
00000000-0000-0000-0000-000000000000	c17fa99d-8aff-465a-8364-b296ee4d964b	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 02:22:33.063598+00	
00000000-0000-0000-0000-000000000000	286edc0f-95a8-4ddf-8d92-ab76dbde351a	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:23:43.321722+00	
00000000-0000-0000-0000-000000000000	988db918-dbbd-497d-b4a5-8ce71a8a93d8	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:28:05.923372+00	
00000000-0000-0000-0000-000000000000	bdb5fb48-60f0-485d-905c-64cc9a18395b	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:29:28.887677+00	
00000000-0000-0000-0000-000000000000	037e57f2-128b-4e30-bb0b-4fdeabac0e10	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:31:55.02182+00	
00000000-0000-0000-0000-000000000000	9b9c8b3c-a7f9-41de-93a6-8041f8370f80	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 02:32:53.603528+00	
00000000-0000-0000-0000-000000000000	040964f1-7b82-4437-998a-ed63e4d7f9d0	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 02:54:14.12481+00	
00000000-0000-0000-0000-000000000000	48a659da-7418-49c3-9f5c-732e8c174e14	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 02:54:14.137381+00	
00000000-0000-0000-0000-000000000000	91c6081a-d8d3-4fd6-85c5-d7d1368d4563	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:28:27.151134+00	
00000000-0000-0000-0000-000000000000	c994f753-7759-4a40-8ab6-0e397fbeec75	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:28:27.168352+00	
00000000-0000-0000-0000-000000000000	4584c881-e182-4185-bbf3-a8bf4cfb8012	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:33:49.089663+00	
00000000-0000-0000-0000-000000000000	ef2d768b-8833-4c2a-bba7-1cd4bd7fc742	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:33:49.093176+00	
00000000-0000-0000-0000-000000000000	23ae1e13-e39e-4b75-bf48-97dae605aba9	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:54:16.255421+00	
00000000-0000-0000-0000-000000000000	1d2c6f8c-1ca7-437a-b648-d87528477308	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 03:54:16.265981+00	
00000000-0000-0000-0000-000000000000	cf80fcbc-147a-49bc-960e-e4539df6d800	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:02:37.337248+00	
00000000-0000-0000-0000-000000000000	529c71b7-7bdd-4815-9620-33bd5a41730b	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:02:37.346134+00	
00000000-0000-0000-0000-000000000000	7ae44159-94e2-4df3-a4b1-65aaffd392ee	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:08:34.250582+00	
00000000-0000-0000-0000-000000000000	3826c84a-ee74-4117-be6e-3aa264cf12c6	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:11:52.944562+00	
00000000-0000-0000-0000-000000000000	bd13342b-0b6b-4877-912b-bfb9b1be0cc1	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:14:27.999402+00	
00000000-0000-0000-0000-000000000000	a3284fe3-c4da-40e4-9fd4-7302bc6be40d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:17:35.728195+00	
00000000-0000-0000-0000-000000000000	cc4d8eda-d749-4f18-a127-9879e7f5b424	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:20:17.386458+00	
00000000-0000-0000-0000-000000000000	577a551a-fda2-4077-b01c-8fa6aad42117	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:20:41.322974+00	
00000000-0000-0000-0000-000000000000	cc48880c-937b-43c0-893f-bc7aa2cbb8e9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:24:40.256436+00	
00000000-0000-0000-0000-000000000000	0d3e7462-75d3-4852-8ffa-8423b8a6ab46	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:26:38.795372+00	
00000000-0000-0000-0000-000000000000	351834a5-ecfc-43cd-8c15-56e1e450945c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:26:38.797943+00	
00000000-0000-0000-0000-000000000000	a7d5d60f-e943-443e-a101-0212ceb992b0	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:26:43.778501+00	
00000000-0000-0000-0000-000000000000	8b291414-38ef-4838-ab27-f23ffbab4c3d	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:27:05.663412+00	
00000000-0000-0000-0000-000000000000	48ce790e-14d8-4197-a515-7ba4c5815877	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:29:52.108499+00	
00000000-0000-0000-0000-000000000000	f283096c-8e8c-4052-b6d2-575d28a2a4ae	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:33:52.009857+00	
00000000-0000-0000-0000-000000000000	4837259a-ab51-4d6a-a40e-c1cf4f628ff3	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:33:52.017674+00	
00000000-0000-0000-0000-000000000000	7b0e39b1-8c98-4231-9c7e-0bf801527138	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:35:03.700006+00	
00000000-0000-0000-0000-000000000000	1310b55c-0a9c-4c25-bc90-720f31646c35	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:54:36.267682+00	
00000000-0000-0000-0000-000000000000	233636e1-26b6-469e-82e5-6c34ad9fcadc	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 04:54:36.274354+00	
00000000-0000-0000-0000-000000000000	377d7b46-075f-484f-9b7a-f9fa628b0432	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 04:55:04.767977+00	
00000000-0000-0000-0000-000000000000	50f6f54c-1f97-489f-91d4-cdca22fe2db2	{"action":"logout","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-08-29 04:55:12.583154+00	
00000000-0000-0000-0000-000000000000	5f9ff04d-beeb-4e0e-9f15-6828eef02c85	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 05:15:42.173028+00	
00000000-0000-0000-0000-000000000000	ff6d5d92-8ce2-4c9e-a6fd-0c618586aae7	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:27:08.832554+00	
00000000-0000-0000-0000-000000000000	811f2533-bb2d-4ff9-a53b-c06fc5eadea5	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:27:08.836569+00	
00000000-0000-0000-0000-000000000000	afd56573-4180-42e8-890f-b54895271cef	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:33:57.710366+00	
00000000-0000-0000-0000-000000000000	8e4b5b2d-ad0d-496a-98f7-d5368848b436	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:33:57.713007+00	
00000000-0000-0000-0000-000000000000	e65c2eb7-d236-4441-a0a0-e6d9513210c2	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:35:09.376699+00	
00000000-0000-0000-0000-000000000000	f9ecd43e-0f55-4422-9bcc-159c695652c9	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 05:35:09.377872+00	
00000000-0000-0000-0000-000000000000	e90bb9de-8d80-4151-ba84-860812cc1ba4	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:14:39.930903+00	
00000000-0000-0000-0000-000000000000	50ca89a9-30ae-44a6-9fd4-6a34500dfd42	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:14:39.959188+00	
00000000-0000-0000-0000-000000000000	f6efbaa1-d943-4111-92e5-20d0c94d125a	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:19:46.171663+00	
00000000-0000-0000-0000-000000000000	a29dbf6b-1ecd-478b-a3d0-b12ae678161e	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:19:46.174142+00	
00000000-0000-0000-0000-000000000000	d50d3d3b-cf76-4693-9e32-e15239d93725	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:27:11.248077+00	
00000000-0000-0000-0000-000000000000	f964898b-2982-4927-b2c9-c06412d57c87	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:27:11.257923+00	
00000000-0000-0000-0000-000000000000	a08b01ee-4820-466b-ac9d-0bb4ca4baa1c	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:59:09.442861+00	
00000000-0000-0000-0000-000000000000	195be2bc-2dc5-463b-99f8-2aa0df5c7247	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 06:59:09.460401+00	
00000000-0000-0000-0000-000000000000	e9ce92e3-4e73-4304-9e7b-9417703c4bfa	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 07:19:49.013749+00	
00000000-0000-0000-0000-000000000000	652ea538-f05e-4fc7-aaad-227b316ba53e	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 07:19:49.028115+00	
00000000-0000-0000-0000-000000000000	738af020-e08a-4699-b812-423c605a7ded	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 07:27:14.188336+00	
00000000-0000-0000-0000-000000000000	eea138be-8c7f-4d4b-b40f-f784a59de87b	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 07:27:14.202673+00	
00000000-0000-0000-0000-000000000000	97c7f084-fd7b-435a-a48d-36a82fe966f0	{"action":"token_refreshed","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 08:27:17.275387+00	
00000000-0000-0000-0000-000000000000	dcd83d9f-2895-4c85-8669-2f8cc9c3ead4	{"action":"token_revoked","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-29 08:27:17.295124+00	
00000000-0000-0000-0000-000000000000	6888039f-2ca6-4da8-8d03-b01619372c36	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-29 15:26:39.443371+00	
00000000-0000-0000-0000-000000000000	9d0f8d46-a2d3-46f7-a1fe-68859eb105bc	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:13:49.681654+00	
00000000-0000-0000-0000-000000000000	cfaaefe9-6c2e-4f81-9414-6573b6791aa4	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:13:49.703458+00	
00000000-0000-0000-0000-000000000000	bd52bb91-324b-4a99-8920-01a6dde30031	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-31 04:14:02.978981+00	
00000000-0000-0000-0000-000000000000	07c8a4a8-77d0-4e09-a29b-2a9c6494487b	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 07:45:57.438358+00	
00000000-0000-0000-0000-000000000000	1bb731e0-9c0a-46c3-a38a-1a62fab22746	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 07:45:57.459325+00	
00000000-0000-0000-0000-000000000000	8ca5a995-5b17-4f4b-b36c-1c8a8691bad9	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 07:46:03.40856+00	
00000000-0000-0000-0000-000000000000	7b8d44d2-0043-4648-b85e-825880d4f7ff	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 07:46:36.823123+00	
00000000-0000-0000-0000-000000000000	9d9faeb3-dc21-4a16-9dff-8b73b92f33f8	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 07:46:36.823918+00	
00000000-0000-0000-0000-000000000000	d4a50f37-8b86-4d73-ad0c-d1a010c4599d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 07:47:02.021778+00	
00000000-0000-0000-0000-000000000000	302b0a0f-df6e-478b-b836-ed62338a0117	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 07:47:33.374674+00	
00000000-0000-0000-0000-000000000000	dcd80db9-bf10-41b1-956b-231fabdcca86	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 07:51:55.016865+00	
00000000-0000-0000-0000-000000000000	0814578d-de09-4cd6-98fd-7cfdd6075b2d	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 07:52:38.076753+00	
00000000-0000-0000-0000-000000000000	b462b3bc-57a0-467c-94a2-be4f00e34436	{"action":"user_repeated_signup","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-01 08:23:13.423382+00	
00000000-0000-0000-0000-000000000000	2811517a-1fe5-4cd2-8f93-b0604935fa6e	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 08:23:52.533591+00	
00000000-0000-0000-0000-000000000000	81de2d54-4824-498b-978a-c229005020af	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 08:40:20.623532+00	
00000000-0000-0000-0000-000000000000	4e19ece3-7b1b-4d48-ba11-aaa6a36ec036	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 08:51:34.138482+00	
00000000-0000-0000-0000-000000000000	ed72446f-c2de-40b6-a2c0-e52696201992	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:05:31.551366+00	
00000000-0000-0000-0000-000000000000	d618f3c4-b0a9-464c-8e35-3cda51b99a68	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:12:49.850052+00	
00000000-0000-0000-0000-000000000000	8e7fa963-4598-44b8-a524-21f41067d74a	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 09:25:46.288245+00	
00000000-0000-0000-0000-000000000000	48c17353-dc67-438a-94e5-8535485213ee	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 09:25:46.297944+00	
00000000-0000-0000-0000-000000000000	b57ba5eb-5d24-46fd-9793-e815200a1184	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:25:57.478275+00	
00000000-0000-0000-0000-000000000000	c2437d82-a76a-4778-b63c-82f3d858d23f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:32:31.63422+00	
00000000-0000-0000-0000-000000000000	40cd2dc3-bc40-4dbb-8347-cb41a24d9f2c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:37:02.335899+00	
00000000-0000-0000-0000-000000000000	1f413f9a-8154-499b-aefc-6ad768a65b0a	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:42:38.532542+00	
00000000-0000-0000-0000-000000000000	f0fc55c4-0d50-471f-b704-5cc755167051	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 09:53:18.212796+00	
00000000-0000-0000-0000-000000000000	7a47ae9e-fbef-46ed-b61c-b0553c5f7225	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 10:04:34.306353+00	
00000000-0000-0000-0000-000000000000	0e347513-fe61-4338-bd00-86b21a2c176c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 10:04:34.323508+00	
00000000-0000-0000-0000-000000000000	bc0c9a16-1a2a-424c-8f61-2848d410ae1c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:04:37.399946+00	
00000000-0000-0000-0000-000000000000	c264a4c5-48c7-408e-84b3-9f2e7d779592	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:11:27.139549+00	
00000000-0000-0000-0000-000000000000	63b198d3-e7e6-4f54-9402-8f2c8a76398a	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:15:36.57396+00	
00000000-0000-0000-0000-000000000000	2b9d9390-9389-43a9-a7bc-848ed2f2405d	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:24:29.470296+00	
00000000-0000-0000-0000-000000000000	dc42ae3d-8671-4bf9-a3e2-49a964ab2fe7	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:29:27.222833+00	
00000000-0000-0000-0000-000000000000	82272437-0a2f-4489-9ffa-af168c1efc81	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:36:09.329281+00	
00000000-0000-0000-0000-000000000000	f70664f9-8ba5-413d-83b6-fc6877c88e57	{"action":"logout","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-09-01 10:36:42.696464+00	
00000000-0000-0000-0000-000000000000	ae86b823-e9bd-4fad-a180-8d071cf45e16	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-01 10:36:55.968444+00	
00000000-0000-0000-0000-000000000000	60d50754-2462-4163-9b08-5751a80d1e92	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 11:36:58.919047+00	
00000000-0000-0000-0000-000000000000	3892d509-7a69-4a2e-a914-e24faabd0e6b	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 11:36:58.939942+00	
00000000-0000-0000-0000-000000000000	e58bdfab-acd4-422c-8ec5-ed99a6420865	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 12:37:02.011256+00	
00000000-0000-0000-0000-000000000000	91ed1629-14d9-48fb-b74a-0449ff61e892	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 12:37:02.026539+00	
00000000-0000-0000-0000-000000000000	cb3ae4b9-2020-4494-a215-1b0defaaabab	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 13:37:04.94019+00	
00000000-0000-0000-0000-000000000000	aab357da-ff97-4a3b-ae58-0d60103c86ff	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 13:37:04.956797+00	
00000000-0000-0000-0000-000000000000	31bef13d-cc4e-4471-afea-902fc3ec7794	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 14:37:08.027735+00	
00000000-0000-0000-0000-000000000000	205672be-5eb9-4d31-aad2-c46cf42497ac	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 14:37:08.043275+00	
00000000-0000-0000-0000-000000000000	523aa299-de34-4391-85e9-1c3334261aff	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 15:37:11.867342+00	
00000000-0000-0000-0000-000000000000	b3fd7ece-9f59-4a2e-bfd2-c3a3c876cad4	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 15:37:11.886466+00	
00000000-0000-0000-0000-000000000000	f798c8ce-5097-4611-b709-29dda12236cf	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 16:37:14.8483+00	
00000000-0000-0000-0000-000000000000	482af6bc-f313-4648-b85d-aa18daa36ce1	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 16:37:14.869659+00	
00000000-0000-0000-0000-000000000000	3201323c-0b96-437f-91c7-538f5ca528d4	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 17:37:17.89212+00	
00000000-0000-0000-0000-000000000000	d9dca8c0-e179-439f-bf01-4eee0db6232d	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 17:37:17.911345+00	
00000000-0000-0000-0000-000000000000	1fb4cda0-9892-4ae9-b5c1-ec5105328881	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 18:37:20.829495+00	
00000000-0000-0000-0000-000000000000	d4668cc5-ebaf-4097-8763-be5093044cbe	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 18:37:20.845482+00	
00000000-0000-0000-0000-000000000000	d4630ffc-36db-4eb6-81cd-dc70a20bfcca	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 19:37:23.731184+00	
00000000-0000-0000-0000-000000000000	b0efa590-0ced-4045-8565-8956c84164ee	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 19:37:23.746368+00	
00000000-0000-0000-0000-000000000000	28fb0b67-4935-4a96-bee8-c34e212a9493	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 20:37:26.649325+00	
00000000-0000-0000-0000-000000000000	37637fd9-6429-4101-b88f-7cef8a91f36c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 20:37:26.668899+00	
00000000-0000-0000-0000-000000000000	bb924e78-d24e-4f39-8c0e-f8bacdc89399	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 21:37:30.771752+00	
00000000-0000-0000-0000-000000000000	16b45348-e244-47b3-b58a-1244387a5c43	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 21:37:30.791722+00	
00000000-0000-0000-0000-000000000000	90ae2b7b-96ce-42ab-8752-cb61d959b122	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 22:37:33.66447+00	
00000000-0000-0000-0000-000000000000	8686baa5-e435-49bf-a719-d3318a1a2b8c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 22:37:33.681465+00	
00000000-0000-0000-0000-000000000000	1873c628-244c-4213-a4f2-7424cc33205a	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 23:37:36.559354+00	
00000000-0000-0000-0000-000000000000	73ae3e08-a88a-4dcc-87ba-7e8cd1a212f6	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-01 23:37:36.577277+00	
00000000-0000-0000-0000-000000000000	c4ad442a-7452-413b-9a41-cc6b558f6162	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 00:37:39.705052+00	
00000000-0000-0000-0000-000000000000	feab0b53-b8e9-400b-b5ce-7cb0f44cb22c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 00:37:39.721146+00	
00000000-0000-0000-0000-000000000000	bab02879-59d7-4435-84f7-2d37222c6c9d	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:16:10.051615+00	
00000000-0000-0000-0000-000000000000	ee04a737-bcb6-4082-bd3e-0aa60434a39a	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:30:10.876889+00	
00000000-0000-0000-0000-000000000000	f2dbe658-1494-4b20-bafe-18167e56adf9	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:31:36.183891+00	
00000000-0000-0000-0000-000000000000	5eccd399-a26b-474d-bd88-b785069c9fca	{"action":"logout","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account"}	2025-09-02 02:34:39.282561+00	
00000000-0000-0000-0000-000000000000	d8628678-1ed9-4eb0-8992-4fa8f06492ad	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:36:02.0979+00	
00000000-0000-0000-0000-000000000000	6adcc31d-b676-4e70-805a-7f3e16209a28	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:42:55.931081+00	
00000000-0000-0000-0000-000000000000	518567c1-33b9-4ae8-bc2f-94276c36c40f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:47:28.189962+00	
00000000-0000-0000-0000-000000000000	5acb9f2c-0579-456a-a6b6-6414851150ac	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 02:50:37.404281+00	
00000000-0000-0000-0000-000000000000	91dab997-ea92-4c9a-9870-6a6658bc466f	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 05:02:22.413199+00	
00000000-0000-0000-0000-000000000000	e96bef26-5cd2-4016-bf79-92a43d397cbc	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 05:23:35.586102+00	
00000000-0000-0000-0000-000000000000	f0dda91a-1e87-4db4-979b-8666b0707bcc	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 05:54:27.261748+00	
00000000-0000-0000-0000-000000000000	cc4954af-7ba4-49c8-808f-d54a910681a0	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 05:56:13.090711+00	
00000000-0000-0000-0000-000000000000	8cd5eaba-658d-4033-b421-9556a393c966	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 05:57:19.33992+00	
00000000-0000-0000-0000-000000000000	2ae866ec-874c-4401-9276-7ddc810ca31d	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 06:01:48.071866+00	
00000000-0000-0000-0000-000000000000	eeb163f3-138d-46a8-bd6b-7d089cf7eb42	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 08:25:04.981583+00	
00000000-0000-0000-0000-000000000000	51bf3ed6-0f1b-42bb-844c-4e600a331eb5	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 08:25:05.010214+00	
00000000-0000-0000-0000-000000000000	e2ee823a-a537-46dc-8a62-9edcb6a9405d	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 08:25:06.947692+00	
00000000-0000-0000-0000-000000000000	dafddbeb-01fd-4f78-998a-18eff1f9d3aa	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 08:25:08.698803+00	
00000000-0000-0000-0000-000000000000	fdfcff42-df5a-4cf6-86c0-41ea32398917	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:25:10.309717+00	
00000000-0000-0000-0000-000000000000	9a960555-e3e2-49ad-9ca5-d85decd235df	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:25:32.474814+00	
00000000-0000-0000-0000-000000000000	8801e4aa-1836-49bb-aa26-4fe2a768cdb7	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:26:04.912212+00	
00000000-0000-0000-0000-000000000000	7f8032d2-2866-4f14-912e-b0334ade736b	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:26:17.825373+00	
00000000-0000-0000-0000-000000000000	428eb9e7-a43a-4e13-83e3-62b605ba039e	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:34:22.519431+00	
00000000-0000-0000-0000-000000000000	a1c47099-b2b4-45da-a085-3e4fcb7b55f3	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:37:59.108294+00	
00000000-0000-0000-0000-000000000000	c480f14b-1f49-469a-bd64-8f42aa9adf2b	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 08:54:35.976402+00	
00000000-0000-0000-0000-000000000000	613803eb-c575-4cb4-9ef4-808238d5bb3b	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 09:00:33.678159+00	
00000000-0000-0000-0000-000000000000	817b5233-51ff-4c4d-98db-1ec2689f5b47	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:14:29.77609+00	
00000000-0000-0000-0000-000000000000	f39a0ced-33ce-4408-91d6-65bd9e080fb3	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:14:29.798051+00	
00000000-0000-0000-0000-000000000000	faeccfa9-e941-4d06-8d17-5e112d52704b	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:27:11.916826+00	
00000000-0000-0000-0000-000000000000	cb756b5d-fa67-4352-b6d5-22881c45bce7	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:27:11.926741+00	
00000000-0000-0000-0000-000000000000	64c60aad-f574-433e-ad9c-53436198f0e8	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:54:41.320688+00	
00000000-0000-0000-0000-000000000000	efe87bae-180e-4ab9-8718-df78d32e5314	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-02 09:54:41.336254+00	
00000000-0000-0000-0000-000000000000	8f1e8aa6-0bac-4ccd-b01d-2d381672ebdd	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:07:17.670268+00	
00000000-0000-0000-0000-000000000000	7a438c3b-e78a-4634-9414-7eeb7eff0907	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:07:17.697239+00	
00000000-0000-0000-0000-000000000000	2b51bf72-bb4f-4410-b913-3cca38620046	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:07:19.787922+00	
00000000-0000-0000-0000-000000000000	565dbbe6-e22a-4bd4-b3c8-9341caa72827	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:23:08.825263+00	
00000000-0000-0000-0000-000000000000	902558a5-e447-4133-8b40-7182dda12b4d	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:23:08.840507+00	
00000000-0000-0000-0000-000000000000	cf509994-809f-4c0d-8bf0-4a145472e696	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:23:09.945347+00	
00000000-0000-0000-0000-000000000000	dce835f5-57c7-4ab1-93c0-bd08bf9f7eae	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:23:10.611624+00	
00000000-0000-0000-0000-000000000000	6dcef577-a4a8-47ba-b6f1-4d69aff2710f	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:25:24.715084+00	
00000000-0000-0000-0000-000000000000	39874fb1-affe-47c2-9a67-487192cc61d8	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 01:42:52.001414+00	
00000000-0000-0000-0000-000000000000	e2682390-38c9-471c-a453-2b9ba797fbd2	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 01:43:09.886522+00	
00000000-0000-0000-0000-000000000000	4eae46ed-b15f-4a8d-aa5c-b7fccb6b9a76	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:40:09.006826+00	
00000000-0000-0000-0000-000000000000	32976341-2026-4016-95e5-9f59ec972209	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:40:09.037283+00	
00000000-0000-0000-0000-000000000000	01adfe97-262d-4a04-a1a1-caa1068f29c2	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:40:11.091231+00	
00000000-0000-0000-0000-000000000000	dc5bcc8a-5126-445c-a1e8-d968d8258c56	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 04:40:13.012395+00	
00000000-0000-0000-0000-000000000000	a546f427-d3a6-4438-a9de-0cfe56b5eb14	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 04:43:15.767197+00	
00000000-0000-0000-0000-000000000000	f50ff4e8-dfa7-481a-b656-0baaaad6a96c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 04:55:15.583438+00	
00000000-0000-0000-0000-000000000000	6507dc0f-1dc2-466e-80b0-ea30b2f39363	{"action":"login","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 05:24:20.274835+00	
00000000-0000-0000-0000-000000000000	a5e0b50c-8714-4964-a694-91954e8234a2	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 05:29:36.505984+00	
00000000-0000-0000-0000-000000000000	f13ce674-9ef1-4088-b86a-e2eaa0c214ae	{"action":"login","actor_id":"df30a616-774a-4de3-a9bc-cde68c740398","actor_username":"bokeum.eom@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 05:33:33.668886+00	
00000000-0000-0000-0000-000000000000	4a94004e-dc1e-4eb7-85bb-83d2aa0a5700	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 05:41:35.230597+00	
00000000-0000-0000-0000-000000000000	7dec138c-670a-4def-8036-da0503ea4f24	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 06:23:15.373682+00	
00000000-0000-0000-0000-000000000000	06d3ab6e-2a6b-417c-ae65-9e03c3ef169b	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 06:23:15.40799+00	
00000000-0000-0000-0000-000000000000	74843b78-cab6-4d6e-b0b0-7bd9daace80c	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 07:01:24.058233+00	
00000000-0000-0000-0000-000000000000	390d6b1b-2d67-4c91-a223-e0ffba24e4f6	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 07:01:24.075704+00	
00000000-0000-0000-0000-000000000000	2890727e-4936-4d2d-b6db-295bc4a652b9	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 07:01:25.998844+00	
00000000-0000-0000-0000-000000000000	2df260d1-58f4-45a0-b99d-b346053ebefe	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:03:07.7309+00	
00000000-0000-0000-0000-000000000000	ebdf2796-2337-45f5-8d63-3be5e31c50d4	{"action":"user_confirmation_requested","actor_id":"e9f8a5af-002f-4c81-968a-7e08be3f9e82","actor_username":"hyeonji.wang@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-03 07:03:10.691446+00	
00000000-0000-0000-0000-000000000000	d872d038-57e9-45f3-8999-5d30572235ef	{"action":"user_confirmation_requested","actor_id":"4fcce705-778b-44fe-ab55-72cd36a49cef","actor_username":"gwihwi.min@watercharging.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-03 07:03:12.616254+00	
00000000-0000-0000-0000-000000000000	09f2d7d9-d43b-456f-b16d-fd34a27662bc	{"action":"user_signedup","actor_id":"e9f8a5af-002f-4c81-968a-7e08be3f9e82","actor_username":"hyeonji.wang@watercharging.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-03 07:03:32.556241+00	
00000000-0000-0000-0000-000000000000	c6fa50d8-0a24-4ab0-ac7d-f4d715515747	{"action":"login","actor_id":"e9f8a5af-002f-4c81-968a-7e08be3f9e82","actor_username":"hyeonji.wang@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:03:44.196524+00	
00000000-0000-0000-0000-000000000000	b16a0abb-6dc0-41c3-afb1-8fb55f993005	{"action":"user_signedup","actor_id":"4fcce705-778b-44fe-ab55-72cd36a49cef","actor_username":"gwihwi.min@watercharging.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-03 07:03:48.431184+00	
00000000-0000-0000-0000-000000000000	0b24174c-cd47-4bd5-b89c-b43678d6cdcf	{"action":"login","actor_id":"4fcce705-778b-44fe-ab55-72cd36a49cef","actor_username":"gwihwi.min@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:04:16.194431+00	
00000000-0000-0000-0000-000000000000	c8c1de20-8f29-42aa-a7e2-2193783acb13	{"action":"login","actor_id":"4fcce705-778b-44fe-ab55-72cd36a49cef","actor_username":"gwihwi.min@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:15:45.637274+00	
00000000-0000-0000-0000-000000000000	965be89a-43fd-4db1-98a9-a927f907b61c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:18:21.944179+00	
00000000-0000-0000-0000-000000000000	dd9885a7-c13d-44d1-9a44-138d1ad95fc9	{"action":"login","actor_id":"4fcce705-778b-44fe-ab55-72cd36a49cef","actor_username":"gwihwi.min@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:26:54.30078+00	
00000000-0000-0000-0000-000000000000	644864e7-c6a2-4755-836f-304f49dd5096	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:54:18.055926+00	
00000000-0000-0000-0000-000000000000	99b04914-e0c7-48a5-ad3c-19c7db499811	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:54:20.002217+00	
00000000-0000-0000-0000-000000000000	1539d2d1-b33e-4488-a0a3-259c84dfc0b8	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 07:57:18.144757+00	
00000000-0000-0000-0000-000000000000	4ff40c57-b4a6-4d87-aaba-78ae324a824f	{"action":"token_refreshed","actor_id":"e9f8a5af-002f-4c81-968a-7e08be3f9e82","actor_username":"hyeonji.wang@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 08:02:00.7985+00	
00000000-0000-0000-0000-000000000000	bfb91df9-fd5f-43ba-b8cb-cf4972ce120c	{"action":"token_revoked","actor_id":"e9f8a5af-002f-4c81-968a-7e08be3f9e82","actor_username":"hyeonji.wang@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 08:02:00.801629+00	
00000000-0000-0000-0000-000000000000	8f97ffe5-6c61-44e1-a3cf-14d42189a149	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:22:07.040349+00	
00000000-0000-0000-0000-000000000000	c9a0137f-db3d-43da-9d4b-4a2502a4a89e	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:23:56.469117+00	
00000000-0000-0000-0000-000000000000	bb2cd948-7b22-4f50-9bd3-21a06de1071d	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:38:14.779257+00	
00000000-0000-0000-0000-000000000000	bc6acb54-e139-4c3a-9fc0-f787a550ee28	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:52:06.517821+00	
00000000-0000-0000-0000-000000000000	bc8d8087-8cde-47b2-a116-5ff37ba2e644	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:53:17.05315+00	
00000000-0000-0000-0000-000000000000	94d822ae-a163-4b49-8670-e5c882ffd7bb	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:53:19.533833+00	
00000000-0000-0000-0000-000000000000	daeb5059-6646-4d8d-ae4e-55d3c3f6d41d	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 08:59:53.736712+00	
00000000-0000-0000-0000-000000000000	ca26e2cb-3884-4c21-9195-6b2a6876f642	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 09:49:52.082751+00	
00000000-0000-0000-0000-000000000000	823dd14a-619b-483d-a540-0faaefb3a2cb	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 10:07:42.490096+00	
00000000-0000-0000-0000-000000000000	5b10ed3e-3286-4850-9025-e86c6ca9c489	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 10:07:42.501854+00	
00000000-0000-0000-0000-000000000000	7e473603-2c7e-4d7c-b332-aa6cbccb4a6b	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 10:08:14.481639+00	
00000000-0000-0000-0000-000000000000	8706c5b0-39d1-4dfb-bb34-fb3527b5225c	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 10:11:08.047579+00	
00000000-0000-0000-0000-000000000000	8a4fd23d-19a9-4a48-945e-cb4675c4cfac	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 10:11:08.049181+00	
00000000-0000-0000-0000-000000000000	6e2e9024-5b5a-4c28-aeda-d3e22119ddfa	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 10:11:18.600149+00	
00000000-0000-0000-0000-000000000000	a237ca21-54f6-482b-b4ef-11973eef21ab	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 10:14:17.413183+00	
00000000-0000-0000-0000-000000000000	08c2267b-f918-4ee0-ac18-ecb5f845e41c	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-03 10:19:18.591434+00	
00000000-0000-0000-0000-000000000000	67eb924b-0c3c-4228-a3b3-f678c2a707a1	{"action":"token_refreshed","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 13:01:59.986452+00	
00000000-0000-0000-0000-000000000000	2f534c64-33f0-4256-ad36-b70dac55fff2	{"action":"token_revoked","actor_id":"b48fd082-c0b1-4179-9165-fc64dfe31083","actor_username":"kook.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 13:02:00.004196+00	
00000000-0000-0000-0000-000000000000	a35f888f-59c0-49d7-b641-241fe84f05aa	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 00:49:20.95828+00	
00000000-0000-0000-0000-000000000000	791b9785-3e14-42c6-9821-e8827a45022c	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 00:49:20.986904+00	
00000000-0000-0000-0000-000000000000	a6b1bb2a-8eac-4260-a90c-ecc132895798	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 01:11:25.472909+00	
00000000-0000-0000-0000-000000000000	bba32fab-bce1-4992-adca-c37ff1ef6736	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 01:12:03.930878+00	
00000000-0000-0000-0000-000000000000	1678fccc-18b2-428c-a7b6-0535c9d64c6b	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 05:47:06.477389+00	
00000000-0000-0000-0000-000000000000	0a3166d7-a712-4f86-ab58-a4cc7407d6a8	{"action":"token_revoked","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 05:47:06.497844+00	
00000000-0000-0000-0000-000000000000	6168cfaa-5189-4e07-a7bb-10a96c986b79	{"action":"token_refreshed","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 05:47:08.775328+00	
00000000-0000-0000-0000-000000000000	4420740c-f38b-4ea2-949c-415f64c6afa1	{"action":"login","actor_id":"a87aa309-7d6f-4b35-b213-e3db8fa24ebc","actor_username":"ray.kim@watercharging.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 05:47:11.175581+00	
\.


--
-- TOC entry 4158 (class 0 OID 16927)
-- Dependencies: 255
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
7b5281de-88be-472f-9f0c-73d9537eac3b	b48fd082-c0b1-4179-9165-fc64dfe31083	291b44b7-6c37-4e94-b296-104c56427e7d	s256	bs1RqhJd5k7bmJawFawLENnHfchZKCfmZriu1cgdYzM	email			2025-08-27 13:11:31.196815+00	2025-08-27 13:11:56.706466+00	email/signup	2025-08-27 13:11:56.70642+00
ad8c6744-dc16-4a92-84d2-68966bfde48c	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f65a7c50-47a8-4231-8e39-914554fcc056	s256	LTEVbQY92V-qmflSjen0whyQfH_GgwPVcjsxFOjVBoU	email			2025-08-28 01:10:07.142315+00	2025-08-28 01:18:23.121375+00	email/signup	2025-08-28 01:18:23.121335+00
38d970bd-80b3-412f-98ac-6b79225ef85c	df30a616-774a-4de3-a9bc-cde68c740398	09b3462e-0936-448c-9a6d-c5ec4d0670e6	s256	w5JyO-nIpAm99GPYlVGLnYBkK0ymeFnzYHnUh2xQIkU	email			2025-08-28 02:16:00.860794+00	2025-08-28 02:16:00.860794+00	email/signup	\N
ca1b0861-d137-4299-b556-37002591e219	df30a616-774a-4de3-a9bc-cde68c740398	de2aa59e-a79d-4aa3-95a9-a87f09349f96	s256	TDOjfcTPgEa8-zrigdjfRlL3GeBhyIHlI0lVscY_lxc	email			2025-08-28 02:17:28.549643+00	2025-08-28 02:17:28.549643+00	email/signup	\N
8d6f1f02-45f1-40b8-a00e-8957eb0382aa	e9f8a5af-002f-4c81-968a-7e08be3f9e82	2e01e67f-c170-4528-afca-16a91fe6d798	s256	-k4BlR4_jOckYbbIykEwW-w76AsvrGhkzfcVfgi4yzc	email			2025-09-03 07:03:10.693496+00	2025-09-03 07:03:32.564777+00	email/signup	2025-09-03 07:03:32.56474+00
44a91398-29a3-41e9-b231-fdb370ee40cd	4fcce705-778b-44fe-ab55-72cd36a49cef	c0547f3d-6040-4ba8-8812-e0bfc8d76fc5	s256	WZNvQ5J-oQhagRJJw_5SVwdYUlI2mes857DZf4Fl1kg	email			2025-09-03 07:03:12.616828+00	2025-09-03 07:03:48.435283+00	email/signup	2025-09-03 07:03:48.435248+00
\.


--
-- TOC entry 4149 (class 0 OID 16725)
-- Dependencies: 246
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
b48fd082-c0b1-4179-9165-fc64dfe31083	b48fd082-c0b1-4179-9165-fc64dfe31083	{"sub": "b48fd082-c0b1-4179-9165-fc64dfe31083", "email": "kook.kim@watercharging.com", "email_verified": true, "phone_verified": false}	email	2025-08-27 13:11:31.188096+00	2025-08-27 13:11:31.188747+00	2025-08-27 13:11:31.188747+00	399b886b-6c8e-42c7-a858-2d390b07fa7e
a87aa309-7d6f-4b35-b213-e3db8fa24ebc	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	{"sub": "a87aa309-7d6f-4b35-b213-e3db8fa24ebc", "email": "ray.kim@watercharging.com", "email_verified": true, "phone_verified": false}	email	2025-08-28 01:10:07.135967+00	2025-08-28 01:10:07.136021+00	2025-08-28 01:10:07.136021+00	990bf5c6-71f4-4023-ab7f-772565d0e892
df30a616-774a-4de3-a9bc-cde68c740398	df30a616-774a-4de3-a9bc-cde68c740398	{"sub": "df30a616-774a-4de3-a9bc-cde68c740398", "email": "bokeum.eom@watercharging.com", "email_verified": true, "phone_verified": false}	email	2025-08-28 02:16:00.847679+00	2025-08-28 02:16:00.847737+00	2025-08-28 02:16:00.847737+00	5ded51ed-c7ef-4ca0-a1b1-1e3a7e5a6a63
e9f8a5af-002f-4c81-968a-7e08be3f9e82	e9f8a5af-002f-4c81-968a-7e08be3f9e82	{"sub": "e9f8a5af-002f-4c81-968a-7e08be3f9e82", "name": "왕현지", "role": "viewer", "email": "hyeonji.wang@watercharging.com", "email_verified": true, "phone_verified": false}	email	2025-09-03 07:03:10.686743+00	2025-09-03 07:03:10.686805+00	2025-09-03 07:03:10.686805+00	fdfed628-b345-462c-b439-a6bad2739ac2
4fcce705-778b-44fe-ab55-72cd36a49cef	4fcce705-778b-44fe-ab55-72cd36a49cef	{"sub": "4fcce705-778b-44fe-ab55-72cd36a49cef", "name": "민귀휘", "role": "viewer", "email": "gwihwi.min@watercharging.com", "email_verified": true, "phone_verified": false}	email	2025-09-03 07:03:12.614072+00	2025-09-03 07:03:12.614124+00	2025-09-03 07:03:12.614124+00	57433fa3-bceb-4d37-9426-d7b56b6a5646
\.


--
-- TOC entry 4143 (class 0 OID 16518)
-- Dependencies: 237
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 16814)
-- Dependencies: 250
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
93be5dfb-bd43-46f7-9c2d-2bdd7493f93b	2025-08-28 04:11:55.836051+00	2025-08-28 04:11:55.836051+00	password	e08ab9fb-2084-4eed-ac12-817c23f78da8
41081b36-cbff-4fb4-a07d-33c762c98cda	2025-08-28 05:15:59.776335+00	2025-08-28 05:15:59.776335+00	password	5745803b-e65a-46f3-bffc-3c32eb777ef6
7d98664f-b352-4bd6-b6ff-64ac782cc295	2025-08-28 05:17:53.577983+00	2025-08-28 05:17:53.577983+00	password	e8089eae-5c02-4ccc-9d82-396fcbb38f10
31750dd0-2dc4-45b1-bf2b-d4f85674bdf2	2025-08-28 05:19:52.519365+00	2025-08-28 05:19:52.519365+00	password	d0dbcda0-a7e3-4abd-bf11-5c4a1eb2475c
f23fd9e6-49b9-400d-835a-7d69947e42fa	2025-08-28 05:22:28.890986+00	2025-08-28 05:22:28.890986+00	password	81eb39a4-40cc-487b-8121-f6196a101ca6
4be27e36-f472-4b8a-a28c-02cf3164f83b	2025-08-28 05:26:26.122426+00	2025-08-28 05:26:26.122426+00	password	e11628f3-0533-4084-8c9e-cba9143e744f
49637b18-fece-4116-b991-12d93c55ddc5	2025-08-28 05:28:06.176491+00	2025-08-28 05:28:06.176491+00	password	10d4a8e3-8d77-43a4-9ba7-f06d4ecc39b3
2e234c56-ce2c-4ebd-836e-e964a3939582	2025-08-28 05:29:50.670782+00	2025-08-28 05:29:50.670782+00	password	eb51c90d-94b9-4208-bbcf-07ae24fcfe00
ded85e51-f232-49b3-92d2-9ed3e54fa1b1	2025-08-28 06:14:08.377384+00	2025-08-28 06:14:08.377384+00	password	d718cf4f-7979-4c35-9bb3-980551a824d2
77b6fa89-68ae-420b-8e9e-1577712e9c84	2025-08-28 07:02:14.772296+00	2025-08-28 07:02:14.772296+00	password	1185bed5-e5be-4bb5-9dfa-90f4527cc6ef
cb4e1d59-a0ed-40f6-8222-96edd4b2b0b7	2025-08-28 07:04:17.865991+00	2025-08-28 07:04:17.865991+00	password	ae4ee6eb-20a1-4bec-ae6d-5ca7f93bef63
927f8cf0-ca88-434f-8944-b5ec06a79795	2025-08-28 07:06:21.123499+00	2025-08-28 07:06:21.123499+00	password	fbe4b9c9-0f79-489d-9464-038216266f96
71ae6281-25a2-4e3a-b606-83167e7c4a07	2025-08-28 07:08:32.533002+00	2025-08-28 07:08:32.533002+00	password	9c6a12fe-9d5b-46fe-925c-131b0ce7803e
40682c28-bce4-4301-a3b0-cb8786f40e4a	2025-08-28 07:13:07.233335+00	2025-08-28 07:13:07.233335+00	password	cdeb1d11-3196-4bae-8892-3a36ee0d4603
5602f825-91c4-42eb-a0ba-0c6d47265255	2025-08-28 07:18:09.487989+00	2025-08-28 07:18:09.487989+00	password	af70aae6-1651-4813-87f0-aeb12746ab0a
5d8f2892-8c7d-4898-836f-7dc9bc4b3ec2	2025-08-28 07:24:58.8788+00	2025-08-28 07:24:58.8788+00	password	007f1353-706d-47c0-a63b-791ff20957da
bb3512ff-41e0-42ff-8de6-e2bd14da0924	2025-08-28 07:29:45.656997+00	2025-08-28 07:29:45.656997+00	password	fe90d363-f27e-48ab-873d-13131c5113b1
a68694de-5a5a-4b1e-adb8-e04e69fc0e44	2025-08-28 07:33:36.160735+00	2025-08-28 07:33:36.160735+00	password	fd77259c-1348-495e-b170-7946c2037649
515cd73d-1517-454b-909a-961a3f7e5eb8	2025-08-28 07:36:36.373857+00	2025-08-28 07:36:36.373857+00	password	3261293b-418c-4caf-9ed0-b6290b0c7b46
ba7bd9e6-a934-46a9-914b-c4219c823833	2025-08-28 07:39:19.34428+00	2025-08-28 07:39:19.34428+00	password	852fc817-8294-4b94-81b7-f0930c6c5b2c
2e44f7dc-b2a7-47b9-8c0d-a43a4b570979	2025-08-28 07:40:49.936201+00	2025-08-28 07:40:49.936201+00	password	9672fbd8-8dda-40a6-af4b-b866f753023b
aef50042-060b-4cfe-ad8b-dd1c893cb66f	2025-08-28 07:54:40.296074+00	2025-08-28 07:54:40.296074+00	password	808fca1d-f388-445a-9d17-c1d7cf56b0c7
965777df-87f7-4ecb-bdcb-7850b17cff01	2025-08-28 08:04:10.012693+00	2025-08-28 08:04:10.012693+00	password	5408776a-0161-4497-a3ca-24097ff65c2e
86b966b4-a615-43e1-b44b-dbcdc7ff984c	2025-08-28 10:28:29.855737+00	2025-08-28 10:28:29.855737+00	password	9a77467d-635d-4f55-8749-b4e7008bb93d
0a9e6b5d-703d-46be-9b36-3facade85b91	2025-08-28 10:31:10.370799+00	2025-08-28 10:31:10.370799+00	password	9c6d458d-a600-45b3-a745-1f7dbf822eed
1ea691a2-f426-4c3f-9c13-99695e5ade98	2025-08-28 10:34:38.736764+00	2025-08-28 10:34:38.736764+00	password	54575fea-a9ee-4dcd-a5fb-5ad909be19d1
26f74b9e-6942-4c33-9f52-34ac1cd7538d	2025-08-28 10:35:48.39296+00	2025-08-28 10:35:48.39296+00	password	6cb8462a-8105-449d-b954-b36121f861e6
b03dc1d5-6068-4c99-9935-ac0cfb4f64d7	2025-08-28 10:38:16.324607+00	2025-08-28 10:38:16.324607+00	password	63ff4351-a64f-4946-89d9-397b60501e63
b8dcc87f-c213-4cbc-a4b1-facf1c44e782	2025-08-28 10:42:55.388276+00	2025-08-28 10:42:55.388276+00	password	0efcb010-14fb-42f6-89c0-324c55db2374
a153c5ec-ec1b-45d3-926c-6840028c8635	2025-08-28 10:45:06.260554+00	2025-08-28 10:45:06.260554+00	password	117b8a1e-d915-41d3-879a-e65663d70cc3
6f3abc18-f33d-4601-b440-f83e1c3c431c	2025-08-28 10:47:20.696671+00	2025-08-28 10:47:20.696671+00	password	822f83cc-2c64-4c81-899e-122d77a6bae4
d24b9f12-f4f3-4839-bafc-b14a496fb5fb	2025-08-28 02:23:53.995553+00	2025-08-28 02:23:53.995553+00	email/signup	bcc3cb6e-019f-4ffd-b8cd-7ff18c4dbc2d
1b2f3874-857a-44dc-b43c-3b33b7ecbea4	2025-08-28 02:24:00.666043+00	2025-08-28 02:24:00.666043+00	password	ac2bdba3-283e-4902-a6b5-172244cadd7d
a1262c2e-224b-4cfa-adf4-17b5ee52e3ce	2025-08-28 02:24:59.722308+00	2025-08-28 02:24:59.722308+00	password	abdcbdda-e2fe-43b3-a95d-601fbb237d9c
24518cb7-4b45-4a41-89f2-802f8c1c5947	2025-08-28 02:25:59.93766+00	2025-08-28 02:25:59.93766+00	password	fff095ec-b0f8-4e2e-bb4d-9b6812838146
e2cd73d8-a397-4c60-ae0f-14ffd0d718b6	2025-08-28 10:49:18.757594+00	2025-08-28 10:49:18.757594+00	password	a9817af6-4fec-456c-99b4-14d32e71430d
76033dc0-2174-476c-8846-fa09cb5e6a97	2025-08-28 10:52:11.260615+00	2025-08-28 10:52:11.260615+00	password	59cc4469-84da-4eee-99cd-1ef6b9395c72
c3219fdd-d2a1-4ed1-b88e-3c36ed6b76ed	2025-08-28 10:54:09.922609+00	2025-08-28 10:54:09.922609+00	password	ff82f9f6-d85d-4599-86c1-d4cc6ef84211
12ab5b6e-5a64-4f89-8f1e-2abf586d219d	2025-08-28 10:56:27.614892+00	2025-08-28 10:56:27.614892+00	password	0dc4e164-006b-47b8-a3e1-b7161280bd17
6fdbfbc5-3f1e-4202-9f77-098e61d482c0	2025-08-28 02:43:12.494182+00	2025-08-28 02:43:12.494182+00	password	656b1b98-baf7-4798-8335-8e2fc05f6845
89eec8b7-80c6-451d-92ac-201098f92624	2025-08-28 10:58:52.413952+00	2025-08-28 10:58:52.413952+00	password	6ac2a670-4504-4f64-81ca-b2223cae817c
ec3500da-3e96-40a5-be60-82dcd09f7012	2025-08-28 11:00:59.313778+00	2025-08-28 11:00:59.313778+00	password	b57fe369-83b4-487e-9051-59e086d74855
75b40a12-d748-4239-87e6-fea8b9ff65ad	2025-08-28 11:07:40.238923+00	2025-08-28 11:07:40.238923+00	password	a518949f-2ac0-4f04-84b8-84ab96f56fa0
7a66374b-8ac5-40e7-b264-c02ff0af6cb2	2025-08-28 11:46:21.254692+00	2025-08-28 11:46:21.254692+00	password	6b8e3809-d87f-4c4c-ae9d-778f8beaaac1
f02fade2-6b7c-4e0e-a598-e61301c9c52f	2025-08-28 11:50:36.821594+00	2025-08-28 11:50:36.821594+00	password	2a998c3a-4dcf-412b-a208-c48c163d5728
84b1d03f-a97f-4c53-ac7e-8e3828fb54c1	2025-08-28 11:53:47.000823+00	2025-08-28 11:53:47.000823+00	password	65c10b5f-5afe-4b96-9fc4-07f34a1d8991
7a36f5a3-c256-4f05-9d65-c9966cda8215	2025-08-28 11:56:00.279047+00	2025-08-28 11:56:00.279047+00	password	7b2680c4-fb8c-464d-afde-ea1e0b2b67ee
36e42ef4-71fd-4576-9a6c-7c80c879c4fe	2025-08-28 11:58:25.046778+00	2025-08-28 11:58:25.046778+00	password	db0b9bb5-2506-48af-a3ee-79b2ebffd65b
81401cc4-9ee4-4387-b457-33b43ad7e42c	2025-08-28 12:00:52.540545+00	2025-08-28 12:00:52.540545+00	password	0d24754c-0c04-4749-b08b-cf0c31fbd713
b623a85d-2b5b-44a5-acfb-c8805e2a148c	2025-08-28 12:02:24.103282+00	2025-08-28 12:02:24.103282+00	password	82685cf7-a431-4799-83a3-d6c3b21150fb
38b5c5c2-3155-421d-aeca-88b8a836bfb3	2025-08-28 12:07:13.517222+00	2025-08-28 12:07:13.517222+00	password	a2ff332a-9571-4219-9be2-aae0f0c2b690
7b212d85-d812-42b7-9ea9-d51edba8bc11	2025-08-28 12:09:06.94669+00	2025-08-28 12:09:06.94669+00	password	38328526-835c-4c8e-bdb9-ee297a1a1c49
b693ef58-fe18-4f7f-8fbb-ce3a217170c8	2025-08-28 12:12:27.051381+00	2025-08-28 12:12:27.051381+00	password	8571c050-c6ee-491f-802f-097cc6bb1202
48cd4c30-a361-4f63-bc71-9f08f2a47a17	2025-08-28 12:14:27.489468+00	2025-08-28 12:14:27.489468+00	password	e506692e-2a83-415d-836b-c6dd5c7aa2fe
64af4fb1-5ca0-44b8-81d7-04a464a2029a	2025-08-28 12:16:31.680122+00	2025-08-28 12:16:31.680122+00	password	77ea2500-6740-46fd-a15f-bf2cdd0eae93
b8f7b627-24f2-4c8b-b8e3-d43d183f5b69	2025-08-28 12:18:39.384725+00	2025-08-28 12:18:39.384725+00	password	4d5138cb-d846-4935-b001-133d9a9b344d
2590bf09-a26b-447e-bb3e-970617efdc22	2025-08-28 12:19:48.304706+00	2025-08-28 12:19:48.304706+00	password	4531fa9e-66ff-4ba8-8733-6d1254d103ce
8b9351ce-b977-4910-a7dc-61b64b8078e1	2025-08-28 12:41:10.122268+00	2025-08-28 12:41:10.122268+00	password	38b62740-c97c-41f1-91d3-ebc045a371ae
4bb37f74-6c16-4c0b-bdc3-d75f221159e5	2025-08-28 12:42:15.923524+00	2025-08-28 12:42:15.923524+00	password	1f93c149-212e-4127-9102-71315c351cfb
0eba3c1d-f900-4470-ae42-632e43968854	2025-08-28 12:44:53.045971+00	2025-08-28 12:44:53.045971+00	password	8bb92bde-6e27-4583-8898-d7a6ca4e64f2
f7646a00-7536-422b-836e-344b9cb82f35	2025-08-28 12:46:37.04741+00	2025-08-28 12:46:37.04741+00	password	1030589a-1389-4694-915b-e653a09ad265
faf582a1-9274-4f81-bc8f-2fc036b53aa5	2025-08-28 12:49:32.766893+00	2025-08-28 12:49:32.766893+00	password	95eb4792-43cc-4c50-9119-5d407a6bea75
038ff4bd-037a-41ac-bf50-88aeb8639945	2025-08-28 12:54:16.105302+00	2025-08-28 12:54:16.105302+00	password	15a9b29d-db9e-4623-9793-b0d26bca003f
61daf1c7-9ca9-4927-9b74-8a32e693a73b	2025-08-28 12:56:57.509859+00	2025-08-28 12:56:57.509859+00	password	dd40241d-072e-41c2-ba9e-776c651f9083
2a011cbb-2816-49d4-98de-c9c81f057b09	2025-08-28 12:59:17.096667+00	2025-08-28 12:59:17.096667+00	password	fd72183f-4718-4d6d-9549-807a41bbf2e5
dab118ed-c344-44e8-b4ae-ee20dab653e8	2025-08-28 13:01:02.469485+00	2025-08-28 13:01:02.469485+00	password	9bcd4764-9229-4b66-be1b-010a4b5db70c
fb374fa1-e1a4-4800-81db-177c7385dd65	2025-08-28 13:02:23.983045+00	2025-08-28 13:02:23.983045+00	password	292cf7c8-4315-42c2-b9b4-7b9c6009ff7f
8dbbddf9-2397-4314-90de-880390d511e8	2025-08-28 13:03:52.672396+00	2025-08-28 13:03:52.672396+00	password	4801cbd3-445f-4fa6-b374-625b62b96b64
a5233f32-8570-4f46-a9d6-4474a0dadfaf	2025-08-28 13:05:15.121339+00	2025-08-28 13:05:15.121339+00	password	740c8913-2431-47ad-9b4b-a47fc630c9fb
d8ad9460-405c-4080-94d2-71b771321635	2025-08-28 13:05:46.366878+00	2025-08-28 13:05:46.366878+00	password	2ac6bf6b-6cf8-4864-96c8-10e453ac91dd
c1e2930e-56a3-453e-ba13-df688fc032a2	2025-08-28 13:06:48.282028+00	2025-08-28 13:06:48.282028+00	password	3a230b49-c519-4dae-8b39-bb2b5f350faf
42b7881f-ba95-466b-bd47-cacc2350ef4e	2025-08-28 13:08:26.130463+00	2025-08-28 13:08:26.130463+00	password	d80cc74e-eec0-44bc-b3ab-1716df24baa6
df5531c4-ad61-4110-a710-e8d899cb990f	2025-08-28 13:10:01.605869+00	2025-08-28 13:10:01.605869+00	password	2282a145-4004-488e-b0e2-71017c67db6c
d7389aa7-6346-4eca-bc54-dc78c65b8edc	2025-08-28 13:13:37.482024+00	2025-08-28 13:13:37.482024+00	password	20bfab24-d3cc-4a35-9ce6-8a2e63643332
9c627915-91f8-469e-8333-8b3fb5cb4dd2	2025-08-28 13:15:41.234526+00	2025-08-28 13:15:41.234526+00	password	9df88e5e-0943-4394-9ddd-fee9c854c3ef
27d719c3-4a4a-478a-a201-b33aad0d3cce	2025-08-28 13:18:43.389014+00	2025-08-28 13:18:43.389014+00	password	b0ca1bec-fd64-41b5-b39b-289ece26289c
710c18d5-d09c-4238-a2b4-03dca55a3bd2	2025-08-28 13:23:13.333953+00	2025-08-28 13:23:13.333953+00	password	7da1a398-5bf8-4cde-9ac7-885a4de1af71
11378a44-39ac-44b7-a514-56fd398cb9c4	2025-08-28 13:26:46.326624+00	2025-08-28 13:26:46.326624+00	password	c6568a79-061a-4c2a-9cd4-85bc39de35ed
716b5326-8a03-43d7-be47-1ba6cce1b2f4	2025-08-28 13:28:50.023816+00	2025-08-28 13:28:50.023816+00	password	0cf871cc-777f-4096-9531-082a2a94f56c
c626f79a-5539-403f-abf1-5c3ddc48c195	2025-08-28 13:35:57.112475+00	2025-08-28 13:35:57.112475+00	password	7885a4f1-4d70-4c18-ad11-6d7219ce57da
0456d879-d09e-49d7-aabd-a329590ca434	2025-08-28 13:41:18.857759+00	2025-08-28 13:41:18.857759+00	password	6b54ec1d-6f33-45d7-8427-3719a74d30c8
c13f9093-9787-42e8-87a3-9a198510b7e9	2025-08-28 13:49:11.167503+00	2025-08-28 13:49:11.167503+00	password	8e869e1f-bada-4e4d-9a17-d0b34d533a93
c31ebb49-3d04-4116-a2a6-fbd414c7dcee	2025-08-28 13:49:42.280272+00	2025-08-28 13:49:42.280272+00	password	d997f08b-4dff-4a7b-a7b1-fdc7ebf1449e
52d2d369-afe6-4c45-9d8c-fc659d7cd7b3	2025-08-28 13:50:07.89804+00	2025-08-28 13:50:07.89804+00	password	dce463ae-1ba0-4525-a9d5-fd91ad84ffb7
2fdd3a53-2198-4b53-a924-936ab37663af	2025-08-28 13:51:10.704655+00	2025-08-28 13:51:10.704655+00	password	b0899f21-848c-427e-bec7-8932e0f38bec
53532985-eef9-4c90-b581-fcaa19aed099	2025-08-28 13:52:17.861106+00	2025-08-28 13:52:17.861106+00	password	273e4e85-bb37-4b1e-9428-d26d16caa10e
1e1445cf-0374-4871-b562-5bced882cfc2	2025-08-28 13:52:41.29192+00	2025-08-28 13:52:41.29192+00	password	edea8eaa-ffb4-4ccf-b3a1-703140f0812a
b254799d-85b7-400b-b672-5adf08b0a741	2025-08-28 13:54:39.060651+00	2025-08-28 13:54:39.060651+00	password	c506065d-9f84-4e25-a9f1-3f09d73537fd
75b4acd4-b7b6-44f9-9e98-72921e4e27f1	2025-08-28 14:04:23.978736+00	2025-08-28 14:04:23.978736+00	password	3ad33e92-69a3-4346-ab6c-5450660b4731
373a807f-1376-446b-b01f-83d1f7af9ae4	2025-08-28 23:18:15.434832+00	2025-08-28 23:18:15.434832+00	password	b0b3b19f-75c1-4cd4-8a4d-96fba40b483c
141a1df4-bb3b-470b-a4da-df43ee203d04	2025-08-28 23:19:37.349479+00	2025-08-28 23:19:37.349479+00	password	41a0a229-8dfd-4b8d-9ba5-789e3b4ad1c7
295ff45b-22ac-470d-b03f-5c15780a7b13	2025-08-28 23:24:44.337914+00	2025-08-28 23:24:44.337914+00	password	098de30f-7785-48aa-a737-4e6311ae68a8
18555e24-078e-42e1-b0d5-d654ca665d26	2025-08-28 23:25:32.147918+00	2025-08-28 23:25:32.147918+00	password	5e6454f6-f2ad-4690-85f7-2fcda7064d10
863b01fd-bcf0-436b-925c-e94c560d7b21	2025-08-29 00:43:25.561292+00	2025-08-29 00:43:25.561292+00	password	fca9be6c-de8b-4387-9498-66a481f3d81b
79687dbb-de89-4916-a3ee-191af141e02d	2025-08-29 00:43:52.05377+00	2025-08-29 00:43:52.05377+00	password	7a6a7f22-8c75-4e5e-a357-e7f03022847a
9220664a-ba82-49ca-b665-3ce31a7f5bfb	2025-08-29 00:44:09.430676+00	2025-08-29 00:44:09.430676+00	password	fcdee0ad-95bf-41f4-aab5-65cecfeb8ea4
f72675cd-0dbc-4570-83a9-1ad9840cad37	2025-08-29 00:48:35.471572+00	2025-08-29 00:48:35.471572+00	password	38b8f430-46a9-4170-b6a9-e7af00b8a9a3
ffd5709d-6325-43a7-be08-c0f76bf74ac0	2025-08-29 00:51:20.802681+00	2025-08-29 00:51:20.802681+00	password	f43a5b75-2147-47e2-9390-f7a6dfa35737
21eb3e80-4c95-4e76-8bf1-3a4661f6d913	2025-08-29 01:38:35.628145+00	2025-08-29 01:38:35.628145+00	password	89d59979-11aa-4558-8952-b6ab96cede4c
77a42f93-46ac-4fe6-a58f-bc9cf29aad0d	2025-08-29 01:40:57.498155+00	2025-08-29 01:40:57.498155+00	password	a4173a47-a283-42af-ac43-fdde3fa468b1
29ce9b41-f7b2-4955-aa04-cf8d073c52cb	2025-08-29 01:49:50.568427+00	2025-08-29 01:49:50.568427+00	password	4bf17483-8446-4a7a-a80d-3f59231e13fe
be66f513-8035-4f59-804b-1f838c6ac15e	2025-08-29 01:53:42.296465+00	2025-08-29 01:53:42.296465+00	password	eb4420c2-136e-46b5-bd4e-2fbdb19ea2a5
94b13b0f-09a8-4669-92bc-53d6967178c4	2025-08-29 02:02:02.608678+00	2025-08-29 02:02:02.608678+00	password	32a16ce2-1955-4079-b921-bad2576c3b68
9eb31528-5a25-4249-8ebc-4c2fdb795587	2025-08-29 02:05:06.229728+00	2025-08-29 02:05:06.229728+00	password	a8a58dd0-6437-4215-896e-90982823d146
86c3709e-6aa5-42d2-9291-a152a6076fe7	2025-08-29 02:06:39.782784+00	2025-08-29 02:06:39.782784+00	password	5742a963-1a0b-44b3-a324-817c2489e2fa
20f549d9-1349-40d0-9320-deef1f654914	2025-08-29 02:08:27.344113+00	2025-08-29 02:08:27.344113+00	password	200293a5-d39a-4eda-ad93-4ca9343e343c
2910d173-ebc7-49b0-8547-86509306e13a	2025-08-29 02:10:08.564744+00	2025-08-29 02:10:08.564744+00	password	3e79ca69-fcdb-4d87-8a0b-5c6b0f2b5d89
1f8d9bcb-36bf-471d-b18a-d50ccb4ee21c	2025-08-29 02:13:08.055907+00	2025-08-29 02:13:08.055907+00	password	2f6a78b8-6db8-435c-9d4f-7e91a4ca1dac
b31b7420-3447-400f-92d9-8f014263dbab	2025-08-29 02:15:20.469102+00	2025-08-29 02:15:20.469102+00	password	12625bf5-4272-4fc3-8567-055ef7ac317a
2d7b6bd0-935b-434c-b719-1fb853f3a69a	2025-08-29 02:18:10.949134+00	2025-08-29 02:18:10.949134+00	password	b0d25150-a7c1-4bc1-9401-1b5ad8570902
489a0c06-0041-48ed-b524-83245d3a09db	2025-08-29 02:20:01.422571+00	2025-08-29 02:20:01.422571+00	password	3ec65faf-a585-4a98-8622-61aa5ac142a1
ecd47e21-b5f6-4f5c-8813-5b0e53054b91	2025-08-29 02:23:43.326276+00	2025-08-29 02:23:43.326276+00	password	4551d07a-8181-4f74-9d81-f5cbd12ec95e
d3e4345f-fd3c-402a-b652-aa9b9f78cce7	2025-08-29 02:28:05.930886+00	2025-08-29 02:28:05.930886+00	password	3bdd85aa-8450-4bf2-b4eb-0fd9cb78a212
c1966aba-7762-4a1f-980a-db403c1675ea	2025-08-29 02:29:28.89139+00	2025-08-29 02:29:28.89139+00	password	98526682-3580-4f3d-9b1f-58c010fa456e
01c44c97-4cc8-4726-a8f5-8c5ea2fe70d1	2025-08-29 02:31:55.030367+00	2025-08-29 02:31:55.030367+00	password	2039ef2f-df9b-4145-8b1a-b622f2326b74
f4094b0d-f435-4c2c-a03a-9653145609f1	2025-08-29 02:32:53.606519+00	2025-08-29 02:32:53.606519+00	password	5caf6d9c-8917-4ca3-9fef-1c90bae96744
77aca099-9f64-4234-b243-e419f27dfc2b	2025-08-29 04:08:34.265958+00	2025-08-29 04:08:34.265958+00	password	3b536e05-3098-4258-a6b6-f2966c1ca502
f185a61d-fb7a-4708-a8c3-ab62493ecb2a	2025-08-29 04:11:52.950889+00	2025-08-29 04:11:52.950889+00	password	c2efff24-a902-4c65-be46-1c57e63d8b74
761e3012-e277-404b-8df0-5023e7579edb	2025-08-29 04:14:28.024485+00	2025-08-29 04:14:28.024485+00	password	4852a148-cf55-4d7f-9490-5c7746426ad8
8f37b69a-ea4c-44cf-b986-2750b043bb01	2025-08-29 04:17:35.735033+00	2025-08-29 04:17:35.735033+00	password	5e705deb-c27e-4cd7-a374-30f0c91b323c
fef350d4-f69d-4d23-b2f5-a971a6272a2a	2025-08-29 04:20:17.391121+00	2025-08-29 04:20:17.391121+00	password	4b1bd939-89bd-4d15-a76c-5bae4e64a9fd
ab568aa1-9ad4-42fa-bf06-280fb523a2fc	2025-08-29 04:20:41.326154+00	2025-08-29 04:20:41.326154+00	password	ce60d550-f784-495d-9d40-8508a0b9dde8
dee4c60f-73c4-4aa2-bff3-d7e8c9392b47	2025-08-29 04:24:40.285951+00	2025-08-29 04:24:40.285951+00	password	57f95996-390f-43e4-9b00-faeba6ebf39f
0d20f313-ef4c-4ae7-965c-38970c278698	2025-08-29 04:26:43.782259+00	2025-08-29 04:26:43.782259+00	password	812fe10e-7036-43ce-9abb-62a615982766
51151001-2f6a-4c7e-ac74-622b0b03a59f	2025-08-29 04:27:05.666627+00	2025-08-29 04:27:05.666627+00	password	2d308e97-ea5f-445a-a86f-6f77ea2bd56a
89cde53c-86cf-4538-852f-604ba9270616	2025-08-29 04:29:52.112612+00	2025-08-29 04:29:52.112612+00	password	2acbb405-d339-4d51-ba8b-3041922fc84a
b83d3956-6f51-4577-b22e-a6b431450520	2025-08-29 04:35:03.70969+00	2025-08-29 04:35:03.70969+00	password	fe394c09-cc0e-460c-a0c3-2b36844f7b2b
5d4a948c-2533-4f58-ab80-2edac80ad7f6	2025-08-31 04:14:02.99065+00	2025-08-31 04:14:02.99065+00	password	ea60a0b8-8b9f-44df-988e-c87f40000eba
42bc9537-53ba-48ca-9b95-df71ca59a5e8	2025-09-01 07:46:03.421867+00	2025-09-01 07:46:03.421867+00	password	deca4b49-4741-40aa-921a-5226dbdec238
440634b4-e441-4f78-a3cb-d7b5c6faab42	2025-09-01 07:47:02.02555+00	2025-09-01 07:47:02.02555+00	password	422d01d9-036c-4e30-95c8-675a745a41da
361e0d98-b7f5-4051-8a52-3421bbf4caa0	2025-09-01 07:47:33.377421+00	2025-09-01 07:47:33.377421+00	password	c21b47ff-ff74-474e-a464-03c993d04cd2
0fa9c83b-0bd7-4842-970f-043c9a07c708	2025-09-01 07:51:55.024331+00	2025-09-01 07:51:55.024331+00	password	3d904c3e-48e1-44c3-bc30-69cb97ffa748
aa5bc789-778c-44ec-af86-ff8d7d81535e	2025-09-01 07:52:38.083731+00	2025-09-01 07:52:38.083731+00	password	544fc3f8-6d73-4f6d-9d7c-e36d24be4738
64b20ba0-573f-4608-bfbf-b8ca934c5421	2025-09-02 02:36:02.108301+00	2025-09-02 02:36:02.108301+00	password	ee41a970-c8aa-4ab1-9069-d65ba0c8f706
adcf379e-aaec-4444-9eb3-828f260ca684	2025-09-02 02:42:55.951496+00	2025-09-02 02:42:55.951496+00	password	1b59e99e-d7c3-4b23-95dd-335c552830d3
1c805ca5-293d-4284-9f12-14bcbfc8caf7	2025-09-02 02:47:28.198964+00	2025-09-02 02:47:28.198964+00	password	7c390685-95a9-4f30-9eb6-5520aaeb27f8
35da4435-dc6e-4620-85eb-fbff63f92bf6	2025-09-02 02:50:37.411612+00	2025-09-02 02:50:37.411612+00	password	9fb89cdb-f032-4e59-9dfa-55711db7e4d4
ce43b774-28d2-4348-9106-64eb69344193	2025-09-02 05:02:22.50783+00	2025-09-02 05:02:22.50783+00	password	fe7bc408-347d-4de7-830e-3571cac9578b
ec291e8a-b2be-43af-a474-91113c723861	2025-09-02 05:23:35.64771+00	2025-09-02 05:23:35.64771+00	password	e28c1fa8-4b75-44f4-a9ab-d54ee597f369
4ec39acb-82ea-49aa-a18b-fcd8b9b9d3eb	2025-09-02 05:54:27.339313+00	2025-09-02 05:54:27.339313+00	password	bdec34ae-e97e-4b46-ba27-6b1a231099a6
dd994c78-3c79-41d5-bbd7-c744017b0106	2025-09-02 05:56:13.097238+00	2025-09-02 05:56:13.097238+00	password	3c32b37c-821e-4e85-8f02-2f5ad8f55f40
73aeee5c-ec08-4e14-84c4-1b00ec204bba	2025-09-02 05:57:19.344077+00	2025-09-02 05:57:19.344077+00	password	71449ef2-0bb9-49b6-9f25-12595faa99fa
80bc4ec9-65dd-4bdc-9d3f-b5bdcafd44fe	2025-09-02 06:01:48.082809+00	2025-09-02 06:01:48.082809+00	password	49b9a47b-86a1-4f16-ab58-f4b29ff6ed15
ab2d2017-574c-4852-8bb2-17de32df36c5	2025-09-02 08:25:10.325798+00	2025-09-02 08:25:10.325798+00	password	0ffb5655-7ed6-48b2-baf5-3f2bbab118d3
7dbf5240-120b-4ed3-ba71-7164b1f43338	2025-09-02 08:25:32.47757+00	2025-09-02 08:25:32.47757+00	password	2533f17f-99bc-4ea3-bfce-d38e578ef2cc
03fa11c3-056d-4907-b203-04ee8e01057d	2025-09-02 08:26:04.915722+00	2025-09-02 08:26:04.915722+00	password	359799c7-971a-473a-8c21-4a83f67f9b9e
b838d60f-bda9-4ee0-ae6d-30a64920cd92	2025-09-02 08:26:17.83269+00	2025-09-02 08:26:17.83269+00	password	8d1ac6cb-9e2a-47ea-81e4-da5e876bdf2f
725f2b2f-2014-4a49-979c-604e0782242f	2025-09-02 08:34:22.551456+00	2025-09-02 08:34:22.551456+00	password	56fd602e-7fe4-45b1-80fa-06d97b11de81
f049d4ae-be26-4864-ac53-cf6d9b026694	2025-09-02 08:37:59.113957+00	2025-09-02 08:37:59.113957+00	password	51d39abc-6d4e-4126-b34f-7cf167260449
e7122528-c83f-4e4e-8305-82fa9807d081	2025-09-02 08:54:36.000779+00	2025-09-02 08:54:36.000779+00	password	255d0a90-f37b-4f7a-b04a-d570e42c0cb5
249ec385-e060-4a6c-996b-60d302554453	2025-09-02 09:00:33.705744+00	2025-09-02 09:00:33.705744+00	password	ef8fa3a9-81bd-405d-b6e6-b5a09b2366da
9b1047b4-7ff3-4d95-b857-23d20c94aa12	2025-09-03 01:42:52.056775+00	2025-09-03 01:42:52.056775+00	password	d0976fac-63d1-4f23-ae2e-e2e899f30af0
d23bd046-d35f-42dd-a349-54e536a7ed80	2025-09-03 01:43:09.891084+00	2025-09-03 01:43:09.891084+00	password	bd49c9f1-e5b0-40f8-88c6-834d07d3c983
0e14c0d6-9ce8-42e2-8a77-25706655532d	2025-09-03 04:40:13.021863+00	2025-09-03 04:40:13.021863+00	password	7a10887c-fdb8-453e-b996-cb6c3640dae7
b3cae6d6-6faf-4409-a5b7-1170bdfe18af	2025-09-03 04:43:15.773958+00	2025-09-03 04:43:15.773958+00	password	7207e01c-1197-4347-9a2b-c84d42c6a87a
0a54baed-a033-4a9c-901c-93989ce8873f	2025-09-03 04:55:15.616434+00	2025-09-03 04:55:15.616434+00	password	a50555de-9153-44e8-ab81-062aabe8cda0
ca396172-2d69-4be7-99a6-711bf5b36867	2025-09-03 05:24:20.324779+00	2025-09-03 05:24:20.324779+00	password	661b878c-c74c-4ff1-a68e-1ce59922cc6e
cb0e1fec-d397-46ca-a934-7ad4b9ad4eb9	2025-09-03 05:29:36.516374+00	2025-09-03 05:29:36.516374+00	password	fc4cfdcd-c2cb-4cff-b827-612d94dad273
fd63db8f-2f29-435c-92f1-e8baa5d71442	2025-09-03 05:33:33.678976+00	2025-09-03 05:33:33.678976+00	password	a2d72452-f75e-441d-bd90-cc319da9b8bf
0b7a65d5-4d39-4056-bac9-d0d8b2b1aba6	2025-09-03 05:41:35.297181+00	2025-09-03 05:41:35.297181+00	password	3e05bf69-583a-45b4-957b-75bfd1aed287
1435ee19-c260-4d15-8ad6-4554bcad5b7d	2025-09-03 07:03:07.742211+00	2025-09-03 07:03:07.742211+00	password	5f5995c8-eb60-44e2-b193-6ee7b9e73ba0
0cb66375-e065-4f58-8f04-9bf9dcbeebc7	2025-09-03 07:03:44.20564+00	2025-09-03 07:03:44.20564+00	password	77f9b4fc-add4-4a4b-bb26-8265347aae99
30aee953-5f50-462e-8c61-9b386f7a915c	2025-09-03 07:04:16.197119+00	2025-09-03 07:04:16.197119+00	password	ec42b153-088b-4f90-a913-a053751ac859
038148c9-b688-4df5-b554-1410346a2458	2025-09-03 07:15:45.659729+00	2025-09-03 07:15:45.659729+00	password	19212bc5-eab3-48fb-88c7-bd6ecf5d14c9
1c50cfd3-3f86-4414-98bb-8de8533bb289	2025-09-03 07:18:21.948886+00	2025-09-03 07:18:21.948886+00	password	be29b013-f252-4bea-b18a-8840f7eda1af
85173d8c-2f5e-45b1-acdc-22ebbeec412b	2025-09-03 07:26:54.317881+00	2025-09-03 07:26:54.317881+00	password	ae236667-4ecb-4886-bd8a-b4600a93b6d7
6f390ba8-09d0-49f4-a3fb-8b8d075fb8d3	2025-09-03 07:54:18.144905+00	2025-09-03 07:54:18.144905+00	password	314da7ff-c840-416e-86ca-fd26b140faa8
db35293f-5672-4c1d-901d-719f8b732650	2025-09-03 07:54:20.008063+00	2025-09-03 07:54:20.008063+00	password	72add7a1-1984-4e51-9ef7-e1b6034bdc40
661a4e6b-795f-4742-8d6e-46168fef797a	2025-09-03 07:57:18.165136+00	2025-09-03 07:57:18.165136+00	password	8317f8a8-6f22-41a0-87dc-e143d39bc75f
2bde1052-9cfe-4c5d-8aee-0b2997718ac8	2025-09-03 08:22:07.086582+00	2025-09-03 08:22:07.086582+00	password	1f5e5884-1db5-48a8-8237-13dd451cf988
7033880b-b223-423c-b0b6-05b2b438cd2e	2025-09-03 08:23:56.536961+00	2025-09-03 08:23:56.536961+00	password	37003f59-28de-49c9-babd-09d797ea8346
98cdcd4e-f623-4db2-8f08-6d79d0cf2625	2025-09-03 08:38:14.811925+00	2025-09-03 08:38:14.811925+00	password	e182c522-0927-463b-b94a-2d28ee706fd2
4b8e6bdf-8fe6-4347-a15f-d2ff08228b64	2025-09-03 08:52:06.539794+00	2025-09-03 08:52:06.539794+00	password	1b32a48b-e1c0-4929-806a-fe6f5d8e0895
f86dc745-d97c-4785-bed7-427914a047aa	2025-09-03 08:53:17.191293+00	2025-09-03 08:53:17.191293+00	password	746bb75c-2db0-4810-8bb9-d4a02544afc8
e03f60c7-d67a-44a6-ae9d-e00d91860eec	2025-09-03 08:53:19.542575+00	2025-09-03 08:53:19.542575+00	password	235c069f-61c8-4b62-9e09-dd757be5e3a7
af96bfc2-d95d-4fc8-a0e4-efe0758ee02c	2025-09-03 08:59:53.765005+00	2025-09-03 08:59:53.765005+00	password	639c9a5d-54a0-4652-909a-1c72059b866e
53c8f3b6-a1bd-4a7f-8552-98de32d5783c	2025-09-03 09:49:52.182354+00	2025-09-03 09:49:52.182354+00	password	856efcb2-1adf-4ad0-996a-b4a4f0c53acb
28bd85af-83f1-4f92-b65e-57e006cbf105	2025-09-03 10:08:14.493659+00	2025-09-03 10:08:14.493659+00	password	6a355913-7a16-4f91-aad3-07e7d11c8673
9ee4ffe6-cc57-41ca-b5ab-6b02002d22eb	2025-09-03 10:11:18.606796+00	2025-09-03 10:11:18.606796+00	password	f6463cf8-e72e-4db3-a829-3d9028d4f921
4f81aa37-1d7d-4a95-8e04-b7ee9066ad17	2025-09-03 10:14:17.446272+00	2025-09-03 10:14:17.446272+00	password	731c2e89-5d04-4875-933e-00fcc84ddf57
50283ded-4a5b-4fbf-b881-8fcde579deab	2025-09-03 10:19:18.59875+00	2025-09-03 10:19:18.59875+00	password	4f40316c-05ad-4cf1-a14e-37a6ceb19034
20e2fcba-0d77-4400-afd7-ebe7829c069a	2025-09-04 01:11:25.532773+00	2025-09-04 01:11:25.532773+00	password	8ddbd96f-b03a-4b08-8171-6b7cd36dd5d1
50e28e52-ae1e-4187-b716-71e759ad2264	2025-09-04 01:12:03.935138+00	2025-09-04 01:12:03.935138+00	password	ec5b4b8e-b78c-4c68-b485-2764898f9d6e
189056fb-555e-47ca-a2b3-57fce9ab5648	2025-09-04 05:47:11.193591+00	2025-09-04 05:47:11.193591+00	password	2254d1e5-1ee8-4515-8bf6-dc256453ab17
\.


--
-- TOC entry 4152 (class 0 OID 16802)
-- Dependencies: 249
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 16789)
-- Dependencies: 248
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 19905)
-- Dependencies: 281
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4159 (class 0 OID 16977)
-- Dependencies: 256
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4142 (class 0 OID 16507)
-- Dependencies: 236
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	129	hbf6krqfrgik	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-28 02:43:12.476624+00	2025-08-28 04:56:38.543279+00	\N	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	147	ogwlo4po6luf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:15:59.758499+00	2025-08-28 05:15:59.758499+00	\N	41081b36-cbff-4fb4-a07d-33c762c98cda
00000000-0000-0000-0000-000000000000	148	cwvichna4zrf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:17:53.576037+00	2025-08-28 05:17:53.576037+00	\N	7d98664f-b352-4bd6-b6ff-64ac782cc295
00000000-0000-0000-0000-000000000000	151	wpmyvg3aoa3h	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:22:28.863752+00	2025-08-28 05:22:28.863752+00	\N	f23fd9e6-49b9-400d-835a-7d69947e42fa
00000000-0000-0000-0000-000000000000	153	p6xocbyb4eyv	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:28:06.173878+00	2025-08-28 05:28:06.173878+00	\N	49637b18-fece-4116-b991-12d93c55ddc5
00000000-0000-0000-0000-000000000000	160	5fkzjblf4m2p	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:02:14.755625+00	2025-08-28 07:02:14.755625+00	\N	77b6fa89-68ae-420b-8e9e-1577712e9c84
00000000-0000-0000-0000-000000000000	161	vn3vzdikvooa	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:04:17.846804+00	2025-08-28 07:04:17.846804+00	\N	cb4e1d59-a0ed-40f6-8222-96edd4b2b0b7
00000000-0000-0000-0000-000000000000	163	zcgkwhbktxd5	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:08:32.531122+00	2025-08-28 07:08:32.531122+00	\N	71ae6281-25a2-4e3a-b606-83167e7c4a07
00000000-0000-0000-0000-000000000000	156	xb2pgjhqarup	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-28 06:01:17.68967+00	2025-08-28 07:13:49.927186+00	fz3jz3tbhefa	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	166	smluiwi26wna	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:18:09.485229+00	2025-08-28 07:18:09.485229+00	\N	5602f825-91c4-42eb-a0ba-0c6d47265255
00000000-0000-0000-0000-000000000000	168	e5b527myezxf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:29:45.65359+00	2025-08-28 07:29:45.65359+00	\N	bb3512ff-41e0-42ff-8de6-e2bd14da0924
00000000-0000-0000-0000-000000000000	170	agvnaijcmjd7	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:36:36.37081+00	2025-08-28 07:36:36.37081+00	\N	515cd73d-1517-454b-909a-961a3f7e5eb8
00000000-0000-0000-0000-000000000000	356	st3suucgcshs	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 02:42:55.942244+00	2025-09-02 02:42:55.942244+00	\N	adcf379e-aaec-4444-9eb3-828f260ca684
00000000-0000-0000-0000-000000000000	360	toxbvaqiz5oo	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 05:23:35.625383+00	2025-09-02 05:23:35.625383+00	\N	ec291e8a-b2be-43af-a474-91113c723861
00000000-0000-0000-0000-000000000000	365	gwcryagxme6p	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 08:25:05.037068+00	2025-09-02 08:25:05.037068+00	rr4lq4esi7ev	80bc4ec9-65dd-4bdc-9d3f-b5bdcafd44fe
00000000-0000-0000-0000-000000000000	366	z66xoje3dwtw	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 08:25:10.321904+00	2025-09-02 08:25:10.321904+00	\N	ab2d2017-574c-4852-8bb2-17de32df36c5
00000000-0000-0000-0000-000000000000	367	7q72ce5bitq5	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 08:25:32.476346+00	2025-09-02 08:25:32.476346+00	\N	7dbf5240-120b-4ed3-ba71-7164b1f43338
00000000-0000-0000-0000-000000000000	368	w7rnoci5wzuw	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 08:26:04.914516+00	2025-09-02 08:26:04.914516+00	\N	03fa11c3-056d-4907-b203-04ee8e01057d
00000000-0000-0000-0000-000000000000	179	3lvhsyhako4v	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:22:12.853225+00	2025-08-28 10:22:12.853225+00	3jzy6txyvlyh	965777df-87f7-4ecb-bdcb-7850b17cff01
00000000-0000-0000-0000-000000000000	369	mg3ekhc3wjes	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-02 08:26:17.831501+00	2025-09-02 09:27:11.927989+00	\N	b838d60f-bda9-4ee0-ae6d-30a64920cd92
00000000-0000-0000-0000-000000000000	375	mex6djcxcc5f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 09:27:11.937279+00	2025-09-02 09:27:11.937279+00	mg3ekhc3wjes	b838d60f-bda9-4ee0-ae6d-30a64920cd92
00000000-0000-0000-0000-000000000000	172	77hmzek2cmma	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 07:40:49.933411+00	2025-08-28 10:31:04.252675+00	\N	2e44f7dc-b2a7-47b9-8c0d-a43a4b570979
00000000-0000-0000-0000-000000000000	181	tmousf3obibg	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:31:04.254249+00	2025-08-28 10:31:04.254249+00	77hmzek2cmma	2e44f7dc-b2a7-47b9-8c0d-a43a4b570979
00000000-0000-0000-0000-000000000000	185	amgepczek4be	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:38:16.319859+00	2025-08-28 10:38:16.319859+00	\N	b03dc1d5-6068-4c99-9935-ac0cfb4f64d7
00000000-0000-0000-0000-000000000000	187	f3ocbdhslkdp	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:45:06.258461+00	2025-08-28 10:45:06.258461+00	\N	a153c5ec-ec1b-45d3-926c-6840028c8635
00000000-0000-0000-0000-000000000000	189	xzaltd3z2gle	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:49:18.75562+00	2025-08-28 10:49:18.75562+00	\N	e2cd73d8-a397-4c60-ae0f-14ffd0d718b6
00000000-0000-0000-0000-000000000000	372	4kqcwjrb5d5l	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-02 08:54:35.995151+00	2025-09-02 09:54:41.338216+00	\N	e7122528-c83f-4e4e-8305-82fa9807d081
00000000-0000-0000-0000-000000000000	191	cu5uoaw5ckw2	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:54:09.920637+00	2025-08-28 10:54:09.920637+00	\N	c3219fdd-d2a1-4ed1-b88e-3c36ed6b76ed
00000000-0000-0000-0000-000000000000	193	wfouj46fp3a6	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:58:52.411399+00	2025-08-28 10:58:52.411399+00	\N	89eec8b7-80c6-451d-92ac-201098f92624
00000000-0000-0000-0000-000000000000	195	6oml5mb7d6pr	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:07:40.22998+00	2025-08-28 11:07:40.22998+00	\N	75b40a12-d748-4239-87e6-fea8b9ff65ad
00000000-0000-0000-0000-000000000000	197	zq32uioao2rc	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:50:36.818494+00	2025-08-28 11:50:36.818494+00	\N	f02fade2-6b7c-4e0e-a598-e61301c9c52f
00000000-0000-0000-0000-000000000000	199	z3eegw5s3yhi	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:56:00.276998+00	2025-08-28 11:56:00.276998+00	\N	7a36f5a3-c256-4f05-9d65-c9966cda8215
00000000-0000-0000-0000-000000000000	200	zholqxdpcoi4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:58:25.042154+00	2025-08-28 11:58:25.042154+00	\N	36e42ef4-71fd-4576-9a6c-7c80c879c4fe
00000000-0000-0000-0000-000000000000	201	sr2aj7p52qcy	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:00:52.538657+00	2025-08-28 12:00:52.538657+00	\N	81401cc4-9ee4-4387-b457-33b43ad7e42c
00000000-0000-0000-0000-000000000000	202	mg6dcjdbwxh4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:02:24.099526+00	2025-08-28 12:02:24.099526+00	\N	b623a85d-2b5b-44a5-acfb-c8805e2a148c
00000000-0000-0000-0000-000000000000	203	mkjtl6lf4fzh	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:07:13.503243+00	2025-08-28 12:07:13.503243+00	\N	38b5c5c2-3155-421d-aeca-88b8a836bfb3
00000000-0000-0000-0000-000000000000	204	n3ai7hfzkatq	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:09:06.944051+00	2025-08-28 12:09:06.944051+00	\N	7b212d85-d812-42b7-9ea9-d51edba8bc11
00000000-0000-0000-0000-000000000000	378	us237kt54qlw	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 01:23:08.848436+00	2025-09-03 01:23:08.848436+00	cgw6vlnxb3rs	e7122528-c83f-4e4e-8305-82fa9807d081
00000000-0000-0000-0000-000000000000	206	zxdgb4aaaegm	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:12:27.047431+00	2025-08-28 12:12:27.047431+00	\N	b693ef58-fe18-4f7f-8fbb-ce3a217170c8
00000000-0000-0000-0000-000000000000	207	h6qdwvci4fdz	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:14:27.468012+00	2025-08-28 12:14:27.468012+00	\N	48cd4c30-a361-4f63-bc71-9f08f2a47a17
00000000-0000-0000-0000-000000000000	208	s5os56shrshw	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:16:31.675571+00	2025-08-28 12:16:31.675571+00	\N	64af4fb1-5ca0-44b8-81d7-04a464a2029a
00000000-0000-0000-0000-000000000000	209	f3wmyxte3hw4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:18:39.38263+00	2025-08-28 12:18:39.38263+00	\N	b8f7b627-24f2-4c8b-b8e3-d43d183f5b69
00000000-0000-0000-0000-000000000000	210	q7hstrv3sxhh	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:19:48.303116+00	2025-08-28 12:19:48.303116+00	\N	2590bf09-a26b-447e-bb3e-970617efdc22
00000000-0000-0000-0000-000000000000	211	3ze3l72ig7xp	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:41:10.111962+00	2025-08-28 12:41:10.111962+00	\N	8b9351ce-b977-4910-a7dc-61b64b8078e1
00000000-0000-0000-0000-000000000000	212	gmgikzde7dvf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:42:15.92163+00	2025-08-28 12:42:15.92163+00	\N	4bb37f74-6c16-4c0b-bdc3-d75f221159e5
00000000-0000-0000-0000-000000000000	176	qqrjcayhgtus	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-28 08:17:08.948251+00	2025-08-29 04:02:37.346873+00	vergsejbbrqy	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	383	pcfdwrqje2qg	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-03 04:43:15.770124+00	2025-09-03 04:43:15.770124+00	\N	b3cae6d6-6faf-4409-a5b7-1170bdfe18af
00000000-0000-0000-0000-000000000000	386	yaa2dnes6pbs	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 05:29:36.511229+00	2025-09-03 05:29:36.511229+00	\N	cb0e1fec-d397-46ca-a934-7ad4b9ad4eb9
00000000-0000-0000-0000-000000000000	389	7uzvyon7busi	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-03 06:23:15.430651+00	2025-09-03 06:23:15.430651+00	tmbkipltjlgi	ca396172-2d69-4be7-99a6-711bf5b36867
00000000-0000-0000-0000-000000000000	394	khzwb4vll7lq	4fcce705-778b-44fe-ab55-72cd36a49cef	f	2025-09-03 07:15:45.649217+00	2025-09-03 07:15:45.649217+00	\N	038148c9-b688-4df5-b554-1410346a2458
00000000-0000-0000-0000-000000000000	397	65tha5e5a7lw	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 07:54:18.103106+00	2025-09-03 07:54:18.103106+00	\N	6f390ba8-09d0-49f4-a3fb-8b8d075fb8d3
00000000-0000-0000-0000-000000000000	398	33jwehtvyswk	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 07:54:20.006623+00	2025-09-03 07:54:20.006623+00	\N	db35293f-5672-4c1d-901d-719f8b732650
00000000-0000-0000-0000-000000000000	357	glhhei4ywbic	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 02:47:28.195798+00	2025-09-02 02:47:28.195798+00	\N	1c805ca5-293d-4284-9f12-14bcbfc8caf7
00000000-0000-0000-0000-000000000000	361	e2gtfame4snt	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 05:54:27.308064+00	2025-09-02 05:54:27.308064+00	\N	4ec39acb-82ea-49aa-a18b-fcd8b9b9d3eb
00000000-0000-0000-0000-000000000000	370	7cmilcwg6i4b	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 08:34:22.54135+00	2025-09-02 08:34:22.54135+00	\N	725f2b2f-2014-4a49-979c-604e0782242f
00000000-0000-0000-0000-000000000000	149	b7pvxuhkmhaj	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:19:52.51693+00	2025-08-28 05:19:52.51693+00	\N	31750dd0-2dc4-45b1-bf2b-d4f85674bdf2
00000000-0000-0000-0000-000000000000	373	mfhoxwyak2vr	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-02 09:00:33.694558+00	2025-09-03 01:07:17.700094+00	\N	249ec385-e060-4a6c-996b-60d302554453
00000000-0000-0000-0000-000000000000	152	honyict63zpi	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:26:26.1198+00	2025-08-28 05:26:26.1198+00	\N	4be27e36-f472-4b8a-a28c-02cf3164f83b
00000000-0000-0000-0000-000000000000	143	cddexizdvzhx	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 04:11:55.829259+00	2025-08-28 05:29:44.141143+00	\N	93be5dfb-bd43-46f7-9c2d-2bdd7493f93b
00000000-0000-0000-0000-000000000000	154	yo3nlr3nwsth	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 05:29:44.143793+00	2025-08-28 05:29:44.143793+00	cddexizdvzhx	93be5dfb-bd43-46f7-9c2d-2bdd7493f93b
00000000-0000-0000-0000-000000000000	376	cgw6vlnxb3rs	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-02 09:54:41.350044+00	2025-09-03 01:23:08.841832+00	4kqcwjrb5d5l	e7122528-c83f-4e4e-8305-82fa9807d081
00000000-0000-0000-0000-000000000000	146	fz3jz3tbhefa	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-28 04:56:38.553586+00	2025-08-28 06:01:17.673076+00	hbf6krqfrgik	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	157	73q7vqjs2oug	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 06:14:08.354492+00	2025-08-28 06:14:08.354492+00	\N	ded85e51-f232-49b3-92d2-9ed3e54fa1b1
00000000-0000-0000-0000-000000000000	379	d6ig5prfvq25	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 01:42:52.034339+00	2025-09-03 01:42:52.034339+00	\N	9b1047b4-7ff3-4d95-b857-23d20c94aa12
00000000-0000-0000-0000-000000000000	155	yob5f5zxsikj	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 05:29:50.66948+00	2025-08-28 06:52:00.03341+00	\N	2e234c56-ce2c-4ebd-836e-e964a3939582
00000000-0000-0000-0000-000000000000	380	rqw3jlywni7r	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 01:43:09.889857+00	2025-09-03 04:40:09.040404+00	\N	d23bd046-d35f-42dd-a349-54e536a7ed80
00000000-0000-0000-0000-000000000000	384	aclhmb2ygcus	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 04:55:15.602294+00	2025-09-03 04:55:15.602294+00	\N	0a54baed-a033-4a9c-901c-93989ce8873f
00000000-0000-0000-0000-000000000000	159	g22ywx4kuebl	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 06:52:00.034712+00	2025-08-28 06:52:00.034712+00	yob5f5zxsikj	2e234c56-ce2c-4ebd-836e-e964a3939582
00000000-0000-0000-0000-000000000000	387	ha62obfsx7y6	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-09-03 05:33:33.67385+00	2025-09-03 05:33:33.67385+00	\N	fd63db8f-2f29-435c-92f1-e8baa5d71442
00000000-0000-0000-0000-000000000000	121	mqco35tes372	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-28 02:23:53.989003+00	2025-08-28 02:23:53.989003+00	\N	d24b9f12-f4f3-4839-bafc-b14a496fb5fb
00000000-0000-0000-0000-000000000000	122	fl34w7jgpfrf	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-28 02:24:00.664889+00	2025-08-28 02:24:00.664889+00	\N	1b2f3874-857a-44dc-b43c-3b33b7ecbea4
00000000-0000-0000-0000-000000000000	123	l2tx3qbzhmpk	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-28 02:24:59.720378+00	2025-08-28 02:24:59.720378+00	\N	a1262c2e-224b-4cfa-adf4-17b5ee52e3ce
00000000-0000-0000-0000-000000000000	124	omaeso756tbb	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-28 02:25:59.936374+00	2025-08-28 02:25:59.936374+00	\N	24518cb7-4b45-4a41-89f2-802f8c1c5947
00000000-0000-0000-0000-000000000000	162	y4lwo2eqbadw	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:06:21.105274+00	2025-08-28 07:06:21.105274+00	\N	927f8cf0-ca88-434f-8944-b5ec06a79795
00000000-0000-0000-0000-000000000000	164	urschlecaxgj	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:13:07.223074+00	2025-08-28 07:13:07.223074+00	\N	40682c28-bce4-4301-a3b0-cb8786f40e4a
00000000-0000-0000-0000-000000000000	390	qmiowb6u5gkc	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 07:01:24.095897+00	2025-09-03 07:01:24.095897+00	hqnjbyn4twar	0b7a65d5-4d39-4056-bac9-d0d8b2b1aba6
00000000-0000-0000-0000-000000000000	167	sr2ayymcvw2f	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:24:58.832757+00	2025-08-28 07:24:58.832757+00	\N	5d8f2892-8c7d-4898-836f-7dc9bc4b3ec2
00000000-0000-0000-0000-000000000000	169	34fwbahgwt2c	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:33:36.153656+00	2025-08-28 07:33:36.153656+00	\N	a68694de-5a5a-4b1e-adb8-e04e69fc0e44
00000000-0000-0000-0000-000000000000	171	fgsszwggdrty	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:39:19.342238+00	2025-08-28 07:39:19.342238+00	\N	ba7bd9e6-a934-46a9-914b-c4219c823833
00000000-0000-0000-0000-000000000000	173	u4aic62yde3v	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 07:54:40.268914+00	2025-08-28 07:54:40.268914+00	\N	aef50042-060b-4cfe-ad8b-dd1c893cb66f
00000000-0000-0000-0000-000000000000	165	vergsejbbrqy	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-28 07:13:49.929679+00	2025-08-28 08:17:08.937922+00	xb2pgjhqarup	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	399	ujnx2nef6bnd	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 07:57:18.158501+00	2025-09-03 07:57:18.158501+00	\N	661a4e6b-795f-4742-8d6e-46168fef797a
00000000-0000-0000-0000-000000000000	401	iviujjwa46ob	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 08:22:07.064022+00	2025-09-03 08:22:07.064022+00	\N	2bde1052-9cfe-4c5d-8aee-0b2997718ac8
00000000-0000-0000-0000-000000000000	175	3jzy6txyvlyh	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 08:04:10.006156+00	2025-08-28 10:22:12.838411+00	\N	965777df-87f7-4ecb-bdcb-7850b17cff01
00000000-0000-0000-0000-000000000000	180	ccpiuqyjf576	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:28:29.842536+00	2025-08-28 10:28:29.842536+00	\N	86b966b4-a615-43e1-b44b-dbcdc7ff984c
00000000-0000-0000-0000-000000000000	403	hnewgtq4euif	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 08:38:14.794819+00	2025-09-03 08:38:14.794819+00	\N	98cdcd4e-f623-4db2-8f08-6d79d0cf2625
00000000-0000-0000-0000-000000000000	183	io6vx7sxtlzt	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:34:38.723044+00	2025-08-28 10:34:38.723044+00	\N	1ea691a2-f426-4c3f-9c13-99695e5ade98
00000000-0000-0000-0000-000000000000	184	3f3lzeszt36t	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:35:48.391627+00	2025-08-28 10:35:48.391627+00	\N	26f74b9e-6942-4c33-9f52-34ac1cd7538d
00000000-0000-0000-0000-000000000000	186	ichqwl4nxkgi	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:42:55.378321+00	2025-08-28 10:42:55.378321+00	\N	b8dcc87f-c213-4cbc-a4b1-facf1c44e782
00000000-0000-0000-0000-000000000000	188	23mrrm6ujpgb	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:47:20.693037+00	2025-08-28 10:47:20.693037+00	\N	6f3abc18-f33d-4601-b440-f83e1c3c431c
00000000-0000-0000-0000-000000000000	190	gbgesfqgs33i	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:52:11.257143+00	2025-08-28 10:52:11.257143+00	\N	76033dc0-2174-476c-8846-fa09cb5e6a97
00000000-0000-0000-0000-000000000000	192	r3tm4nxmq65b	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 10:56:27.604906+00	2025-08-28 10:56:27.604906+00	\N	12ab5b6e-5a64-4f89-8f1e-2abf586d219d
00000000-0000-0000-0000-000000000000	194	oxahctwe27c6	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:00:59.311697+00	2025-08-28 11:00:59.311697+00	\N	ec3500da-3e96-40a5-be60-82dcd09f7012
00000000-0000-0000-0000-000000000000	196	7u3r3vjeweib	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:46:21.225563+00	2025-08-28 11:46:21.225563+00	\N	7a66374b-8ac5-40e7-b264-c02ff0af6cb2
00000000-0000-0000-0000-000000000000	198	xasynt37upuj	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 11:53:46.986803+00	2025-08-28 11:53:46.986803+00	\N	84b1d03f-a97f-4c53-ac7e-8e3828fb54c1
00000000-0000-0000-0000-000000000000	182	p5r7thxzf3wj	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 10:31:10.365512+00	2025-08-28 13:59:01.900358+00	\N	0a9e6b5d-703d-46be-9b36-3facade85b91
00000000-0000-0000-0000-000000000000	407	d6berqfknboy	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 08:59:53.744969+00	2025-09-03 08:59:53.744969+00	\N	af96bfc2-d95d-4fc8-a0e4-efe0758ee02c
00000000-0000-0000-0000-000000000000	409	xzx3iqga5iy3	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 10:07:42.525622+00	2025-09-03 10:07:42.525622+00	zw37rakdyuis	4b8e6bdf-8fe6-4347-a15f-d2ff08228b64
00000000-0000-0000-0000-000000000000	410	uvopmdb7wwwq	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 10:08:14.491793+00	2025-09-03 10:08:14.491793+00	\N	28bd85af-83f1-4f92-b65e-57e006cbf105
00000000-0000-0000-0000-000000000000	415	ttzgjadotuxt	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-03 13:02:00.024023+00	2025-09-03 13:02:00.024023+00	2h5zxjylbkj5	42bc9537-53ba-48ca-9b95-df71ca59a5e8
00000000-0000-0000-0000-000000000000	413	eb3fusnmqi6a	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 10:14:17.438633+00	2025-09-04 00:49:20.987648+00	\N	4f81aa37-1d7d-4a95-8e04-b7ee9066ad17
00000000-0000-0000-0000-000000000000	417	bx5vqre6z4ip	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-04 01:11:25.516179+00	2025-09-04 01:11:25.516179+00	\N	20e2fcba-0d77-4400-afd7-ebe7829c069a
00000000-0000-0000-0000-000000000000	418	t2x4apdkvl23	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-04 01:12:03.932612+00	2025-09-04 01:12:03.932612+00	\N	50e28e52-ae1e-4187-b716-71e759ad2264
00000000-0000-0000-0000-000000000000	395	5xboiifqdtcn	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 07:18:21.946935+00	2025-09-04 05:47:06.499401+00	\N	1c50cfd3-3f86-4414-98bb-8de8533bb289
00000000-0000-0000-0000-000000000000	213	h6mxhd2bju2e	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:44:53.03264+00	2025-08-28 12:44:53.03264+00	\N	0eba3c1d-f900-4470-ae42-632e43968854
00000000-0000-0000-0000-000000000000	214	7corzpkdp2la	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:46:37.044225+00	2025-08-28 12:46:37.044225+00	\N	f7646a00-7536-422b-836e-344b9cb82f35
00000000-0000-0000-0000-000000000000	215	lpjqtwusfsm2	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:49:32.764991+00	2025-08-28 12:49:32.764991+00	\N	faf582a1-9274-4f81-bc8f-2fc036b53aa5
00000000-0000-0000-0000-000000000000	216	ui4ihargzxug	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:54:16.085767+00	2025-08-28 12:54:16.085767+00	\N	038ff4bd-037a-41ac-bf50-88aeb8639945
00000000-0000-0000-0000-000000000000	217	3bfrn5alvfc6	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:56:57.506287+00	2025-08-28 12:56:57.506287+00	\N	61daf1c7-9ca9-4927-9b74-8a32e693a73b
00000000-0000-0000-0000-000000000000	218	nlc2ghixvxxy	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 12:59:17.094681+00	2025-08-28 12:59:17.094681+00	\N	2a011cbb-2816-49d4-98de-c9c81f057b09
00000000-0000-0000-0000-000000000000	219	ubh7s754lzlk	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:01:02.467449+00	2025-08-28 13:01:02.467449+00	\N	dab118ed-c344-44e8-b4ae-ee20dab653e8
00000000-0000-0000-0000-000000000000	220	qtuwsssjsvqc	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:02:23.976504+00	2025-08-28 13:02:23.976504+00	\N	fb374fa1-e1a4-4800-81db-177c7385dd65
00000000-0000-0000-0000-000000000000	221	m3f32viiauri	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:03:52.671124+00	2025-08-28 13:03:52.671124+00	\N	8dbbddf9-2397-4314-90de-880390d511e8
00000000-0000-0000-0000-000000000000	222	fxh4m3qxsanb	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:05:15.118689+00	2025-08-28 13:05:15.118689+00	\N	a5233f32-8570-4f46-a9d6-4474a0dadfaf
00000000-0000-0000-0000-000000000000	223	tcngh2we4sul	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:05:46.36563+00	2025-08-28 13:05:46.36563+00	\N	d8ad9460-405c-4080-94d2-71b771321635
00000000-0000-0000-0000-000000000000	224	33zqrlhusjsf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:06:48.278951+00	2025-08-28 13:06:48.278951+00	\N	c1e2930e-56a3-453e-ba13-df688fc032a2
00000000-0000-0000-0000-000000000000	225	u75rxjldmtjq	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:08:26.128462+00	2025-08-28 13:08:26.128462+00	\N	42b7881f-ba95-466b-bd47-cacc2350ef4e
00000000-0000-0000-0000-000000000000	226	m6v7xfj7sd7q	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:10:01.603825+00	2025-08-28 13:10:01.603825+00	\N	df5531c4-ad61-4110-a710-e8d899cb990f
00000000-0000-0000-0000-000000000000	227	uxnzcpiahwvv	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:13:37.478388+00	2025-08-28 13:13:37.478388+00	\N	d7389aa7-6346-4eca-bc54-dc78c65b8edc
00000000-0000-0000-0000-000000000000	228	32oaycsyfqhb	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:15:41.229204+00	2025-08-28 13:15:41.229204+00	\N	9c627915-91f8-469e-8333-8b3fb5cb4dd2
00000000-0000-0000-0000-000000000000	229	yp3us3jqelrr	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:18:43.385707+00	2025-08-28 13:18:43.385707+00	\N	27d719c3-4a4a-478a-a201-b33aad0d3cce
00000000-0000-0000-0000-000000000000	230	wlysz3f5vk5o	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:23:13.330208+00	2025-08-28 13:23:13.330208+00	\N	710c18d5-d09c-4238-a2b4-03dca55a3bd2
00000000-0000-0000-0000-000000000000	231	pszmtevjz2lw	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:26:46.312286+00	2025-08-28 13:26:46.312286+00	\N	11378a44-39ac-44b7-a514-56fd398cb9c4
00000000-0000-0000-0000-000000000000	232	2lxh53zgmgvm	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:28:50.021871+00	2025-08-28 13:28:50.021871+00	\N	716b5326-8a03-43d7-be47-1ba6cce1b2f4
00000000-0000-0000-0000-000000000000	233	rwrqkcr3wyku	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:35:57.101628+00	2025-08-28 13:35:57.101628+00	\N	c626f79a-5539-403f-abf1-5c3ddc48c195
00000000-0000-0000-0000-000000000000	234	jremp6rug4k4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:41:18.853962+00	2025-08-28 13:41:18.853962+00	\N	0456d879-d09e-49d7-aabd-a329590ca434
00000000-0000-0000-0000-000000000000	235	lwdbvzrgegt5	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:49:11.150351+00	2025-08-28 13:49:11.150351+00	\N	c13f9093-9787-42e8-87a3-9a198510b7e9
00000000-0000-0000-0000-000000000000	236	xwpbzvvc26en	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:49:42.278478+00	2025-08-28 13:49:42.278478+00	\N	c31ebb49-3d04-4116-a2a6-fbd414c7dcee
00000000-0000-0000-0000-000000000000	237	kd46rwgyp4eg	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:50:07.896896+00	2025-08-28 13:50:07.896896+00	\N	52d2d369-afe6-4c45-9d8c-fc659d7cd7b3
00000000-0000-0000-0000-000000000000	238	sgrm25jsmox4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:51:10.702237+00	2025-08-28 13:51:10.702237+00	\N	2fdd3a53-2198-4b53-a924-936ab37663af
00000000-0000-0000-0000-000000000000	239	qh2tlhbf4jle	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:52:17.859186+00	2025-08-28 13:52:17.859186+00	\N	53532985-eef9-4c90-b581-fcaa19aed099
00000000-0000-0000-0000-000000000000	240	2bd6lonypuqn	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:52:41.290776+00	2025-08-28 13:52:41.290776+00	\N	1e1445cf-0374-4871-b562-5bced882cfc2
00000000-0000-0000-0000-000000000000	241	lm6tkima3aiu	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:54:39.058797+00	2025-08-28 13:54:39.058797+00	\N	b254799d-85b7-400b-b672-5adf08b0a741
00000000-0000-0000-0000-000000000000	242	2ja7x7h7w5fm	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 13:59:01.908551+00	2025-08-28 13:59:01.908551+00	p5r7thxzf3wj	0a9e6b5d-703d-46be-9b36-3facade85b91
00000000-0000-0000-0000-000000000000	243	ounovpqjapic	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 14:04:23.960411+00	2025-08-28 23:18:08.514775+00	\N	75b4acd4-b7b6-44f9-9e98-72921e4e27f1
00000000-0000-0000-0000-000000000000	244	2czqovchvw5s	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 23:18:08.534193+00	2025-08-28 23:18:08.534193+00	ounovpqjapic	75b4acd4-b7b6-44f9-9e98-72921e4e27f1
00000000-0000-0000-0000-000000000000	247	ne2e4r67y64p	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 23:24:44.324038+00	2025-08-28 23:24:44.324038+00	\N	295ff45b-22ac-470d-b03f-5c15780a7b13
00000000-0000-0000-0000-000000000000	248	ytuvor7cixe5	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-28 23:25:32.146031+00	2025-08-28 23:25:32.146031+00	\N	18555e24-078e-42e1-b0d5-d654ca665d26
00000000-0000-0000-0000-000000000000	246	dh2ond4cgv3p	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 23:19:37.348289+00	2025-08-29 00:43:01.844878+00	\N	141a1df4-bb3b-470b-a4da-df43ee203d04
00000000-0000-0000-0000-000000000000	249	i7oh2wyxdyuj	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:43:01.855484+00	2025-08-29 00:43:01.855484+00	dh2ond4cgv3p	141a1df4-bb3b-470b-a4da-df43ee203d04
00000000-0000-0000-0000-000000000000	245	xq4hktrrem4w	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-28 23:18:15.431725+00	2025-08-29 00:43:04.093898+00	\N	373a807f-1376-446b-b01f-83d1f7af9ae4
00000000-0000-0000-0000-000000000000	250	cago2kvea6fc	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:43:04.094262+00	2025-08-29 00:43:04.094262+00	xq4hktrrem4w	373a807f-1376-446b-b01f-83d1f7af9ae4
00000000-0000-0000-0000-000000000000	251	mzybtbyeledk	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:43:25.55947+00	2025-08-29 00:43:25.55947+00	\N	863b01fd-bcf0-436b-925c-e94c560d7b21
00000000-0000-0000-0000-000000000000	252	uyjd476js35h	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:43:52.051862+00	2025-08-29 00:43:52.051862+00	\N	79687dbb-de89-4916-a3ee-191af141e02d
00000000-0000-0000-0000-000000000000	253	jsrylyzzzidt	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:44:09.428593+00	2025-08-29 00:44:09.428593+00	\N	9220664a-ba82-49ca-b665-3ce31a7f5bfb
00000000-0000-0000-0000-000000000000	255	oumvoyomwisg	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 00:48:35.467885+00	2025-08-29 00:48:35.467885+00	\N	f72675cd-0dbc-4570-83a9-1ad9840cad37
00000000-0000-0000-0000-000000000000	258	5esdn3ihj5as	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 01:38:35.608253+00	2025-08-29 01:38:35.608253+00	\N	21eb3e80-4c95-4e76-8bf1-3a4661f6d913
00000000-0000-0000-0000-000000000000	259	3vdrtkbsggxq	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 01:40:57.480313+00	2025-08-29 01:40:57.480313+00	\N	77a42f93-46ac-4fe6-a58f-bc9cf29aad0d
00000000-0000-0000-0000-000000000000	260	6ompqtb32sl6	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 01:49:50.563842+00	2025-08-29 01:49:50.563842+00	\N	29ce9b41-f7b2-4955-aa04-cf8d073c52cb
00000000-0000-0000-0000-000000000000	256	ikdlcbgnwktj	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 00:51:20.798943+00	2025-08-29 01:52:38.404584+00	\N	ffd5709d-6325-43a7-be08-c0f76bf74ac0
00000000-0000-0000-0000-000000000000	261	awtqtgel7xc2	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 01:52:38.41608+00	2025-08-29 01:52:38.41608+00	ikdlcbgnwktj	ffd5709d-6325-43a7-be08-c0f76bf74ac0
00000000-0000-0000-0000-000000000000	263	wmd7cu2smvt5	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:02:02.603802+00	2025-08-29 02:02:02.603802+00	\N	94b13b0f-09a8-4669-92bc-53d6967178c4
00000000-0000-0000-0000-000000000000	264	4n77paxfokdu	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:05:06.221143+00	2025-08-29 02:05:06.221143+00	\N	9eb31528-5a25-4249-8ebc-4c2fdb795587
00000000-0000-0000-0000-000000000000	265	ft2e2x6ww7ep	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:06:39.778858+00	2025-08-29 02:06:39.778858+00	\N	86c3709e-6aa5-42d2-9291-a152a6076fe7
00000000-0000-0000-0000-000000000000	266	atznydabmbv7	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:08:27.342229+00	2025-08-29 02:08:27.342229+00	\N	20f549d9-1349-40d0-9320-deef1f654914
00000000-0000-0000-0000-000000000000	262	zxkrb7h5m472	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 01:53:42.284525+00	2025-08-29 02:54:14.142365+00	\N	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	267	naf2ef2c62x6	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:10:08.562086+00	2025-08-29 02:10:08.562086+00	\N	2910d173-ebc7-49b0-8547-86509306e13a
00000000-0000-0000-0000-000000000000	268	uujasgwc4s27	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:13:08.05153+00	2025-08-29 02:13:08.05153+00	\N	1f8d9bcb-36bf-471d-b18a-d50ccb4ee21c
00000000-0000-0000-0000-000000000000	269	htu576tnuz7t	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:15:20.462326+00	2025-08-29 02:15:20.462326+00	\N	b31b7420-3447-400f-92d9-8f014263dbab
00000000-0000-0000-0000-000000000000	270	g32rissqwmei	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:18:10.944873+00	2025-08-29 02:18:10.944873+00	\N	2d7b6bd0-935b-434c-b719-1fb853f3a69a
00000000-0000-0000-0000-000000000000	271	qdxouv6vd2mu	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:20:01.419742+00	2025-08-29 02:20:01.419742+00	\N	489a0c06-0041-48ed-b524-83245d3a09db
00000000-0000-0000-0000-000000000000	273	wbkcxjuidluu	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:23:43.325036+00	2025-08-29 02:23:43.325036+00	\N	ecd47e21-b5f6-4f5c-8813-5b0e53054b91
00000000-0000-0000-0000-000000000000	274	2myowgmgnxhg	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:28:05.927574+00	2025-08-29 02:28:05.927574+00	\N	d3e4345f-fd3c-402a-b652-aa9b9f78cce7
00000000-0000-0000-0000-000000000000	275	euyg2z4tduht	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:29:28.889286+00	2025-08-29 02:29:28.889286+00	\N	c1966aba-7762-4a1f-980a-db403c1675ea
00000000-0000-0000-0000-000000000000	276	fwmblfyzq6cm	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 02:31:55.027033+00	2025-08-29 02:31:55.027033+00	\N	01c44c97-4cc8-4726-a8f5-8c5ea2fe70d1
00000000-0000-0000-0000-000000000000	277	scejumuptik7	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 02:32:53.605275+00	2025-08-29 03:33:49.094388+00	\N	f4094b0d-f435-4c2c-a03a-9653145609f1
00000000-0000-0000-0000-000000000000	278	lp2weky2akay	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 02:54:14.153022+00	2025-08-29 03:54:16.266687+00	zxkrb7h5m472	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	282	ktw7ebmgweju	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-29 04:02:37.350907+00	2025-08-29 04:02:37.350907+00	qqrjcayhgtus	6fdbfbc5-3f1e-4202-9f77-098e61d482c0
00000000-0000-0000-0000-000000000000	283	i2emh2d4evnc	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:08:34.261973+00	2025-08-29 04:08:34.261973+00	\N	77aca099-9f64-4234-b243-e419f27dfc2b
00000000-0000-0000-0000-000000000000	284	lrkim4duzqw7	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:11:52.947516+00	2025-08-29 04:11:52.947516+00	\N	f185a61d-fb7a-4708-a8c3-ab62493ecb2a
00000000-0000-0000-0000-000000000000	285	2eodrgpqwjz4	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:14:28.016544+00	2025-08-29 04:14:28.016544+00	\N	761e3012-e277-404b-8df0-5023e7579edb
00000000-0000-0000-0000-000000000000	286	rl6iasaadzgi	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:17:35.732297+00	2025-08-29 04:17:35.732297+00	\N	8f37b69a-ea4c-44cf-b986-2750b043bb01
00000000-0000-0000-0000-000000000000	287	ckxz5l4y324j	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:20:17.388619+00	2025-08-29 04:20:17.388619+00	\N	fef350d4-f69d-4d23-b2f5-a971a6272a2a
00000000-0000-0000-0000-000000000000	288	o62baqefazra	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:20:41.324898+00	2025-08-29 04:20:41.324898+00	\N	ab568aa1-9ad4-42fa-bf06-280fb523a2fc
00000000-0000-0000-0000-000000000000	289	3rfiig27lhqr	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:24:40.271139+00	2025-08-29 04:24:40.271139+00	\N	dee4c60f-73c4-4aa2-bff3-d7e8c9392b47
00000000-0000-0000-0000-000000000000	358	dwjjusnwevkb	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 02:50:37.407235+00	2025-09-02 02:50:37.407235+00	\N	35da4435-dc6e-4620-85eb-fbff63f92bf6
00000000-0000-0000-0000-000000000000	291	gva5qqlb344a	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:26:43.781+00	2025-08-29 04:26:43.781+00	\N	0d20f313-ef4c-4ae7-965c-38970c278698
00000000-0000-0000-0000-000000000000	362	orvblxhlvfgd	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 05:56:13.094028+00	2025-09-02 05:56:13.094028+00	\N	dd994c78-3c79-41d5-bbd7-c744017b0106
00000000-0000-0000-0000-000000000000	293	yjbpukw3xjyb	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 04:29:52.110623+00	2025-08-29 04:29:52.110623+00	\N	89cde53c-86cf-4538-852f-604ba9270616
00000000-0000-0000-0000-000000000000	280	u7gadipj3ble	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 03:33:49.096495+00	2025-08-29 04:33:52.018314+00	scejumuptik7	f4094b0d-f435-4c2c-a03a-9653145609f1
00000000-0000-0000-0000-000000000000	363	syfhej5up6ce	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 05:57:19.342853+00	2025-09-02 05:57:19.342853+00	\N	73aeee5c-ec08-4e14-84c4-1b00ec204bba
00000000-0000-0000-0000-000000000000	318	qelbrhuxq7ca	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-09-01 07:52:38.080573+00	2025-09-02 09:14:29.799762+00	\N	aa5bc789-778c-44ec-af86-ff8d7d81535e
00000000-0000-0000-0000-000000000000	281	tlmvoaq6v33i	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 03:54:16.275121+00	2025-08-29 04:54:36.275045+00	lp2weky2akay	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	313	2h5zxjylbkj5	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-09-01 07:46:03.419386+00	2025-09-03 13:02:00.005626+00	\N	42bc9537-53ba-48ca-9b95-df71ca59a5e8
00000000-0000-0000-0000-000000000000	292	mhcpxxloywul	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-29 04:27:05.665343+00	2025-08-29 05:27:08.838993+00	\N	51151001-2f6a-4c7e-ac74-622b0b03a59f
00000000-0000-0000-0000-000000000000	294	tv2pt2eb5zla	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 04:33:52.024359+00	2025-08-29 05:33:57.713581+00	u7gadipj3ble	f4094b0d-f435-4c2c-a03a-9653145609f1
00000000-0000-0000-0000-000000000000	295	6mv3ni4wdlfq	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 04:35:03.705714+00	2025-08-29 05:35:09.378507+00	\N	b83d3956-6f51-4577-b22e-a6b431450520
00000000-0000-0000-0000-000000000000	296	xxxldwlljt2u	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 04:54:36.283286+00	2025-08-29 06:19:46.176663+00	tlmvoaq6v33i	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	299	zgijovsj42qa	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-29 05:27:08.848249+00	2025-08-29 06:27:11.265587+00	mhcpxxloywul	51151001-2f6a-4c7e-ac74-622b0b03a59f
00000000-0000-0000-0000-000000000000	300	veny26nijw7r	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 05:33:57.717348+00	2025-08-29 06:59:09.463441+00	tv2pt2eb5zla	f4094b0d-f435-4c2c-a03a-9653145609f1
00000000-0000-0000-0000-000000000000	305	gshuwv4eznod	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-29 06:59:09.483356+00	2025-08-29 06:59:09.483356+00	veny26nijw7r	f4094b0d-f435-4c2c-a03a-9653145609f1
00000000-0000-0000-0000-000000000000	303	auaxejojfygr	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 06:19:46.179497+00	2025-08-29 07:19:49.028825+00	xxxldwlljt2u	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	304	i24cfgqneqeu	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-29 06:27:11.271408+00	2025-08-29 07:27:14.20394+00	zgijovsj42qa	51151001-2f6a-4c7e-ac74-622b0b03a59f
00000000-0000-0000-0000-000000000000	307	j5c2ks6z2b5d	df30a616-774a-4de3-a9bc-cde68c740398	t	2025-08-29 07:27:14.214767+00	2025-08-29 08:27:17.296373+00	i24cfgqneqeu	51151001-2f6a-4c7e-ac74-622b0b03a59f
00000000-0000-0000-0000-000000000000	308	cofghu5kbuao	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-08-29 08:27:17.313266+00	2025-08-29 08:27:17.313266+00	j5c2ks6z2b5d	51151001-2f6a-4c7e-ac74-622b0b03a59f
00000000-0000-0000-0000-000000000000	306	mc2v5c4gxe6c	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 07:19:49.041036+00	2025-08-31 04:13:49.709262+00	auaxejojfygr	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	310	liak63h7d6za	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-08-31 04:13:49.732297+00	2025-08-31 04:13:49.732297+00	mc2v5c4gxe6c	be66f513-8035-4f59-804b-1f838c6ac15e
00000000-0000-0000-0000-000000000000	311	zsx6d6prrcn4	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-31 04:14:02.98926+00	2025-09-01 07:45:57.459955+00	\N	5d4a948c-2533-4f58-ab80-2edac80ad7f6
00000000-0000-0000-0000-000000000000	312	u5htjrw7ogej	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-01 07:45:57.48518+00	2025-09-01 07:45:57.48518+00	zsx6d6prrcn4	5d4a948c-2533-4f58-ab80-2edac80ad7f6
00000000-0000-0000-0000-000000000000	301	razlebxx6os7	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-08-29 05:35:09.380564+00	2025-09-01 07:46:36.824576+00	6mv3ni4wdlfq	b83d3956-6f51-4577-b22e-a6b431450520
00000000-0000-0000-0000-000000000000	314	zqkhwscakr2k	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-01 07:46:36.824938+00	2025-09-01 07:46:36.824938+00	razlebxx6os7	b83d3956-6f51-4577-b22e-a6b431450520
00000000-0000-0000-0000-000000000000	315	c5tjqvfwkw4j	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-01 07:47:02.023818+00	2025-09-01 07:47:02.023818+00	\N	440634b4-e441-4f78-a3cb-d7b5c6faab42
00000000-0000-0000-0000-000000000000	316	hli5prxyqdil	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-01 07:47:33.376213+00	2025-09-01 07:47:33.376213+00	\N	361e0d98-b7f5-4051-8a52-3421bbf4caa0
00000000-0000-0000-0000-000000000000	317	ndo7v6me5vpf	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-01 07:51:55.020146+00	2025-09-01 07:51:55.020146+00	\N	0fa9c83b-0bd7-4842-970f-043c9a07c708
00000000-0000-0000-0000-000000000000	355	dk547oegcvsd	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 02:36:02.10269+00	2025-09-02 02:36:02.10269+00	\N	64b20ba0-573f-4608-bfbf-b8ca934c5421
00000000-0000-0000-0000-000000000000	359	6kpp2ecetyda	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-02 05:02:22.472746+00	2025-09-02 05:02:22.472746+00	\N	ce43b774-28d2-4348-9106-64eb69344193
00000000-0000-0000-0000-000000000000	364	rr4lq4esi7ev	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-02 06:01:48.077904+00	2025-09-02 08:25:05.012823+00	\N	80bc4ec9-65dd-4bdc-9d3f-b5bdcafd44fe
00000000-0000-0000-0000-000000000000	371	3ecyqdxjbj3w	df30a616-774a-4de3-a9bc-cde68c740398	f	2025-09-02 08:37:59.110703+00	2025-09-02 08:37:59.110703+00	\N	f049d4ae-be26-4864-ac53-cf6d9b026694
00000000-0000-0000-0000-000000000000	374	tgu2lgkrdcse	b48fd082-c0b1-4179-9165-fc64dfe31083	f	2025-09-02 09:14:29.809844+00	2025-09-02 09:14:29.809844+00	qelbrhuxq7ca	aa5bc789-778c-44ec-af86-ff8d7d81535e
00000000-0000-0000-0000-000000000000	377	e2l6xbd4d6ei	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 01:07:17.719427+00	2025-09-03 01:07:17.719427+00	mfhoxwyak2vr	249ec385-e060-4a6c-996b-60d302554453
00000000-0000-0000-0000-000000000000	381	k5uxyncnloiz	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 04:40:09.059109+00	2025-09-03 04:40:09.059109+00	rqw3jlywni7r	d23bd046-d35f-42dd-a349-54e536a7ed80
00000000-0000-0000-0000-000000000000	382	x2tdpsbferxk	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 04:40:13.020031+00	2025-09-03 04:40:13.020031+00	\N	0e14c0d6-9ce8-42e2-8a77-25706655532d
00000000-0000-0000-0000-000000000000	385	tmbkipltjlgi	b48fd082-c0b1-4179-9165-fc64dfe31083	t	2025-09-03 05:24:20.303029+00	2025-09-03 06:23:15.410902+00	\N	ca396172-2d69-4be7-99a6-711bf5b36867
00000000-0000-0000-0000-000000000000	388	hqnjbyn4twar	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 05:41:35.268066+00	2025-09-03 07:01:24.082036+00	\N	0b7a65d5-4d39-4056-bac9-d0d8b2b1aba6
00000000-0000-0000-0000-000000000000	391	szfueq3yist6	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 07:03:07.7395+00	2025-09-03 07:03:07.7395+00	\N	1435ee19-c260-4d15-8ad6-4554bcad5b7d
00000000-0000-0000-0000-000000000000	393	u2mew46wqqmf	4fcce705-778b-44fe-ab55-72cd36a49cef	f	2025-09-03 07:04:16.195925+00	2025-09-03 07:04:16.195925+00	\N	30aee953-5f50-462e-8c61-9b386f7a915c
00000000-0000-0000-0000-000000000000	396	coz5ezfoznqw	4fcce705-778b-44fe-ab55-72cd36a49cef	f	2025-09-03 07:26:54.311254+00	2025-09-03 07:26:54.311254+00	\N	85173d8c-2f5e-45b1-acdc-22ebbeec412b
00000000-0000-0000-0000-000000000000	392	qq67pmnae73i	e9f8a5af-002f-4c81-968a-7e08be3f9e82	t	2025-09-03 07:03:44.200904+00	2025-09-03 08:02:00.802892+00	\N	0cb66375-e065-4f58-8f04-9bf9dcbeebc7
00000000-0000-0000-0000-000000000000	400	ry565sqikht3	e9f8a5af-002f-4c81-968a-7e08be3f9e82	f	2025-09-03 08:02:00.81021+00	2025-09-03 08:02:00.81021+00	qq67pmnae73i	0cb66375-e065-4f58-8f04-9bf9dcbeebc7
00000000-0000-0000-0000-000000000000	402	kbb5qvtzjvel	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 08:23:56.505786+00	2025-09-03 08:23:56.505786+00	\N	7033880b-b223-423c-b0b6-05b2b438cd2e
00000000-0000-0000-0000-000000000000	405	hrzwrilax7tb	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 08:53:17.143336+00	2025-09-03 08:53:17.143336+00	\N	f86dc745-d97c-4785-bed7-427914a047aa
00000000-0000-0000-0000-000000000000	408	vn2tdnplwgcs	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 09:49:52.138273+00	2025-09-03 09:49:52.138273+00	\N	53c8f3b6-a1bd-4a7f-8552-98de32d5783c
00000000-0000-0000-0000-000000000000	404	zw37rakdyuis	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 08:52:06.528595+00	2025-09-03 10:07:42.50486+00	\N	4b8e6bdf-8fe6-4347-a15f-d2ff08228b64
00000000-0000-0000-0000-000000000000	406	3peezwifkffr	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	t	2025-09-03 08:53:19.538275+00	2025-09-03 10:11:08.050338+00	\N	e03f60c7-d67a-44a6-ae9d-e00d91860eec
00000000-0000-0000-0000-000000000000	411	y367x4igtiv4	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 10:11:08.053964+00	2025-09-03 10:11:08.053964+00	3peezwifkffr	e03f60c7-d67a-44a6-ae9d-e00d91860eec
00000000-0000-0000-0000-000000000000	412	3qiobhfb5g54	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 10:11:18.605577+00	2025-09-03 10:11:18.605577+00	\N	9ee4ffe6-cc57-41ca-b5ab-6b02002d22eb
00000000-0000-0000-0000-000000000000	414	q7addclzoja2	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-03 10:19:18.596085+00	2025-09-03 10:19:18.596085+00	\N	50283ded-4a5b-4fbf-b881-8fcde579deab
00000000-0000-0000-0000-000000000000	416	pf7frwkzlfv7	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-04 00:49:21.011822+00	2025-09-04 00:49:21.011822+00	eb3fusnmqi6a	4f81aa37-1d7d-4a95-8e04-b7ee9066ad17
00000000-0000-0000-0000-000000000000	419	ms4qnpytj6x3	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-04 05:47:06.522886+00	2025-09-04 05:47:06.522886+00	5xboiifqdtcn	1c50cfd3-3f86-4414-98bb-8de8533bb289
00000000-0000-0000-0000-000000000000	420	n42tciuvt7r3	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	f	2025-09-04 05:47:11.188992+00	2025-09-04 05:47:11.188992+00	\N	189056fb-555e-47ca-a2b3-57fce9ab5648
\.


--
-- TOC entry 4156 (class 0 OID 16856)
-- Dependencies: 253
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4157 (class 0 OID 16874)
-- Dependencies: 254
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4145 (class 0 OID 16533)
-- Dependencies: 239
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
\.


--
-- TOC entry 4150 (class 0 OID 16755)
-- Dependencies: 247
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
12ab5b6e-5a64-4f89-8f1e-2abf586d219d	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:56:27.599456+00	2025-08-28 10:56:27.599456+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
31750dd0-2dc4-45b1-bf2b-d4f85674bdf2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:19:52.515921+00	2025-08-28 05:19:52.515921+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
4be27e36-f472-4b8a-a28c-02cf3164f83b	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:26:26.117911+00	2025-08-28 05:26:26.117911+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
ec3500da-3e96-40a5-be60-82dcd09f7012	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:00:59.310672+00	2025-08-28 11:00:59.310672+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
2e234c56-ce2c-4ebd-836e-e964a3939582	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:29:50.668605+00	2025-08-28 06:52:00.037793+00	\N	aal1	\N	2025-08-28 06:52:00.037721	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
77b6fa89-68ae-420b-8e9e-1577712e9c84	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:02:14.738895+00	2025-08-28 07:02:14.738895+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
cb4e1d59-a0ed-40f6-8222-96edd4b2b0b7	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:04:17.829513+00	2025-08-28 07:04:17.829513+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
71ae6281-25a2-4e3a-b606-83167e7c4a07	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:08:32.530096+00	2025-08-28 07:08:32.530096+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
5602f825-91c4-42eb-a0ba-0c6d47265255	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:18:09.483306+00	2025-08-28 07:18:09.483306+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
bb3512ff-41e0-42ff-8de6-e2bd14da0924	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:29:45.651085+00	2025-08-28 07:29:45.651085+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
515cd73d-1517-454b-909a-961a3f7e5eb8	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:36:36.368618+00	2025-08-28 07:36:36.368618+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
7a66374b-8ac5-40e7-b264-c02ff0af6cb2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:46:21.208918+00	2025-08-28 11:46:21.208918+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
965777df-87f7-4ecb-bdcb-7850b17cff01	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 08:04:10.000924+00	2025-08-28 10:22:12.865183+00	\N	aal1	\N	2025-08-28 10:22:12.865091	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
86b966b4-a615-43e1-b44b-dbcdc7ff984c	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:28:29.826384+00	2025-08-28 10:28:29.826384+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
2e44f7dc-b2a7-47b9-8c0d-a43a4b570979	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:40:49.932393+00	2025-08-28 10:31:04.257261+00	\N	aal1	\N	2025-08-28 10:31:04.257193	Vercel Edge Functions	13.212.165.71	\N
1ea691a2-f426-4c3f-9c13-99695e5ade98	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:34:38.714559+00	2025-08-28 10:34:38.714559+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
26f74b9e-6942-4c33-9f52-34ac1cd7538d	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:35:48.390899+00	2025-08-28 10:35:48.390899+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
b8dcc87f-c213-4cbc-a4b1-facf1c44e782	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:42:55.37344+00	2025-08-28 10:42:55.37344+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
6f3abc18-f33d-4601-b440-f83e1c3c431c	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:47:20.691449+00	2025-08-28 10:47:20.691449+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
76033dc0-2174-476c-8846-fa09cb5e6a97	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:52:11.255916+00	2025-08-28 10:52:11.255916+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
d24b9f12-f4f3-4839-bafc-b14a496fb5fb	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-28 02:23:53.984234+00	2025-08-28 02:23:53.984234+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
1b2f3874-857a-44dc-b43c-3b33b7ecbea4	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-28 02:24:00.664199+00	2025-08-28 02:24:00.664199+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
a1262c2e-224b-4cfa-adf4-17b5ee52e3ce	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-28 02:24:59.719643+00	2025-08-28 02:24:59.719643+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
24518cb7-4b45-4a41-89f2-802f8c1c5947	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-28 02:25:59.935607+00	2025-08-28 02:25:59.935607+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
84b1d03f-a97f-4c53-ac7e-8e3828fb54c1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:53:46.983018+00	2025-08-28 11:53:46.983018+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
36e42ef4-71fd-4576-9a6c-7c80c879c4fe	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:58:25.039173+00	2025-08-28 11:58:25.039173+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
38b5c5c2-3155-421d-aeca-88b8a836bfb3	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:07:13.500256+00	2025-08-28 12:07:13.500256+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
b693ef58-fe18-4f7f-8fbb-ce3a217170c8	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:12:27.045205+00	2025-08-28 12:12:27.045205+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
64af4fb1-5ca0-44b8-81d7-04a464a2029a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:16:31.673841+00	2025-08-28 12:16:31.673841+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
8b9351ce-b977-4910-a7dc-61b64b8078e1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:41:10.106153+00	2025-08-28 12:41:10.106153+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
4bb37f74-6c16-4c0b-bdc3-d75f221159e5	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:42:15.920279+00	2025-08-28 12:42:15.920279+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
f7646a00-7536-422b-836e-344b9cb82f35	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:46:37.041836+00	2025-08-28 12:46:37.041836+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
038ff4bd-037a-41ac-bf50-88aeb8639945	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:54:16.073099+00	2025-08-28 12:54:16.073099+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
2a011cbb-2816-49d4-98de-c9c81f057b09	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:59:17.093685+00	2025-08-28 12:59:17.093685+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
fb374fa1-e1a4-4800-81db-177c7385dd65	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:02:23.973065+00	2025-08-28 13:02:23.973065+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
8dbbddf9-2397-4314-90de-880390d511e8	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:03:52.670405+00	2025-08-28 13:03:52.670405+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
42b7881f-ba95-466b-bd47-cacc2350ef4e	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:08:26.126793+00	2025-08-28 13:08:26.126793+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
d7389aa7-6346-4eca-bc54-dc78c65b8edc	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:13:37.475489+00	2025-08-28 13:13:37.475489+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
27d719c3-4a4a-478a-a201-b33aad0d3cce	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:18:43.38468+00	2025-08-28 13:18:43.38468+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
11378a44-39ac-44b7-a514-56fd398cb9c4	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:26:46.302454+00	2025-08-28 13:26:46.302454+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
c626f79a-5539-403f-abf1-5c3ddc48c195	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:35:57.094034+00	2025-08-28 13:35:57.094034+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
c13f9093-9787-42e8-87a3-9a198510b7e9	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:49:11.140609+00	2025-08-28 13:49:11.140609+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
f02fade2-6b7c-4e0e-a598-e61301c9c52f	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:50:36.816914+00	2025-08-28 11:50:36.816914+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
7a36f5a3-c256-4f05-9d65-c9966cda8215	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:56:00.275983+00	2025-08-28 11:56:00.275983+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
41081b36-cbff-4fb4-a07d-33c762c98cda	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:15:59.749008+00	2025-08-28 05:15:59.749008+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
7d98664f-b352-4bd6-b6ff-64ac782cc295	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:17:53.573703+00	2025-08-28 05:17:53.573703+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
f23fd9e6-49b9-400d-835a-7d69947e42fa	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:22:28.845825+00	2025-08-28 05:22:28.845825+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
49637b18-fece-4116-b991-12d93c55ddc5	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 05:28:06.17292+00	2025-08-28 05:28:06.17292+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
93be5dfb-bd43-46f7-9c2d-2bdd7493f93b	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 04:11:55.826896+00	2025-08-28 05:29:44.146363+00	\N	aal1	\N	2025-08-28 05:29:44.14629	Vercel Edge Functions	13.212.158.143	\N
81401cc4-9ee4-4387-b457-33b43ad7e42c	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:00:52.536996+00	2025-08-28 12:00:52.536996+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
ded85e51-f232-49b3-92d2-9ed3e54fa1b1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 06:14:08.340848+00	2025-08-28 06:14:08.340848+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
927f8cf0-ca88-434f-8944-b5ec06a79795	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:06:21.099135+00	2025-08-28 07:06:21.099135+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
40682c28-bce4-4301-a3b0-cb8786f40e4a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:13:07.214081+00	2025-08-28 07:13:07.214081+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
b623a85d-2b5b-44a5-acfb-c8805e2a148c	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:02:24.098084+00	2025-08-28 12:02:24.098084+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
5d8f2892-8c7d-4898-836f-7dc9bc4b3ec2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:24:58.815282+00	2025-08-28 07:24:58.815282+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
a68694de-5a5a-4b1e-adb8-e04e69fc0e44	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:33:36.149669+00	2025-08-28 07:33:36.149669+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
ba7bd9e6-a934-46a9-914b-c4219c823833	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:39:19.340457+00	2025-08-28 07:39:19.340457+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
aef50042-060b-4cfe-ad8b-dd1c893cb66f	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 07:54:40.25564+00	2025-08-28 07:54:40.25564+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
b03dc1d5-6068-4c99-9935-ac0cfb4f64d7	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:38:16.317499+00	2025-08-28 10:38:16.317499+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
a153c5ec-ec1b-45d3-926c-6840028c8635	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:45:06.256772+00	2025-08-28 10:45:06.256772+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
e2cd73d8-a397-4c60-ae0f-14ffd0d718b6	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:49:18.754674+00	2025-08-28 10:49:18.754674+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
c3219fdd-d2a1-4ed1-b88e-3c36ed6b76ed	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:54:09.919066+00	2025-08-28 10:54:09.919066+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
89eec8b7-80c6-451d-92ac-201098f92624	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:58:52.410347+00	2025-08-28 10:58:52.410347+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
75b40a12-d748-4239-87e6-fea8b9ff65ad	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 11:07:40.227517+00	2025-08-28 11:07:40.227517+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
7b212d85-d812-42b7-9ea9-d51edba8bc11	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:09:06.943092+00	2025-08-28 12:09:06.943092+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
48cd4c30-a361-4f63-bc71-9f08f2a47a17	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:14:27.456243+00	2025-08-28 12:14:27.456243+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
b8f7b627-24f2-4c8b-b8e3-d43d183f5b69	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:18:39.380875+00	2025-08-28 12:18:39.380875+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
2590bf09-a26b-447e-bb3e-970617efdc22	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:19:48.302368+00	2025-08-28 12:19:48.302368+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
0eba3c1d-f900-4470-ae42-632e43968854	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:44:53.027919+00	2025-08-28 12:44:53.027919+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
faf582a1-9274-4f81-bc8f-2fc036b53aa5	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:49:32.764002+00	2025-08-28 12:49:32.764002+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
61daf1c7-9ca9-4927-9b74-8a32e693a73b	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 12:56:57.504661+00	2025-08-28 12:56:57.504661+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
dab118ed-c344-44e8-b4ae-ee20dab653e8	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:01:02.466425+00	2025-08-28 13:01:02.466425+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
a5233f32-8570-4f46-a9d6-4474a0dadfaf	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:05:15.117658+00	2025-08-28 13:05:15.117658+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
d8ad9460-405c-4080-94d2-71b771321635	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:05:46.364831+00	2025-08-28 13:05:46.364831+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
c1e2930e-56a3-453e-ba13-df688fc032a2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:06:48.274703+00	2025-08-28 13:06:48.274703+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
df5531c4-ad61-4110-a710-e8d899cb990f	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:10:01.60274+00	2025-08-28 13:10:01.60274+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
9c627915-91f8-469e-8333-8b3fb5cb4dd2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:15:41.225672+00	2025-08-28 13:15:41.225672+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
710c18d5-d09c-4238-a2b4-03dca55a3bd2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:23:13.327543+00	2025-08-28 13:23:13.327543+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
716b5326-8a03-43d7-be47-1ba6cce1b2f4	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:28:50.020899+00	2025-08-28 13:28:50.020899+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
0456d879-d09e-49d7-aabd-a329590ca434	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:41:18.851231+00	2025-08-28 13:41:18.851231+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
c31ebb49-3d04-4116-a2a6-fbd414c7dcee	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:49:42.277103+00	2025-08-28 13:49:42.277103+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
52d2d369-afe6-4c45-9d8c-fc659d7cd7b3	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:50:07.896208+00	2025-08-28 13:50:07.896208+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
6fdbfbc5-3f1e-4202-9f77-098e61d482c0	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-28 02:43:12.463976+00	2025-08-29 04:02:37.359191+00	\N	aal1	\N	2025-08-29 04:02:37.359094	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
2fdd3a53-2198-4b53-a924-936ab37663af	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:51:10.700885+00	2025-08-28 13:51:10.700885+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
53532985-eef9-4c90-b581-fcaa19aed099	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:52:17.858473+00	2025-08-28 13:52:17.858473+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
1e1445cf-0374-4871-b562-5bced882cfc2	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:52:41.290077+00	2025-08-28 13:52:41.290077+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
b254799d-85b7-400b-b672-5adf08b0a741	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 13:54:39.057877+00	2025-08-28 13:54:39.057877+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
0a9e6b5d-703d-46be-9b36-3facade85b91	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 10:31:10.363211+00	2025-08-28 13:59:02.916429+00	\N	aal1	\N	2025-08-28 13:59:02.916351	Vercel Edge Functions	13.251.38.197	\N
8f37b69a-ea4c-44cf-b986-2750b043bb01	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:17:35.729455+00	2025-08-29 04:17:35.729455+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
0d20f313-ef4c-4ae7-965c-38970c278698	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:26:43.779597+00	2025-08-29 04:26:43.779597+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
75b4acd4-b7b6-44f9-9e98-72921e4e27f1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 14:04:23.951996+00	2025-08-28 23:18:10.402511+00	\N	aal1	\N	2025-08-28 23:18:10.402444	Vercel Edge Functions	47.129.49.199	\N
295ff45b-22ac-470d-b03f-5c15780a7b13	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 23:24:44.319665+00	2025-08-28 23:24:44.319665+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
18555e24-078e-42e1-b0d5-d654ca665d26	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 23:25:32.145305+00	2025-08-28 23:25:32.145305+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	112.153.197.107	\N
141a1df4-bb3b-470b-a4da-df43ee203d04	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 23:19:37.346982+00	2025-08-29 00:43:01.869291+00	\N	aal1	\N	2025-08-29 00:43:01.869197	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
373a807f-1376-446b-b01f-83d1f7af9ae4	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-28 23:18:15.42398+00	2025-08-29 00:43:04.099845+00	\N	aal1	\N	2025-08-29 00:43:04.09669	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
863b01fd-bcf0-436b-925c-e94c560d7b21	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 00:43:25.555461+00	2025-08-29 00:43:25.555461+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
79687dbb-de89-4916-a3ee-191af141e02d	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 00:43:52.051125+00	2025-08-29 00:43:52.051125+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
9220664a-ba82-49ca-b665-3ce31a7f5bfb	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 00:44:09.427757+00	2025-08-29 00:44:09.427757+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
f72675cd-0dbc-4570-83a9-1ad9840cad37	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 00:48:35.466397+00	2025-08-29 00:48:35.466397+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
21eb3e80-4c95-4e76-8bf1-3a4661f6d913	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 01:38:35.600453+00	2025-08-29 01:38:35.600453+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
77a42f93-46ac-4fe6-a58f-bc9cf29aad0d	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 01:40:57.474127+00	2025-08-29 01:40:57.474127+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
29ce9b41-f7b2-4955-aa04-cf8d073c52cb	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 01:49:50.562597+00	2025-08-29 01:49:50.562597+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
ffd5709d-6325-43a7-be08-c0f76bf74ac0	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 00:51:20.797406+00	2025-08-29 01:52:38.425727+00	\N	aal1	\N	2025-08-29 01:52:38.425641	Vercel Edge Functions	54.169.201.17	\N
94b13b0f-09a8-4669-92bc-53d6967178c4	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:02:02.600845+00	2025-08-29 02:02:02.600845+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
9eb31528-5a25-4249-8ebc-4c2fdb795587	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:05:06.216293+00	2025-08-29 02:05:06.216293+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
86c3709e-6aa5-42d2-9291-a152a6076fe7	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:06:39.775941+00	2025-08-29 02:06:39.775941+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
20f549d9-1349-40d0-9320-deef1f654914	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:08:27.341059+00	2025-08-29 02:08:27.341059+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
2910d173-ebc7-49b0-8547-86509306e13a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:10:08.560941+00	2025-08-29 02:10:08.560941+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
1f8d9bcb-36bf-471d-b18a-d50ccb4ee21c	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:13:08.04965+00	2025-08-29 02:13:08.04965+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
b31b7420-3447-400f-92d9-8f014263dbab	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:15:20.457806+00	2025-08-29 02:15:20.457806+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
2d7b6bd0-935b-434c-b719-1fb853f3a69a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:18:10.942526+00	2025-08-29 02:18:10.942526+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
489a0c06-0041-48ed-b524-83245d3a09db	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:20:01.418504+00	2025-08-29 02:20:01.418504+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
fef350d4-f69d-4d23-b2f5-a971a6272a2a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:20:17.387608+00	2025-08-29 04:20:17.387608+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
ecd47e21-b5f6-4f5c-8813-5b0e53054b91	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:23:43.323541+00	2025-08-29 02:23:43.323541+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
d3e4345f-fd3c-402a-b652-aa9b9f78cce7	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:28:05.925734+00	2025-08-29 02:28:05.925734+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
c1966aba-7762-4a1f-980a-db403c1675ea	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:29:28.888546+00	2025-08-29 02:29:28.888546+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
01c44c97-4cc8-4726-a8f5-8c5ea2fe70d1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:31:55.024644+00	2025-08-29 02:31:55.024644+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
51151001-2f6a-4c7e-ac74-622b0b03a59f	df30a616-774a-4de3-a9bc-cde68c740398	2025-08-29 04:27:05.664563+00	2025-08-29 08:27:17.329046+00	\N	aal1	\N	2025-08-29 08:27:17.328968	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
f4094b0d-f435-4c2c-a03a-9653145609f1	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 02:32:53.604476+00	2025-08-29 06:59:09.500915+00	\N	aal1	\N	2025-08-29 06:59:09.499736	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
77aca099-9f64-4234-b243-e419f27dfc2b	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:08:34.256527+00	2025-08-29 04:08:34.256527+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
f185a61d-fb7a-4708-a8c3-ab62493ecb2a	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:11:52.945806+00	2025-08-29 04:11:52.945806+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
761e3012-e277-404b-8df0-5023e7579edb	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:14:28.014798+00	2025-08-29 04:14:28.014798+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
ab568aa1-9ad4-42fa-bf06-280fb523a2fc	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:20:41.324135+00	2025-08-29 04:20:41.324135+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
dee4c60f-73c4-4aa2-bff3-d7e8c9392b47	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:24:40.264734+00	2025-08-29 04:24:40.264734+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
89cde53c-86cf-4538-852f-604ba9270616	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:29:52.109587+00	2025-08-29 04:29:52.109587+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
be66f513-8035-4f59-804b-1f838c6ac15e	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 01:53:42.276431+00	2025-08-31 04:13:49.758693+00	\N	aal1	\N	2025-08-31 04:13:49.757236	Vercel Edge Functions	13.250.14.198	\N
80bc4ec9-65dd-4bdc-9d3f-b5bdcafd44fe	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 06:01:48.074898+00	2025-09-02 08:25:08.701861+00	\N	aal1	\N	2025-09-02 08:25:08.701789	Vercel Edge Functions	54.169.192.192	\N
ab2d2017-574c-4852-8bb2-17de32df36c5	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:25:10.31261+00	2025-09-02 08:25:10.31261+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
5d4a948c-2533-4f58-ab80-2edac80ad7f6	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-31 04:14:02.981387+00	2025-09-01 07:45:57.511298+00	\N	aal1	\N	2025-09-01 07:45:57.51121	Vercel Edge Functions	47.128.67.48	\N
b83d3956-6f51-4577-b22e-a6b431450520	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-29 04:35:03.701766+00	2025-09-01 07:46:36.828087+00	\N	aal1	\N	2025-09-01 07:46:36.828019	node	211.48.39.89	\N
440634b4-e441-4f78-a3cb-d7b5c6faab42	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-01 07:47:02.023002+00	2025-09-01 07:47:02.023002+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
361e0d98-b7f5-4051-8a52-3421bbf4caa0	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-01 07:47:33.375487+00	2025-09-01 07:47:33.375487+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
0fa9c83b-0bd7-4842-970f-043c9a07c708	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-01 07:51:55.018267+00	2025-09-01 07:51:55.018267+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
7dbf5240-120b-4ed3-ba71-7164b1f43338	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:25:32.475611+00	2025-09-02 08:25:32.475611+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
03fa11c3-056d-4907-b203-04ee8e01057d	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:26:04.913046+00	2025-09-02 08:26:04.913046+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
725f2b2f-2014-4a49-979c-604e0782242f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:34:22.534155+00	2025-09-02 08:34:22.534155+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
f049d4ae-be26-4864-ac53-cf6d9b026694	df30a616-774a-4de3-a9bc-cde68c740398	2025-09-02 08:37:59.109527+00	2025-09-02 08:37:59.109527+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
aa5bc789-778c-44ec-af86-ff8d7d81535e	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-01 07:52:38.078191+00	2025-09-02 09:14:29.818666+00	\N	aal1	\N	2025-09-02 09:14:29.818582	node	211.48.39.89	\N
b838d60f-bda9-4ee0-ae6d-30a64920cd92	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:26:17.830629+00	2025-09-02 09:27:11.947372+00	\N	aal1	\N	2025-09-02 09:27:11.947293	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
d23bd046-d35f-42dd-a349-54e536a7ed80	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 01:43:09.888535+00	2025-09-03 04:40:11.096676+00	\N	aal1	\N	2025-09-03 04:40:11.096599	Next.js Middleware	54.180.240.174	\N
64b20ba0-573f-4608-bfbf-b8ca934c5421	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:36:02.09979+00	2025-09-02 02:36:02.09979+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
adcf379e-aaec-4444-9eb3-828f260ca684	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:42:55.936824+00	2025-09-02 02:42:55.936824+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
1c805ca5-293d-4284-9f12-14bcbfc8caf7	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:47:28.19346+00	2025-09-02 02:47:28.19346+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
35da4435-dc6e-4620-85eb-fbff63f92bf6	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:50:37.405437+00	2025-09-02 02:50:37.405437+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
ce43b774-28d2-4348-9106-64eb69344193	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 05:02:22.445609+00	2025-09-02 05:02:22.445609+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
ec291e8a-b2be-43af-a474-91113c723861	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 05:23:35.611146+00	2025-09-02 05:23:35.611146+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
4ec39acb-82ea-49aa-a18b-fcd8b9b9d3eb	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 05:54:27.291964+00	2025-09-02 05:54:27.291964+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
dd994c78-3c79-41d5-bbd7-c744017b0106	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 05:56:13.093079+00	2025-09-02 05:56:13.093079+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
73aeee5c-ec08-4e14-84c4-1b00ec204bba	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 05:57:19.342064+00	2025-09-02 05:57:19.342064+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
0e14c0d6-9ce8-42e2-8a77-25706655532d	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 04:40:13.014606+00	2025-09-03 04:40:13.014606+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
b3cae6d6-6faf-4409-a5b7-1170bdfe18af	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-03 04:43:15.768302+00	2025-09-03 04:43:15.768302+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
249ec385-e060-4a6c-996b-60d302554453	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 09:00:33.686406+00	2025-09-03 01:07:19.79371+00	\N	aal1	\N	2025-09-03 01:07:19.793629	Next.js Middleware	3.36.10.144	\N
0a54baed-a033-4a9c-901c-93989ce8873f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 04:55:15.59799+00	2025-09-03 04:55:15.59799+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
cb0e1fec-d397-46ca-a934-7ad4b9ad4eb9	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 05:29:36.508968+00	2025-09-03 05:29:36.508968+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
e7122528-c83f-4e4e-8305-82fa9807d081	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 08:54:35.990311+00	2025-09-03 01:25:24.727027+00	\N	aal1	\N	2025-09-03 01:25:24.726359	Vercel Edge Functions	13.250.231.148	\N
9b1047b4-7ff3-4d95-b857-23d20c94aa12	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 01:42:52.023024+00	2025-09-03 01:42:52.023024+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
0b7a65d5-4d39-4056-bac9-d0d8b2b1aba6	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 05:41:35.260848+00	2025-09-03 07:01:26.00155+00	\N	aal1	\N	2025-09-03 07:01:26.001474	Next.js Middleware	3.37.191.109	\N
fd63db8f-2f29-435c-92f1-e8baa5d71442	df30a616-774a-4de3-a9bc-cde68c740398	2025-09-03 05:33:33.672188+00	2025-09-03 05:33:33.672188+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	211.48.39.89	\N
ca396172-2d69-4be7-99a6-711bf5b36867	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-03 05:24:20.292502+00	2025-09-03 06:23:15.454643+00	\N	aal1	\N	2025-09-03 06:23:15.453424	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0	211.48.39.89	\N
30aee953-5f50-462e-8c61-9b386f7a915c	4fcce705-778b-44fe-ab55-72cd36a49cef	2025-09-03 07:04:16.195208+00	2025-09-03 07:04:16.195208+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	211.48.39.89	\N
1435ee19-c260-4d15-8ad6-4554bcad5b7d	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 07:03:07.732125+00	2025-09-03 07:03:07.732125+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
038148c9-b688-4df5-b554-1410346a2458	4fcce705-778b-44fe-ab55-72cd36a49cef	2025-09-03 07:15:45.645399+00	2025-09-03 07:15:45.645399+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	211.48.39.89	\N
85173d8c-2f5e-45b1-acdc-22ebbeec412b	4fcce705-778b-44fe-ab55-72cd36a49cef	2025-09-03 07:26:54.308531+00	2025-09-03 07:26:54.308531+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	211.48.39.89	\N
42bc9537-53ba-48ca-9b95-df71ca59a5e8	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-09-01 07:46:03.412087+00	2025-09-03 13:02:00.038241+00	\N	aal1	\N	2025-09-03 13:02:00.038159	Vercel Edge Functions	47.129.227.197	\N
1c50cfd3-3f86-4414-98bb-8de8533bb289	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 07:18:21.945938+00	2025-09-04 05:47:08.778491+00	\N	aal1	\N	2025-09-04 05:47:08.778409	Next.js Middleware	54.180.254.112	\N
6f390ba8-09d0-49f4-a3fb-8b8d075fb8d3	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 07:54:18.08128+00	2025-09-03 07:54:18.08128+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
db35293f-5672-4c1d-901d-719f8b732650	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 07:54:20.005772+00	2025-09-03 07:54:20.005772+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
661a4e6b-795f-4742-8d6e-46168fef797a	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 07:57:18.154319+00	2025-09-03 07:57:18.154319+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
0cb66375-e065-4f58-8f04-9bf9dcbeebc7	e9f8a5af-002f-4c81-968a-7e08be3f9e82	2025-09-03 07:03:44.197727+00	2025-09-03 08:02:00.813387+00	\N	aal1	\N	2025-09-03 08:02:00.813302	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0	211.48.39.89	\N
2bde1052-9cfe-4c5d-8aee-0b2997718ac8	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:22:07.052541+00	2025-09-03 08:22:07.052541+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
7033880b-b223-423c-b0b6-05b2b438cd2e	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:23:56.492505+00	2025-09-03 08:23:56.492505+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
98cdcd4e-f623-4db2-8f08-6d79d0cf2625	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:38:14.789926+00	2025-09-03 08:38:14.789926+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
f86dc745-d97c-4785-bed7-427914a047aa	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:53:17.102079+00	2025-09-03 08:53:17.102079+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
af96bfc2-d95d-4fc8-a0e4-efe0758ee02c	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:59:53.741725+00	2025-09-03 08:59:53.741725+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
53c8f3b6-a1bd-4a7f-8552-98de32d5783c	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 09:49:52.116327+00	2025-09-03 09:49:52.116327+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
4b8e6bdf-8fe6-4347-a15f-d2ff08228b64	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:52:06.523539+00	2025-09-03 10:07:42.538253+00	\N	aal1	\N	2025-09-03 10:07:42.538154	Vercel Edge Functions	100.26.107.181	\N
28bd85af-83f1-4f92-b65e-57e006cbf105	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 10:08:14.488122+00	2025-09-03 10:08:14.488122+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
e03f60c7-d67a-44a6-ae9d-e00d91860eec	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 08:53:19.536353+00	2025-09-03 10:11:08.056385+00	\N	aal1	\N	2025-09-03 10:11:08.056318	Vercel Edge Functions	107.22.127.15	\N
9ee4ffe6-cc57-41ca-b5ab-6b02002d22eb	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 10:11:18.600952+00	2025-09-03 10:11:18.600952+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
50283ded-4a5b-4fbf-b881-8fcde579deab	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 10:19:18.593917+00	2025-09-03 10:19:18.593917+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
4f81aa37-1d7d-4a95-8e04-b7ee9066ad17	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-03 10:14:17.433876+00	2025-09-04 00:49:21.039327+00	\N	aal1	\N	2025-09-04 00:49:21.039254	Vercel Edge Functions	98.80.207.67	\N
20e2fcba-0d77-4400-afd7-ebe7829c069a	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-04 01:11:25.496234+00	2025-09-04 01:11:25.496234+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
50e28e52-ae1e-4187-b716-71e759ad2264	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-04 01:12:03.931893+00	2025-09-04 01:12:03.931893+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
189056fb-555e-47ca-a2b3-57fce9ab5648	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-04 05:47:11.17962+00	2025-09-04 05:47:11.17962+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Whale/4.33.325.17 Safari/537.36	211.48.39.89	\N
\.


--
-- TOC entry 4155 (class 0 OID 16841)
-- Dependencies: 252
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4154 (class 0 OID 16832)
-- Dependencies: 251
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- TOC entry 4140 (class 0 OID 16495)
-- Dependencies: 234
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	e9f8a5af-002f-4c81-968a-7e08be3f9e82	authenticated	authenticated	hyeonji.wang@watercharging.com	$2a$10$bsAo.c7BWf4ETxBMf9gD.e2RmYeQlCQFa1HFQQnbtOMASCRhy6PdO	2025-09-03 07:03:32.557532+00	\N		2025-09-03 07:03:10.702049+00		\N			\N	2025-09-03 07:03:44.197645+00	{"provider": "email", "providers": ["email"]}	{"sub": "e9f8a5af-002f-4c81-968a-7e08be3f9e82", "name": "왕현지", "role": "viewer", "email": "hyeonji.wang@watercharging.com", "email_verified": true, "phone_verified": false}	\N	2025-09-03 07:03:10.671031+00	2025-09-03 08:02:00.811423+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	df30a616-774a-4de3-a9bc-cde68c740398	authenticated	authenticated	bokeum.eom@watercharging.com	$2a$10$4CRpYekq5w.u9LYv0T3i0eLflr7GgIjtsJNjWDr7g3pWW2bvVR.yi	2025-08-28 02:23:53.377483+00	\N		2025-08-28 02:23:23.766372+00		\N			\N	2025-09-03 05:33:33.672081+00	{"provider": "email", "providers": ["email"]}	{"sub": "df30a616-774a-4de3-a9bc-cde68c740398", "email": "bokeum.eom@watercharging.com", "email_verified": true, "phone_verified": false}	\N	2025-08-28 02:16:00.811781+00	2025-09-03 05:33:33.677681+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	4fcce705-778b-44fe-ab55-72cd36a49cef	authenticated	authenticated	gwihwi.min@watercharging.com	$2a$10$LVkGvkIp5ZgdVBMBoj1uJuvIkhtMtZ2yf2TSF.4DK..8GqOxxydLa	2025-09-03 07:03:48.431917+00	\N		2025-09-03 07:03:12.617353+00		\N			\N	2025-09-03 07:26:54.308443+00	{"provider": "email", "providers": ["email"]}	{"sub": "4fcce705-778b-44fe-ab55-72cd36a49cef", "name": "민귀휘", "role": "viewer", "email": "gwihwi.min@watercharging.com", "email_verified": true, "phone_verified": false}	\N	2025-09-03 07:03:12.611783+00	2025-09-03 07:26:54.317206+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b48fd082-c0b1-4179-9165-fc64dfe31083	authenticated	authenticated	kook.kim@watercharging.com	$2a$10$ZVcDy7xMoZORYvA..eXBcuF.HCpLZrIcogIpuJ33CFpQA3qjxkvxW	2025-08-27 13:11:56.696673+00	\N		2025-08-27 13:11:31.204123+00		\N			\N	2025-09-03 05:24:20.291405+00	{"provider": "email", "providers": ["email"]}	{"sub": "b48fd082-c0b1-4179-9165-fc64dfe31083", "email": "kook.kim@watercharging.com", "email_verified": true, "phone_verified": false}	\N	2025-08-27 13:11:31.17794+00	2025-09-03 13:02:00.031324+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	authenticated	authenticated	ray.kim@watercharging.com	$2a$10$BVlvtlcsUrcSsFQvtQ5uEO.FhyJk6xNjUXvdrTF/.gKahH1HD3b4W	2025-08-28 01:18:23.083521+00	\N		2025-08-28 01:10:07.154099+00		\N			\N	2025-09-04 05:47:11.177377+00	{"provider": "email", "providers": ["email"]}	{"sub": "a87aa309-7d6f-4b35-b213-e3db8fa24ebc", "email": "ray.kim@watercharging.com", "email_verified": true, "phone_verified": false}	\N	2025-08-28 01:10:07.119807+00	2025-09-04 05:47:11.193254+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- TOC entry 4179 (class 0 OID 19858)
-- Dependencies: 280
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_logs (id, menu, action, actor_id, actor_name, description, target_table, target_id, changes, created_at) FROM stdin;
1	channels	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	Teams 채널 삭제: ID d4a5384b-98c6-4c9f-a922-4e6477893682	teams_channels	d4a5384b-98c6-4c9f-a922-4e6477893682	\N	2025-09-02 02:50:54.999904+00
2	channels	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	Teams 채널 등록: 세금 알림	teams_channels	12c5f1fa-ef85-44a3-bdc8-1efb1973b38d	\N	2025-09-02 02:51:14.639227+00
3	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 7149c089-af80-48d1-9121-7887f10d6244	notifications	7149c089-af80-48d1-9121-7887f10d6244	\N	2025-09-02 05:02:56.596071+00
4	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 317646e3-4982-4fe8-a792-299f9e90f74e	notifications	317646e3-4982-4fe8-a792-299f9e90f74e	\N	2025-09-02 05:02:57.158682+00
5	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 948ae7e4-d25f-4f86-8f45-4b59af017de1	notifications	948ae7e4-d25f-4f86-8f45-4b59af017de1	\N	2025-09-02 05:02:57.47513+00
6	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 7f8c46d6-a595-4b5f-8cf7-e61ac84d2fb1	notifications	7f8c46d6-a595-4b5f-8cf7-e61ac84d2fb1	\N	2025-09-02 05:02:57.81395+00
7	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 448c39a6-1d31-4ade-b52e-fd159ebe22f7	notifications	448c39a6-1d31-4ade-b52e-fd159ebe22f7	\N	2025-09-02 05:02:58.19269+00
8	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID bdb6feb6-bc5a-403b-81ce-e62b002c9752	notifications	bdb6feb6-bc5a-403b-81ce-e62b002c9752	\N	2025-09-02 05:02:58.583961+00
9	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ac6a8739-8a60-495c-bc32-05c503fed0fb	notifications	ac6a8739-8a60-495c-bc32-05c503fed0fb	\N	2025-09-02 05:02:58.940834+00
10	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 087877f1-8713-417a-9d19-a368c1a10055	notifications	087877f1-8713-417a-9d19-a368c1a10055	\N	2025-09-02 05:02:59.333014+00
11	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID b700a5a8-ab5e-4c7b-af6a-82a6990e6797	notifications	b700a5a8-ab5e-4c7b-af6a-82a6990e6797	\N	2025-09-02 05:02:59.842648+00
12	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 417127f9-9ef2-4a17-95ee-d5f323d8e6f1	notifications	417127f9-9ef2-4a17-95ee-d5f323d8e6f1	\N	2025-09-02 05:03:00.187446+00
13	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 7e756add-bd5e-40cc-966f-4444a36be872	notifications	7e756add-bd5e-40cc-966f-4444a36be872	\N	2025-09-02 05:14:42.516676+00
14	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 957d85b0-ca56-4890-80dc-1edde56ae2d1	notifications	957d85b0-ca56-4890-80dc-1edde56ae2d1	\N	2025-09-02 05:14:43.068585+00
15	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 6c4d32e2-e384-4dd1-b848-daa8c90bceb9	notifications	6c4d32e2-e384-4dd1-b848-daa8c90bceb9	\N	2025-09-02 05:14:43.500546+00
16	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e8b29ef1-369d-4e21-9b93-23ef222a572e	notifications	e8b29ef1-369d-4e21-9b93-23ef222a572e	\N	2025-09-02 05:14:43.86444+00
17	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d089e445-be8c-42dd-a9d7-41c54b14d470	notifications	d089e445-be8c-42dd-a9d7-41c54b14d470	\N	2025-09-02 05:14:44.175544+00
18	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 4c826871-3bdf-40bb-91d6-c5d95a280ee7	notifications	4c826871-3bdf-40bb-91d6-c5d95a280ee7	\N	2025-09-02 05:14:44.610431+00
19	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 6f92348e-e77f-4cce-98d9-18737c8cf776	notifications	6f92348e-e77f-4cce-98d9-18737c8cf776	\N	2025-09-02 05:14:44.96495+00
20	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c1337cda-498c-42a2-8e8f-3a9e373c8034	notifications	c1337cda-498c-42a2-8e8f-3a9e373c8034	\N	2025-09-02 05:14:45.37454+00
21	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 57873694-76ab-49ab-a47c-7f5aa5d1fa19	notifications	57873694-76ab-49ab-a47c-7f5aa5d1fa19	\N	2025-09-02 05:14:46.609331+00
22	taxes	update	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 수정: ID 6daa60e2-9a0a-4e77-833d-43b9ae94a2c4	taxes	6daa60e2-9a0a-4e77-833d-43b9ae94a2c4	\N	2025-09-02 05:15:27.163488+00
23	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID bc83694d-763b-4f68-8ff6-26d33833da0c	notifications	bc83694d-763b-4f68-8ff6-26d33833da0c	\N	2025-09-02 05:15:37.761875+00
24	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 0a1f7018-21dc-4988-9388-ca638e881abc	notifications	0a1f7018-21dc-4988-9388-ca638e881abc	\N	2025-09-02 05:16:06.816246+00
25	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e46e24b5-f798-4798-ab1f-eec3243bfcd8	notifications	e46e24b5-f798-4798-ab1f-eec3243bfcd8	\N	2025-09-02 05:16:07.164878+00
26	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d36b42d2-48cf-46a5-8afd-80cfb3c54fda	notifications	d36b42d2-48cf-46a5-8afd-80cfb3c54fda	\N	2025-09-02 05:16:07.571621+00
27	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 013efc3f-e368-4367-9d11-f4d8e8e2dbec	notifications	013efc3f-e368-4367-9d11-f4d8e8e2dbec	\N	2025-09-02 05:16:07.844495+00
28	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c2ba473f-95ca-43cd-93bf-973f2ecb6223	notifications	c2ba473f-95ca-43cd-93bf-973f2ecb6223	\N	2025-09-02 05:16:08.534075+00
29	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 7fbe394b-5856-418d-b781-7a48a8e37f99	notifications	7fbe394b-5856-418d-b781-7a48a8e37f99	\N	2025-09-02 05:16:08.777803+00
30	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 862af914-6e1f-4a02-a0c7-20a737bf73ef	notifications	862af914-6e1f-4a02-a0c7-20a737bf73ef	\N	2025-09-02 05:16:08.988373+00
31	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 1330e30c-5196-4d7a-b899-8b17f573f0dd	notifications	1330e30c-5196-4d7a-b899-8b17f573f0dd	\N	2025-09-02 05:16:09.27929+00
32	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ca3c44d3-0b42-4a12-be9b-5d663164b837	notifications	ca3c44d3-0b42-4a12-be9b-5d663164b837	\N	2025-09-02 05:16:09.591555+00
33	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d7725932-c7c0-4598-ba66-80f01489ef86	notifications	d7725932-c7c0-4598-ba66-80f01489ef86	\N	2025-09-02 05:16:10.108801+00
34	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 알림 수동 등록 테스트	notifications	5ae27ef9-e8e0-4e19-a3d6-f400dfe980b2	\N	2025-09-02 05:31:47.628039+00
35	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 5ae27ef9-e8e0-4e19-a3d6-f400dfe980b2	notifications	5ae27ef9-e8e0-4e19-a3d6-f400dfe980b2	\N	2025-09-02 05:34:28.161394+00
36	stations	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	충전소 등록: 테스트 충전소	charging_stations	27755ad8-9d2e-4245-b1af-0ef1a40212ee	\N	2025-09-02 05:57:32.926597+00
37	stations	update	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	충전소 수정: 테스트 충전소	charging_stations	27755ad8-9d2e-4245-b1af-0ef1a40212ee	\N	2025-09-02 05:57:37.249257+00
38	stations	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	충전소 삭제: ID 27755ad8-9d2e-4245-b1af-0ef1a40212ee	charging_stations	27755ad8-9d2e-4245-b1af-0ef1a40212ee	\N	2025-09-02 05:57:41.964057+00
39	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 43522원, 기한 2025-09-18	taxes	6f216235-0336-4498-986f-e7667de1f42c	\N	2025-09-02 05:58:22.491733+00
40	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 100000원, 기한 2025-12-31	taxes	9b5280f9-d5ee-434e-9757-c30d4fee6918	\N	2025-09-02 06:02:09.046587+00
41	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 4cf247c1-6f6d-4337-a0a4-089443e10e6f	notifications	4cf247c1-6f6d-4337-a0a4-089443e10e6f	\N	2025-09-02 08:28:00.957824+00
42	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 55948d48-49a8-4430-b663-aede7ef11591	notifications	55948d48-49a8-4430-b663-aede7ef11591	\N	2025-09-02 08:28:01.425019+00
43	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c8d9a4fa-7055-4327-af37-29d89dcb9006	notifications	c8d9a4fa-7055-4327-af37-29d89dcb9006	\N	2025-09-02 08:28:01.793433+00
44	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 54d71f6e-9626-430b-a65f-d323b871c760	notifications	54d71f6e-9626-430b-a65f-d323b871c760	\N	2025-09-02 08:28:02.146325+00
45	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID bd51aafd-8893-4e37-9dad-c6c7f7c7033c	notifications	bd51aafd-8893-4e37-9dad-c6c7f7c7033c	\N	2025-09-02 08:28:02.565672+00
46	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 1fdd3463-fd0a-47e6-a4a3-2934f7721b48	notifications	1fdd3463-fd0a-47e6-a4a3-2934f7721b48	\N	2025-09-02 08:28:02.857212+00
47	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e6f16cac-c81f-4f28-82f1-1938f3f4073f	notifications	e6f16cac-c81f-4f28-82f1-1938f3f4073f	\N	2025-09-02 08:28:03.300011+00
48	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 30eff73b-2a87-4a0e-b472-454dbb4b4d01	notifications	30eff73b-2a87-4a0e-b472-454dbb4b4d01	\N	2025-09-02 08:28:03.607862+00
49	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 7c0406cc-4831-4303-b6ef-5d286e6c1fac	notifications	7c0406cc-4831-4303-b6ef-5d286e6c1fac	\N	2025-09-02 08:28:03.963565+00
50	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d3aa7287-085e-4b4b-b352-89243f212d4d	notifications	d3aa7287-085e-4b4b-b352-89243f212d4d	\N	2025-09-02 08:28:04.427919+00
51	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 3ebf90de-7b44-43ae-a474-32ddc0958af2	notifications	3ebf90de-7b44-43ae-a474-32ddc0958af2	\N	2025-09-03 01:45:19.61428+00
52	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 573566ce-354e-47a0-83fa-a80e01d69cf9	notifications	573566ce-354e-47a0-83fa-a80e01d69cf9	\N	2025-09-03 01:45:19.953657+00
53	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 01a3fe30-0bb8-4d86-a078-016fd6da17e0	notifications	01a3fe30-0bb8-4d86-a078-016fd6da17e0	\N	2025-09-03 01:45:20.42571+00
54	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d428d5c7-6c27-41db-b3f7-11c722dea4e1	notifications	d428d5c7-6c27-41db-b3f7-11c722dea4e1	\N	2025-09-03 01:45:20.655218+00
55	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 6f501878-328b-472f-8451-4d59097eb32e	notifications	6f501878-328b-472f-8451-4d59097eb32e	\N	2025-09-03 01:45:20.997855+00
56	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d5a409c5-b865-44a8-9cf1-861bac7d86e3	notifications	d5a409c5-b865-44a8-9cf1-861bac7d86e3	\N	2025-09-03 01:45:21.363362+00
57	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 9f82a656-7dff-4782-be22-a2a90f9b9032	notifications	9f82a656-7dff-4782-be22-a2a90f9b9032	\N	2025-09-03 01:45:21.689435+00
58	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID cbfd5576-9c97-4969-8266-494d0812ac47	notifications	cbfd5576-9c97-4969-8266-494d0812ac47	\N	2025-09-03 01:45:21.927706+00
59	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 5975240e-662a-4f6c-9ec1-f385d2730f13	notifications	5975240e-662a-4f6c-9ec1-f385d2730f13	\N	2025-09-03 01:45:22.319579+00
60	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c31b2cfc-fc4c-4326-bb65-03cf19f58697	notifications	c31b2cfc-fc4c-4326-bb65-03cf19f58697	\N	2025-09-03 01:45:22.918368+00
61	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 1235000원, 기한 2025-09-03	taxes	ea34ede0-d55c-47cc-9cc2-e4a020e2c062	\N	2025-09-03 04:55:52.273693+00
62	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 2b272932-1436-4d11-86bb-d556aed98132	notifications	2b272932-1436-4d11-86bb-d556aed98132	\N	2025-09-03 04:56:05.477829+00
63	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ba85b124-41c1-4d65-8585-02bfa828f3b6	notifications	ba85b124-41c1-4d65-8585-02bfa828f3b6	\N	2025-09-03 04:56:06.460141+00
64	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 30437823-9de8-4750-8cc9-413c1b1533b2	notifications	30437823-9de8-4750-8cc9-413c1b1533b2	\N	2025-09-03 04:56:07.021428+00
65	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID fd94c3fc-0fd2-49fd-9bfa-ce08928e9bde	notifications	fd94c3fc-0fd2-49fd-9bfa-ce08928e9bde	\N	2025-09-03 04:56:08.296048+00
66	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID decabdd8-c8bc-4bba-9d16-0d262dace299	notifications	decabdd8-c8bc-4bba-9d16-0d262dace299	\N	2025-09-03 04:56:09.26883+00
67	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID aedc38ad-2871-453e-8734-76b68495bebb	notifications	aedc38ad-2871-453e-8734-76b68495bebb	\N	2025-09-03 04:56:16.149349+00
68	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 73525da0-3dbb-480c-a59c-6a1566b56960	notifications	73525da0-3dbb-480c-a59c-6a1566b56960	\N	2025-09-03 04:56:16.341924+00
69	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ef8d072c-41bd-470b-9e00-265d07b480a4	notifications	ef8d072c-41bd-470b-9e00-265d07b480a4	\N	2025-09-03 04:56:16.70579+00
70	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 94b8550a-c8f2-4c60-af03-abbb74f17de0	notifications	94b8550a-c8f2-4c60-af03-abbb74f17de0	\N	2025-09-03 04:56:17.109956+00
71	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 88a7df52-3b40-4fd6-9b92-ed9369942a9b	notifications	88a7df52-3b40-4fd6-9b92-ed9369942a9b	\N	2025-09-03 04:56:17.490788+00
72	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 16675ed6-1ab7-47c9-843d-87542bb40953	notifications	16675ed6-1ab7-47c9-843d-87542bb40953	\N	2025-09-03 04:56:17.876813+00
73	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ad52479c-3ce7-4559-8e70-ae53f02c16e6	notifications	ad52479c-3ce7-4559-8e70-ae53f02c16e6	\N	2025-09-03 04:56:18.069441+00
74	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e08cd9b6-4fe0-44f2-972f-0189f6112235	notifications	e08cd9b6-4fe0-44f2-972f-0189f6112235	\N	2025-09-03 04:56:18.47288+00
75	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 438579a4-bc04-403f-bbc9-f7892dff4735	notifications	438579a4-bc04-403f-bbc9-f7892dff4735	\N	2025-09-03 04:56:18.825052+00
76	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID a413ed64-bd23-478a-9b67-3ce2136cdcc7	notifications	a413ed64-bd23-478a-9b67-3ce2136cdcc7	\N	2025-09-03 04:56:19.018565+00
77	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID fa3ba93a-183e-4743-b413-d6a5e6fa6c75	notifications	fa3ba93a-183e-4743-b413-d6a5e6fa6c75	\N	2025-09-03 04:56:19.264793+00
78	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e2a33fb7-7b1c-4c73-a4bf-78e8190accaf	notifications	e2a33fb7-7b1c-4c73-a4bf-78e8190accaf	\N	2025-09-03 04:56:19.617508+00
79	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 2d9d0f8a-a568-4f8b-a944-4efdd776905e	notifications	2d9d0f8a-a568-4f8b-a944-4efdd776905e	\N	2025-09-03 04:56:19.809041+00
80	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID a8f14b8e-8cba-4d0a-8dcb-04bbf0b20549	notifications	a8f14b8e-8cba-4d0a-8dcb-04bbf0b20549	\N	2025-09-03 04:56:19.983513+00
81	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 72749904-a11f-4376-b5e0-7e13470d09b8	notifications	72749904-a11f-4376-b5e0-7e13470d09b8	\N	2025-09-03 04:56:20.280049+00
82	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 서울 광화문 재산세 납부 알림	notifications	502d2515-bc1f-4c2f-a91d-fbdaf24e049f	\N	2025-09-03 04:57:38.798502+00
83	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 세금 알림 취득세 광화문	notifications	88921093-207b-41a9-a81d-99e426dc418e	\N	2025-09-03 04:58:17.164528+00
84	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 100000원, 기한 2025-09-25	taxes	8a75abc2-5011-44b9-8e61-c4bcc647e866	\N	2025-09-03 07:09:10.165959+00
85	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 계약 종료일	notifications	2da9b772-887a-49bc-a41b-9e256e54ece2	\N	2025-09-03 07:11:15.279338+00
86	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 계약 종료일	notifications	f4a9c9d0-f0ea-4114-a8ef-66609ed9c3f8	\N	2025-09-03 07:11:15.667702+00
87	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 2da9b772-887a-49bc-a41b-9e256e54ece2	notifications	2da9b772-887a-49bc-a41b-9e256e54ece2	\N	2025-09-03 07:12:14.254742+00
88	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID bcf5caeb-355d-4b22-97fa-d71157154408	notifications	bcf5caeb-355d-4b22-97fa-d71157154408	\N	2025-09-03 07:12:15.421608+00
89	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID a9d2e814-051d-43cb-82f6-55745dc7f20c	notifications	a9d2e814-051d-43cb-82f6-55745dc7f20c	\N	2025-09-03 07:12:16.633857+00
90	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID f4a9c9d0-f0ea-4114-a8ef-66609ed9c3f8	notifications	f4a9c9d0-f0ea-4114-a8ef-66609ed9c3f8	\N	2025-09-03 07:25:01.681578+00
91	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c8247dad-3244-4e5d-9514-af4ec3f62c05	notifications	c8247dad-3244-4e5d-9514-af4ec3f62c05	\N	2025-09-03 07:25:02.163605+00
92	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID ab0bd437-deda-4579-8a04-89caeb553afc	notifications	ab0bd437-deda-4579-8a04-89caeb553afc	\N	2025-09-03 07:25:02.68271+00
93	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 238340ab-a7e7-42c0-9bc8-6e8f29e068a5	notifications	238340ab-a7e7-42c0-9bc8-6e8f29e068a5	\N	2025-09-03 07:25:03.251082+00
94	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID d5cf29c4-464e-409d-9f32-e87b34da51f5	notifications	d5cf29c4-464e-409d-9f32-e87b34da51f5	\N	2025-09-03 07:25:03.778361+00
95	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 1a76dc4b-ab96-46fe-b13e-a1b7a5e5444f	notifications	1a76dc4b-ab96-46fe-b13e-a1b7a5e5444f	\N	2025-09-03 07:25:04.057051+00
96	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 88921093-207b-41a9-a81d-99e426dc418e	notifications	88921093-207b-41a9-a81d-99e426dc418e	\N	2025-09-03 07:25:04.541687+00
97	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 502d2515-bc1f-4c2f-a91d-fbdaf24e049f	notifications	502d2515-bc1f-4c2f-a91d-fbdaf24e049f	\N	2025-09-03 07:25:05.177238+00
98	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 18749b09-dbab-4baf-8b8c-d007c5c79b33	notifications	18749b09-dbab-4baf-8b8c-d007c5c79b33	\N	2025-09-03 07:25:05.752232+00
99	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 19c93c3e-185b-472a-bf88-60b94c3a585b	notifications	19c93c3e-185b-472a-bf88-60b94c3a585b	\N	2025-09-03 07:25:06.564379+00
100	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 4c2c4fbe-70ca-41b2-b5cc-66b64d23704f	notifications	4c2c4fbe-70ca-41b2-b5cc-66b64d23704f	\N	2025-09-03 07:25:08.138299+00
101	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 2de8881c-02c9-4cf6-9177-cf12a2d8ee16	notifications	2de8881c-02c9-4cf6-9177-cf12a2d8ee16	\N	2025-09-03 07:25:10.003956+00
102	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID ea34ede0-d55c-47cc-9cc2-e4a020e2c062	taxes	ea34ede0-d55c-47cc-9cc2-e4a020e2c062	\N	2025-09-03 07:25:17.716783+00
103	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID 9b5280f9-d5ee-434e-9757-c30d4fee6918	taxes	9b5280f9-d5ee-434e-9757-c30d4fee6918	\N	2025-09-03 07:25:19.988032+00
104	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID 8a75abc2-5011-44b9-8e61-c4bcc647e866	taxes	8a75abc2-5011-44b9-8e61-c4bcc647e866	\N	2025-09-03 07:25:22.983587+00
105	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID 6f216235-0336-4498-986f-e7667de1f42c	taxes	6f216235-0336-4498-986f-e7667de1f42c	\N	2025-09-03 07:25:25.587027+00
106	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID 6daa60e2-9a0a-4e77-833d-43b9ae94a2c4	taxes	6daa60e2-9a0a-4e77-833d-43b9ae94a2c4	\N	2025-09-03 07:25:27.39269+00
107	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID d7ecb39f-f7d1-4e9c-b306-1ed84027498e	taxes	d7ecb39f-f7d1-4e9c-b306-1ed84027498e	\N	2025-09-03 07:25:29.402959+00
108	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 1111111원, 기한 2025-09-25	taxes	5022555d-e94c-4077-b7fd-4a6920285e0e	\N	2025-09-03 07:57:59.452357+00
109	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 알림 메시지 발송	notifications	716cb60b-2c50-4173-bd89-796a12ed5b20	\N	2025-09-03 07:58:58.40465+00
110	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 716cb60b-2c50-4173-bd89-796a12ed5b20	notifications	716cb60b-2c50-4173-bd89-796a12ed5b20	\N	2025-09-03 08:00:04.178+00
111	taxes	update	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 수정: ID 5022555d-e94c-4077-b7fd-4a6920285e0e	taxes	5022555d-e94c-4077-b7fd-4a6920285e0e	\N	2025-09-03 08:03:39.319876+00
112	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 19e846c5-c9e2-4c64-abff-5ab5e8a82e64	notifications	19e846c5-c9e2-4c64-abff-5ab5e8a82e64	\N	2025-09-03 08:03:50.417979+00
113	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID b6cefbaf-4473-45ec-820e-de9a4c77794b	notifications	b6cefbaf-4473-45ec-820e-de9a4c77794b	\N	2025-09-03 08:03:52.557585+00
114	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c39dc401-0b28-4463-9621-47bc8f904843	notifications	c39dc401-0b28-4463-9621-47bc8f904843	\N	2025-09-03 08:03:54.267859+00
115	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID f3ea8919-2c9d-4f80-8b01-cea9078509db	notifications	f3ea8919-2c9d-4f80-8b01-cea9078509db	\N	2025-09-03 08:03:54.642783+00
116	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 1b405681-c58c-4712-887a-bdcc0c4f84ee	notifications	1b405681-c58c-4712-887a-bdcc0c4f84ee	\N	2025-09-03 08:03:54.831461+00
117	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c57eb93f-5d16-4bfb-bb0a-f1b8fc5d3757	notifications	c57eb93f-5d16-4bfb-bb0a-f1b8fc5d3757	\N	2025-09-03 08:03:55.037315+00
118	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID e74d0d41-725d-4472-a2df-89c32f4031e6	notifications	e74d0d41-725d-4472-a2df-89c32f4031e6	\N	2025-09-03 08:03:55.268077+00
119	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID b9485dcf-438b-49ab-9208-f7446e961adb	notifications	b9485dcf-438b-49ab-9208-f7446e961adb	\N	2025-09-03 08:03:55.447944+00
120	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID fe06085a-cac1-423c-8865-e0c925c14230	notifications	fe06085a-cac1-423c-8865-e0c925c14230	\N	2025-09-03 08:04:05.532001+00
121	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 36d23acf-c96a-400a-b700-e5f4928b5439	notifications	36d23acf-c96a-400a-b700-e5f4928b5439	\N	2025-09-03 08:04:09.806205+00
122	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 201834be-9476-4dc6-9c51-bd6078a77995	notifications	201834be-9476-4dc6-9c51-bd6078a77995	\N	2025-09-03 08:28:51.570428+00
123	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c003e68f-d9eb-4ed1-be9e-4a9932c1a3dc	notifications	c003e68f-d9eb-4ed1-be9e-4a9932c1a3dc	\N	2025-09-03 08:28:54.887749+00
124	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 수동 알림 테스트 발송합니다~	notifications	5ce8f3e2-9e5c-4e40-9e53-93031ecea231	\N	2025-09-03 08:31:43.288158+00
125	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 9e04ef65-d863-4ec6-a5e3-67e4cee600cb	notifications	9e04ef65-d863-4ec6-a5e3-67e4cee600cb	\N	2025-09-03 08:39:39.684934+00
126	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID b4ebeac6-4090-42f8-ad7c-c44d90bba6f6	notifications	b4ebeac6-4090-42f8-ad7c-c44d90bba6f6	\N	2025-09-03 08:39:47.924528+00
127	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 5ce8f3e2-9e5c-4e40-9e53-93031ecea231	notifications	5ce8f3e2-9e5c-4e40-9e53-93031ecea231	\N	2025-09-03 08:39:51.978526+00
128	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 4083ea36-c725-4535-8793-83138bf45c7c	notifications	4083ea36-c725-4535-8793-83138bf45c7c	\N	2025-09-03 08:52:28.366759+00
129	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 70df57eb-9dfa-4180-b477-300ec3629f77	notifications	70df57eb-9dfa-4180-b477-300ec3629f77	\N	2025-09-03 08:52:33.386147+00
130	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID dbc8bd4c-fa5b-43cc-a537-da62de02a7a3	notifications	dbc8bd4c-fa5b-43cc-a537-da62de02a7a3	\N	2025-09-03 09:00:36.770009+00
131	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID bd29f425-cac3-4e57-b10d-30fc187c1df1	notifications	bd29f425-cac3-4e57-b10d-30fc187c1df1	\N	2025-09-03 09:00:37.273109+00
132	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 50f2af6a-af11-4616-9a88-b501e64199ff	notifications	50f2af6a-af11-4616-9a88-b501e64199ff	\N	2025-09-03 09:00:38.093481+00
133	taxes	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 삭제: ID 5022555d-e94c-4077-b7fd-4a6920285e0e	taxes	5022555d-e94c-4077-b7fd-4a6920285e0e	\N	2025-09-03 09:00:42.64164+00
134	taxes	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	세금 등록: 금액 1000원, 기한 2025-09-20	taxes	d9ce90cc-6c15-41cc-b899-b729ef7b3f4d	\N	2025-09-03 09:01:09.294754+00
135	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 379eaf26-1cbb-4e31-8425-72c24db57a2b	notifications	379eaf26-1cbb-4e31-8425-72c24db57a2b	\N	2025-09-03 09:03:14.166655+00
136	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 0d441b29-fae3-4b1a-ac8c-a75c2aa89449	notifications	0d441b29-fae3-4b1a-ac8c-a75c2aa89449	\N	2025-09-03 09:03:14.692976+00
137	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID cc5c29c7-b717-4511-b558-3a8b99851006	notifications	cc5c29c7-b717-4511-b558-3a8b99851006	\N	2025-09-03 09:03:15.101545+00
138	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID f2d8ed5f-ad0a-4ab2-89a9-3d18d75fe5a7	notifications	f2d8ed5f-ad0a-4ab2-89a9-3d18d75fe5a7	\N	2025-09-03 09:03:15.574159+00
139	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 알림 메시지 테스트 중입니다. 잘 보내지나요?	notifications	834df3b3-3a4b-4b56-bd88-8bf7f90817e5	\N	2025-09-03 09:06:33.921301+00
140	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID 834df3b3-3a4b-4b56-bd88-8bf7f90817e5	notifications	834df3b3-3a4b-4b56-bd88-8bf7f90817e5	\N	2025-09-03 09:22:48.311081+00
141	notifications	create	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 생성: 팀즈 발송 테스트 성공하면 가는 메시지	notifications	c57719c1-0dc1-476e-82ff-ffbe1f07484c	\N	2025-09-03 09:23:15.8077+00
142	notifications	delete	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim	알림 삭제: ID c57719c1-0dc1-476e-82ff-ffbe1f07484c	notifications	c57719c1-0dc1-476e-82ff-ffbe1f07484c	\N	2025-09-04 05:47:23.614585+00
\.


--
-- TOC entry 4168 (class 0 OID 17397)
-- Dependencies: 269
-- Data for Name: charging_stations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.charging_stations (id, station_name, location, address, status, created_by, created_at, updated_at) FROM stdin;
af6b1cb5-48bc-420c-9038-53e2713368d5	거제 성포해안도로 위판장우측주차장	경남 거제시 사등면 성포리 325-6	경남 거제시 사등면 성포리 325-6	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
60addf04-3c94-49bd-8854-8edd89543157	거제 성포해안도로 위판장좌측주차장	경남 거제시 사등면 성포리351-43	경남 거제시 사등면 성포리351-43	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
c8a75729-f2c2-489c-84a5-00a4e979647f	거제 능포수변공원 우측공영주차장	경남 거제시 능포동 564-25	경남 거제시 능포동 564-25	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
6c905296-252b-459e-9700-c0aef808466b	동두천 놀자숲 테마파크 입구주차장	경기 동두천시 탑동동 산33	경기 동두천시 탑동동 산33	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
32c13d8c-d906-4fc8-867f-452f0bf2cea0	동두천 자연휴양림 방문자센터주차장	경기 동두천시 탑동동 산16	경기 동두천시 탑동동 산16	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
acb2a101-0a33-4f9d-873c-8a6808e89d24	동두천 소요별앤숲테마파크 제2주차장	경기도 동두천시 상봉암동 15-24	경기도 동두천시 상봉암동 15-24	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b3620f28-cccd-4508-ae52-221f5de48745	한국도로공사 밀양지사	경남 밀양시 산외면 남기리 844-1	경남 밀양시 산외면 남기리 844-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a34c4e6d-f1fb-4667-9f82-26dc2ac78bc2	한국도로공사 파주지사	경기 파주시 법원읍 삼방리 434-14	경기 파주시 법원읍 삼방리 434-14	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a96c6064-bf16-4603-9665-cd661c7cd703	한국도로공사 용인지사	경기 용인시 처인구 모현읍 이일로 80-24	경기 용인시 처인구 모현읍 이일로 80-24	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
103abe37-a470-4bc0-ae8a-fc4390363903	남원 대한교통	전북특별자치도 남원시 의서길 28	전북특별자치도 남원시 의서길 28	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f419c5d8-7617-4066-be9b-b80946feaa54	의정부 부민운수	경기도 의정부시 용민로61번길 58 부민운수	경기도 의정부시 용민로61번길 58 부민운수	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
44519de4-4a30-466a-99ea-97d84e2d4d00	제주 우진운수	제주 제주시 선반로 4길 26	제주 제주시 선반로 4길 26	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
dce3b37d-6a43-4db3-967f-c3935ebdc737	전주교통	전북특별자치도 전주시 덕진구 신복로 102-34	전북특별자치도 전주시 덕진구 신복로 102-34	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
ec3c6ee5-64a2-40af-ab1a-bca0872593aa	거제시반려동물지원센터	경상남도 거제시 사등면 두동로1길 107 반려동물지원센터	경상남도 거제시 사등면 두동로1길 107 반려동물지원센터	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
7e4a05fc-6c7e-43da-a936-ec81a4cbd669	동두천시보건소	경기도 동두천시 중앙로 167 동두천시보건소	경기도 동두천시 중앙로 167 동두천시보건소	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3c368b52-0c80-4c3c-970d-f712c4165c5c	동두천 불현동행정복지센터	경기 동두천시 행선로 123	경기 동두천시 행선로 123	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a8215bec-6099-434c-b85f-951eff79c570	동두천 중앙동공영주차장	경기 동두천시 생연동 612-1	경기 동두천시 생연동 612-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
32e0d9b7-647c-4176-9672-945981a66389	동두천 택시쉼터주차장	경기도 동두천시 벌마들로 82	경기도 동두천시 벌마들로 82	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3c49ecc5-def2-450d-bee3-a3842c36f37f	동두천 한미우호의광장주차장	경기도 동두천시 상패로 210-27	경기도 동두천시 상패로 210-27	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
8a87d047-af7e-472a-b176-9e05188819c3	동두천 대형자동차공영주차장	경기도 동두천시 벌마들로 82	경기도 동두천시 벌마들로 82	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
5bc109bf-c724-48a2-bb15-7f8decca54bc	동두천시청 부설주차장	경기 동두천시 생연동 428	경기 동두천시 생연동 428	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
fb5d62e9-c73d-4195-9178-2006b2925eb1	동두천시청	경기 동두천시 방죽로 23	경기 동두천시 방죽로 23	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
c6096b15-fc7a-424e-9112-dee3bee81264	현풍휴게소 창원방향	대구광역시 달성군 성하길 48 현풍휴게소(하행선)	대구광역시 달성군 성하길 48 현풍휴게소(하행선)	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
0a4100b9-291b-4760-97a5-6fb1dd406d67	현풍휴게소 대구방향	대구 달성군 현풍읍 성하리 345	대구 달성군 현풍읍 성하리 345	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
bfebbd6e-fd00-4e77-993b-5a27642ceed2	함안휴게소 순천방향	경상남도 함안군 군북면 유현리 992-6	경상남도 함안군 군북면 유현리 992-6	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
ad6941db-9987-403a-b5e0-710dc141ea44	함안휴게소 부산방향	경남 함안군 군북면 유현리 804-1	경남 함안군 군북면 유현리 804-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4220d77f-eef1-440d-9c60-880aa5628de9	진주휴게소 반려견놀이터주차장	경남 진주시 호탄동 802	경남 진주시 호탄동 802	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
67cb10c3-20b7-4fc4-a96f-feeacad13299	진영휴게소 순천방향	경상남도 김해시 진영읍 우동리 318-5	경상남도 김해시 진영읍 우동리 318-5	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
91f72c25-64dc-4882-ba95-64b7e66aab95	장유휴게소 서부산방향	경남 김해시 장유로116번길 44-82	경남 김해시 장유로116번길 44-82	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3a22f511-ad91-4196-b506-3e91c9586fcc	영산휴게소 창원방향	경남 창녕군 영산면 장척호수길 56-110	경남 창녕군 영산면 장척호수길 56-110	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4361a7fa-a61b-489f-9553-50de60b3b8fc	산청휴게소 통영방향	경상남도 산청군 단성면 방목리 367-10	경상남도 산청군 단성면 방목리 367-10	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
236c5ac7-7253-40e6-8659-e14099e6ec01	산청휴게소 대전방향	경남 산청군 단성면 통영대전고속도로 76	경남 산청군 단성면 통영대전고속도로 76	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
32b24d4c-87f8-406a-88b0-32a9c3de441b	김해금관가야휴게소 창원방향	경상남도 김해시 대동면 월촌리 761	경상남도 김해시 대동면 월촌리 761	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e29ac1f5-2e00-474a-8ff5-f98421b50e13	김해금관가야휴게소 기장방향	경상남도 김해시 대동면 월촌리 773	경상남도 김해시 대동면 월촌리 773	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a21c8826-4050-43bc-945e-1dfa5769384f	고성공룡나라휴게소 통영방향	경남 고성군 대가면 통영대전고속도로 29	경남 고성군 대가면 통영대전고속도로 29	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
d9c8d967-514f-4bd1-92a3-7a58f9fd0f98	고성공룡나라휴게소 대전방향	경남 고성군 대가면 통영대전고속도로 32	경남 고성군 대가면 통영대전고속도로 32	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4c9aa30c-6568-4a79-a3b2-7243a0c75b29	경주휴게소 부산방향	경상북도 경주시 내남면 경부고속도로 59	경상북도 경주시 내남면 경부고속도로 59	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
83939736-f386-42d0-8531-5d192e704c4c	칠곡휴게소 서울방향	경북 칠곡군 왜관읍 경부고속도로 158	경북 칠곡군 왜관읍 경부고속도로 158	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e822371f-742a-4b28-a814-c0a28cda3da7	청통휴게소 대구방향	경북 영천시 청통면 청통로 334-42	경북 영천시 청통면 청통로 334-42	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a3760c34-f896-49d7-95bc-b3e739cb8673	의성휴게소 청주방향	경북 의성군 안계면 양곡리 산102-2	경북 의성군 안계면 양곡리 산102-2	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f60ece08-eda8-4e48-974c-652bc62f022f	영천휴게소 대구방향	경북 영천시 임고면 운주로 791	경북 영천시 임고면 운주로 791	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
6ba9f51f-a427-4d70-8d6a-cdc53b549ffb	안동휴게소 부산방향	경북 안동시 풍산읍 풍산태사로 1903-27	경북 안동시 풍산읍 풍산태사로 1903-27	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
9bb5a56b-58bc-42aa-9493-a25ff43521ae	남성주참외휴게소 양평방향	경북 성주군 용암면 중부내륙고속도로 76	경북 성주군 용암면 중부내륙고속도로 76	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
390dc82e-0fd0-474b-8dc2-64c9d9c7a973	군위휴게소 부산방향	대구 군위군 군위읍 오곡리 413	대구 군위군 군위읍 오곡리 413	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
8a72633f-dceb-4cac-aa36-c2d2fe5c50d4	충주휴게소 양평방향	충북 충주시 중앙탑면 중부내륙고속도로 230-1	충북 충주시 중앙탑면 중부내륙고속도로 230-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
d47ece6e-8f1c-4b8c-954c-b4c457be7ed6	천등산휴게소 평택방향	충북 충주시 산척면 평택제천고속도로 109	충북 충주시 산척면 평택제천고속도로 109	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
31ea4a25-6307-4869-828f-d5567c165591	천등산휴게소 제천방향	충북 충주시 산척면 평택제천고속도로 106	충북 충주시 산척면 평택제천고속도로 106	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e376f898-66f3-4a65-9479-ea669af233de	선산휴게소 양평방향	경북 구미시 옥성면 중부내륙고속도로 128	경북 구미시 옥성면 중부내륙고속도로 128	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
cce993d6-8165-4052-9048-ae06eb99470a	문경휴게소 창원방향	경북 문경시 중부내륙고속도로 173	경북 문경시 중부내륙고속도로 173	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b73d924a-6587-4ae2-a78d-4ca31f8f42e3	문경휴게소 양평방향	경상북도 문경시 중부내륙고속도로 174 문경양평방향휴게소	경상북도 문경시 중부내륙고속도로 174 문경양평방향휴게소	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
59fbfcd6-ab65-491e-a6f7-aefa6f485b2c	괴산휴게소 창원방향	충청북도 괴산군 장연면 중부내륙고속도로 205 괴산마산휴게소	충청북도 괴산군 장연면 중부내륙고속도로 205 괴산마산휴게소	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3ad07b80-7452-437a-bd7e-242701c03d29	횡성휴게소 강릉방향	강원특별자치도 횡성군 안흥면 영동고속도로 154-2	강원특별자치도 횡성군 안흥면 영동고속도로 154-2	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
35650de1-fa33-4517-be62-a1679c9694e9	홍천강휴게소 춘천방향	강원 홍천군 북방면 소매곡리 284-2,301-4,284-1	강원 홍천군 북방면 소매곡리 284-2,301-4,284-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
ea22131b-fccb-4088-8991-ddfa929d9702	홍천휴게소 양양방향	강원 홍천군 화촌면 군업리 산240-5	강원 홍천군 화촌면 군업리 산240-5	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
2f48dfa3-9f90-499f-8a7a-a6e14e320842	홍천휴게소 서울방향	강원특별자치도 홍천군 화촌면 서울양양고속도로 83	강원특별자치도 홍천군 화촌면 서울양양고속도로 83	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
d4aa2850-d8fd-48ed-aa48-515024f66db4	평창휴게소 강릉방향	강원 평창군 용평면 이목정리 775	강원 평창군 용평면 이목정리 775	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e4aeb518-aad4-471f-863a-1b0057d52205	원주휴게소 춘천방향	강원 원주시 호저면 마근거리길 110	강원 원주시 호저면 마근거리길 110	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b6dbda10-51a8-4d88-82a0-5b3df4d3e91e	용인휴게소 인천방향	경기 용인시 처인구 고림동 76-2	경기 용인시 처인구 고림동 76-2	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
65944ca1-6201-4556-9316-7108d9117f9e	용인휴게소 강릉방향	경기 용인시 처인구 주북로94번길 30-1	경기 용인시 처인구 주북로94번길 30-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b06d6000-969b-4628-bdb1-3309949a6f1f	옥계휴게소 속초방향	강원 강릉시 옥계면 도직리 126-7	강원 강릉시 옥계면 도직리 126-7	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a64567c1-3638-4285-9c0d-9fcadbaf0b92	여주휴게소 인천방향	경기도 여주시 화평길 116 여주휴게소	경기도 여주시 화평길 116 여주휴게소	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a9bf72a8-6f13-4d1c-bb6a-8c943a5bf128	여주휴게소 강릉방향	경기도 여주시 가남읍 본두리 703-2	경기도 여주시 가남읍 본두리 703-2	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
46d9d867-c862-46ea-93ca-bf846a2a9d5e	서여주휴게소 창원방향	경기 여주시 세종대왕면 중부내륙고속도로 271	경기 여주시 세종대왕면 중부내륙고속도로 271	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f87d75e1-c2c4-4d80-9920-6f8f128edcfd	문막휴게소 인천방향	강원 원주시 문막읍 포진리 938-1	강원 원주시 문막읍 포진리 938-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
12b4538a-6289-40a0-98f1-447dc0f68566	내린천휴게소 양양방향	강원 인제군 상남면 서울양양고속도로 117	강원 인제군 상남면 서울양양고속도로 117	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f5beaa65-8561-414e-baf8-112649c3dd5a	내린천휴게소 서울방향	강원 인제군 상남면 하남리 345-1	강원 인제군 상남면 하남리 345-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
30ba9f1b-6e74-4819-9630-67a35bfb03c2	강릉대관령휴게소 인천방향	강원특별자치도 강릉시 성산면 영동고속도로 231 강릉상휴게소	강원특별자치도 강릉시 성산면 영동고속도로 231 강릉상휴게소	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
06bc7420-b031-4056-a640-d922afbd8f25	강릉대관령휴게소 강릉방향	강원특별자치도 강릉시 성산면 보광리 산41-1	강원특별자치도 강릉시 성산면 보광리 산41-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
bae52233-3da4-458e-b41e-e414694dd818	예산예당호휴게소 익산방향	충청남도 예산군 응봉면 평촌리 산61-4	충청남도 예산군 응봉면 평촌리 산61-4	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
fa6884da-3e79-4a08-b98f-71bf775deab6	예산예당호휴게소 평택방향	충청남도 예산군 응봉면 평촌리 산61-4	충청남도 예산군 응봉면 평촌리 산61-4	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
37eac11a-65ef-4ab6-9fd4-c8a6b1992763	평택호휴게소 외부입주민주차장	경기 평택시 현덕면 권관리 산95	경기 평택시 현덕면 권관리 산95	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
55c4308a-7c44-4a31-b2b4-60320c92d136	평택호휴게소 익산방향	경기도 평택시 현덕면 권관리 산95	경기도 평택시 현덕면 권관리 산95	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
c2840b80-1b23-46f2-8067-fe45d92caeae	평택호휴게소 평택방향	 경기도 평택시 현덕면 권관리 산95	 경기도 평택시 현덕면 권관리 산95	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e0b2a573-b2cb-40ab-8a19-799498d35366	의정부 범한상운	경기 의정부시 입석로55번길 1-16	경기 의정부시 입석로55번길 1-16	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
84734fa1-5c4c-4cb2-be63-ff4fac928a1b	서산 청자운수	충남 서산시 양대3길 9	충남 서산시 양대3길 9	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
49fc8242-0ff0-48d7-b6aa-4d305c465212	서산 신흥택시	충남 서산시 갈산1길 17-2	충남 서산시 갈산1길 17-2	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
9e447a13-086b-4f86-bf96-1f84a5e1129f	서산 서령택시	충남 서산시 서령로 286	충남 서산시 서령로 286	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f9fc8a2e-8f87-4065-8d02-246bb7cd7282	당진 대우가스	충남 당진시 합덕읍 남부로 1985	충남 당진시 합덕읍 남부로 1985	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
6c72b87c-5128-41e1-b12f-975e26478bb4	평택 천호운수	경기 평택시 송탄로 37	경기 평택시 송탄로 37	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
465fad8b-9f4f-4d35-bd05-8cca7b35ebdb	버거킹 제주애월DT	제주 제주시 애월읍 신엄리 2321	제주 제주시 애월읍 신엄리 2321	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
fc2bd962-d860-43d6-9c1f-7a2874540ff4	버거킹 부산명지DT	부산 강서구 명지국제6로 218	부산 강서구 명지국제6로 218	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
8bc789a8-f970-4755-aeeb-a3aab28bd406	버거킹 대전용두DT	대전 중구 용두동 29-22	대전 중구 용두동 29-22	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
95c4ff66-c97e-412f-b98d-d2755de1867a	버거킹 진주하대DT	경남 진주시 대신로 345	경남 진주시 대신로 345	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
cc4c2cc2-ddbb-4d11-97d4-ec2cdd78bbff	버거킹 전주삼천DT	전북 전주시 완산구 장승배기로 4	전북 전주시 완산구 장승배기로 4	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
ca165aaa-2af9-4884-9840-925b93f05e79	버거킹 제주화북DT	제주 제주시 화북일동3 907-9	제주 제주시 화북일동3 907-9	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
ca5867be-3ba4-4532-9518-bfccf28e0557	버거킹 제주함덕DT	제주 제주시 조천읍 일주동로 1186	제주 제주시 조천읍 일주동로 1186	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
aa8e342c-72ae-4566-be5d-bda51028c80c	버거킹 제주민속오일장DT	제주 제주시 일주서로 7802	제주 제주시 일주서로 7802	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b7e0f16f-7e1a-417a-9a76-a8e7d521b555	버거킹 고양덕양	경기 고양시 덕양구 호국로 1821	경기 고양시 덕양구 호국로 1821	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
53d0fee2-06db-4348-a241-dfb94a5fbe3c	유니클로 제주이도	제주 제주시 구남로8길 1	제주 제주시 구남로8길 1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
79bf413b-5a5c-4f4e-a0a2-a4ce818c21de	유니클로 원주	강원 원주시 북원로 2054	강원 원주시 북원로 2054	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
52d0f6c3-4574-4c39-99c2-dfbf99acefbd	유니클로 양산신기	경남 양산시 양산대로 921	경남 양산시 양산대로 921	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
207d7b90-40c4-41c1-9420-4fbba607a5fa	유니클로 전주효자	전북 전주시 완산구 콩쥐팥쥐로 1713	전북 전주시 완산구 콩쥐팥쥐로 1713	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
8b6f585a-a5c2-4b8e-a6f7-4943eb897d23	유니클로 부산사하	부산 사하구 하신중앙로 129	부산 사하구 하신중앙로 129	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e5115f00-1d15-47bb-bd06-290ac67ece58	유니클로 포항장성	경북 포항시 북구 장성동 449-3	경북 포항시 북구 장성동 449-3	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a2e61571-792d-4aa4-9f49-6d0ff2e14155	유니클로 충주	충북 충주시 계명대로 191	충북 충주시 계명대로 191	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
12630544-0ca9-46b3-a7d6-ca9b8b3b7a33	제주 하도리문화복지회관	제주 제주시 구좌읍 일주동로 3417	제주 제주시 구좌읍 일주동로 3417	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b9f3c023-895a-4579-aa15-7b0f0a81cbe0	제주 북촌리사무소	제주 제주시 조천읍 일주동로 1514	제주 제주시 조천읍 일주동로 1514	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
afaabfc1-e3a5-4572-a30d-4716bd3d2bb4	제주 신촌리사무소	제주 제주시 조천읍 신북로 54	제주 제주시 조천읍 신북로 54	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e983f74e-a81c-4333-a025-1c8b04196120	제주 하예하동마을회관	제주 서귀포시 예래로 416	제주 서귀포시 예래로 416	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
671b942b-bccf-467e-9c68-2c776cd53dc3	제주 남원1리복지회관	제주 서귀포시 남원읍 남원회관로 27	제주 서귀포시 남원읍 남원회관로 27	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f8b65460-7a18-4993-ae43-6cdcec0d2059	제주 동복리사무소	제주 제주시 구좌읍 동복리 1693	제주 제주시 구좌읍 동복리 1693	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
835a4fa6-3fa0-47c1-b98f-d4c52f2aa520	제주 서광동리복지회관	제주 서귀포시 안덕면 서광동로 17	제주 서귀포시 안덕면 서광동로 17	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
12553c52-e883-417f-815a-5cce9fce555c	제주 영락마을회관식당	제주 서귀포시 대정읍 영락리 1285-13	제주 서귀포시 대정읍 영락리 1285-13	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
00628219-0304-497a-b6af-cd9efeae8eca	제주 덕수리마을회관	제주 서귀포시 안덕면 덕수리 1921	제주 서귀포시 안덕면 덕수리 1921	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4a2496e9-a7b5-4ea4-a522-5dfefa94ad30	거제 반다비체육센터	경남 거제시 계룡로 149	경남 거제시 계룡로 149	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e2ab3143-ed09-4e0e-8a8c-b2f727287834	거제 고현시장공영주차장	경남 거제시 거제중앙로17길 6	경남 거제시 거제중앙로17길 6	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
826e23aa-12df-480a-94f1-d6af2b37e881	거제 농업기술센터	경남 거제시 거제면 서정리 856-1	경남 거제시 거제면 서정리 856-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
404b13cd-e846-4469-b7d0-d956d4a18912	거제 고현중앙공영주차장	경남 거제시 고현동 977-14	경남 거제시 고현동 977-14	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
2c4cc205-6bd8-494d-85cd-ea781ccc3972	거제 아주주민센터	경남 거제시 아주동 290-13	경남 거제시 아주동 290-13	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3863947b-8926-4c26-a713-8355d867f7c3	원주 신림행정복지센터	강원 원주시 신림면 치악로 28	강원 원주시 신림면 치악로 28	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a0de6237-9c78-4c2d-b2e6-823a4a59f32d	치악산 자연휴양림제1주차장	강원 원주시 판부면 휴양림길 66	강원 원주시 판부면 휴양림길 66	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
cd08f700-1ac0-4935-ba2d-4e9f91ea373b	원주 우산행정복지센터	강원 원주시 진광길 9	강원 원주시 진광길 9	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3a100461-52fd-47bf-8a31-50bb619c81ab	원주 반계은행나무광장주차장	강원 원주시 문막읍 반계리 1092-1	강원 원주시 문막읍 반계리 1092-1	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f4fc19ba-967a-4401-ac6f-4bb578397cf4	구원주역공영주차장	강원 원주시 평원로 158	강원 원주시 평원로 158	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
2deaa91d-55c6-49e0-bf43-eab3f0741bf2	원주 봉산미공영주차장	강원 원주시 봉산동 1073-6	강원 원주시 봉산동 1073-6	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
5aefe326-889e-44f5-b434-a898965ed994	원주 태장행정복지센터	강원 원주시 치악로 2068	강원 원주시 치악로 2068	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
b9913864-166f-460a-86e7-539a1d3b3b67	원주 일산행정복지센터	강원 원주시 천사로 159	강원 원주시 천사로 159	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4775c1ab-e095-4b85-851b-8aeb34a76d88	원주공항	강원 횡성군 횡성읍 횡성로 38	강원 횡성군 횡성읍 횡성로 38	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
dcc1ff08-8f22-4cbc-981a-cbd2b7cb9794	원주 치매안심센터	강원특별자치도 원주시 지니기길 11-20	강원특별자치도 원주시 지니기길 11-20	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
74b08d65-952b-433b-aeb2-634209ecf204	원주 세무서앞공영주차장	강원특별자치도 원주시 단계동 1080	강원특별자치도 원주시 단계동 1080	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a0a79c38-e4a6-4afc-a318-b88369cfafde	원주 개운행정복지센터	강원 원주시 행구로 40	강원 원주시 행구로 40	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3e7a1e70-6042-4e3a-b040-c324a5641c95	고양 일산탄현마을	경기 고양시 일산서구 탄현동 1506	경기 고양시 일산서구 탄현동 1506	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a2a40e12-4776-46fd-8a58-49ca8e07da39	고양 고봉커뮤니티센터	경기 고양시 일산동구 공릉천로 347	경기 고양시 일산동구 공릉천로 347	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
6f732ab6-a7f8-4cc2-a582-80735bd939b5	킨텍스 제2전시장	경기도 고양시 일산서구 킨텍스로 217-59 제2킨텍스	경기도 고양시 일산서구 킨텍스로 217-59 제2킨텍스	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
18116744-3d9c-4bde-8b2e-44aa3dbb3f1b	고양 탄현공원	경기도 고양시 일산서구 탄현동 1515	경기도 고양시 일산서구 탄현동 1515	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
1156f62f-e6cf-4ce2-b8a3-31a8724b07b5	고양 대화레포츠공원	경기도 고양시 일산서구 대화로 166 송포치안센터	경기도 고양시 일산서구 대화로 166 송포치안센터	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
c5a3d414-8f66-4064-8ea2-9e4d6fcf755f	고양 일산호수공원4	경기 고양시 일산동구 장항동 905	경기 고양시 일산동구 장항동 905	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
1f68d389-c8f3-458d-b9fe-2f06d775ed49	고양 일산호수공원3	경기도 고양시 일산동구 호수로 595 고양꽃전시관	경기도 고양시 일산동구 호수로 595 고양꽃전시관	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
63d0026a-8489-4675-8dca-af896263a6bb	고양 일산호수공원2	경기 고양시 일산동구 호수로 595	경기 고양시 일산동구 호수로 595	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
e7d4a59d-7ae5-4607-9e9d-32e731d78acf	고양 일산호수공원1	경기 고양시 일산동구 호수로 595	경기 고양시 일산동구 호수로 595	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
96729a7c-f99b-4554-b6e4-62a5d8ff0e8a	고양 농수산물유통센터 3주차장	경기도 고양시 일산서구 대화동 2324-3	경기도 고양시 일산서구 대화동 2324-3	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
91b36d6e-16aa-40ba-a414-30a468aa2216	고양 스포츠타운	경기 고양시 일산서구 대화동 2329	경기 고양시 일산서구 대화동 2329	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
cb826280-8b2b-48c7-884b-2606b1276592	고양 종합운동장 제3주차장	경기도 고양시 일산서구 중앙로 1601 고양종합운동장	경기도 고양시 일산서구 중앙로 1601 고양종합운동장	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
552df289-c255-416b-b39f-8815c6791d27	고양 재활스포츠센터	경기 고양시 일산서구 탄현로 139	경기 고양시 일산서구 탄현로 139	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
7b533892-f05d-46b2-975d-179c1ea17c04	고양 일산종합사회복지관	경기 고양시 일산서구 고양대로 654	경기 고양시 일산서구 고양대로 654	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a37b4164-eb19-4b12-82a1-054dbf014982	서울시교통회관	서울 송파구 올림픽로 319	서울 송파구 올림픽로 319	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f96e48a1-8ed3-49dc-a690-343261ef9275	연인산 제1주차장	경기 가평군 북면 백둔리 807	경기 가평군 북면 백둔리 807	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f9783b89-d4c5-4326-8233-2eb5c21f9106	연인산 탐방안내소주차장	경기 가평군 가평읍 승안리 297-60	경기 가평군 가평읍 승안리 297-60	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
18470069-5ff5-419a-bb27-fefaacbab2da	인천 우신교통	인천 남동구 간석동 599	인천 남동구 간석동 599	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
fdf72a0e-5314-43a3-9007-38e8749ad4cd	버거킹 안성아양DT	경기 안성시 아양2로 92	경기 안성시 아양2로 92	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3769f42a-c1c9-4422-b742-313d9d2fb83f	서울 태영운수	서울 강서구 양천로27길 169	서울 강서구 양천로27길 169	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
0e1dfbb8-2da0-4f83-ae9d-9a69f97094da	세종 국립수목원	세종 세종동 1203	세종 세종동 1203	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
533721b1-6961-4199-96a3-f3ce793fbdfe	버거킹 화성능동	경기 화성시 동탄지성로 190	경기 화성시 동탄지성로 190	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
c0500067-2a37-41b2-98eb-4fab5307cd64	안산 선부	경기 안산시 단원구 달미로 63	경기 안산시 단원구 달미로 63	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
530b1057-0d07-4fde-b328-1f314d94ec2f	송파 한양타워	서울 송파구 법원로11길 12	서울 송파구 법원로11길 12	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
f1f69875-063a-436b-b462-59f16d5b4649	북한산 제1주차장	서울 은평구 진관동 280	서울 은평구 진관동 280	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
66c92550-9845-46cd-95b7-a51534490505	용인 AK&기흥	경기 용인시 기흥구 기흥역로 63 힐스테이트 기흥	경기 용인시 기흥구 기흥역로 63 힐스테이트 기흥	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
a3f1077e-7454-48f5-93fc-08d7da9bccf2	북한산 사기막야영장	경기 고양시 덕양구 북한산로618번길 130	경기 고양시 덕양구 북한산로618번길 130	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
17ea9597-8c75-4a0d-b466-f32d0586adcb	버거킹 청주분평DT	충북 청주시 서원구 청남로 1918	충북 청주시 서원구 청남로 1918	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
6233eb6b-2a35-469b-b0f3-b808eeddb164	태안 몽산포해수욕장	충남 태안군 남면 안면대로 967	충남 태안군 남면 안면대로 967	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
4f43acfd-22a9-4d0f-be67-9f9058ba36a0	양양 서피비치	강원 양양군 현북면 동해대로 1631	강원 양양군 현북면 동해대로 1631	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
3f379ded-8b15-484f-a9d3-2475b3317e94	보령 대천해수욕장	충남 보령시 요암동 376	충남 보령시 요암동 376	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
454beb84-3095-44f1-b6ec-455d6d235781	부산 신평	부산광역시 사하구 하신중앙로 121	부산광역시 사하구 하신중앙로 121	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
934e1052-3c2e-4e5b-9ec5-74bf2a66e2ec	대구 반월당	대구 중구 달구벌대로 2095	대구 중구 달구벌대로 2095	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
7cc3ef35-5627-420a-8532-9067fb05ca21	경남 거제식물원	경남 거제시 거제면 거제남서로 3595	경남 거제시 거제면 거제남서로 3595	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
d1f8a4c2-8b5b-4eee-8955-8d3e76f1ac1a	봉화 국립수목원	경북 봉화군 춘양면 춘양로 1501 (서벽리)	경북 봉화군 춘양면 춘양로 1501 (서벽리)	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
5468560f-26f4-433d-8dc6-aa30b72d6e42	서울 광화문	서울 종로구 종로1길 50 (더케이트윈타워)	서울 종로구 종로1길 50 (더케이트윈타워)	operating	\N	2025-08-29 04:07:10.377521+00	2025-08-29 04:07:10.377521+00
\.


--
-- TOC entry 4177 (class 0 OID 17608)
-- Dependencies: 278
-- Data for Name: email_recipients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.email_recipients (id, email, name, is_active, created_by, created_at, updated_at) FROM stdin;
82b42bb1-197f-4352-b507-fa3ff6808c5a	kook.kim@watercharging.com	김종국	t	b48fd082-c0b1-4179-9165-fc64dfe31083	2025-08-27 23:41:54.94885+00	2025-08-27 23:41:54.94885+00
f1e48f1a-8f72-402c-8eac-1d9bfc479079	ray.kim@watercharging.com		f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-08-28 09:58:55.42046+00	2025-09-01 10:11:37.672215+00
bb099055-2434-49a7-96fe-69299ea9a304	ray.kim@watercharging.com	김수민	f	\N	2025-09-01 10:13:44.798901+00	2025-09-01 10:13:47.855109+00
10ecc103-579c-4685-820c-2e4c199ee6a7	ray.kim@watercharging.com	김수민	f	\N	2025-09-01 10:13:45.049784+00	2025-09-01 10:30:50.136349+00
57e705bd-200c-4beb-9264-34f6953d9899	ray.kim@watercharging.com	김수민	t	\N	2025-09-02 02:54:22.943524+00	2025-09-02 02:54:22.943524+00
\.


--
-- TOC entry 4175 (class 0 OID 17547)
-- Dependencies: 276
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.holidays (id, holiday_date, holiday_name, is_recurring, created_at) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 17532)
-- Dependencies: 275
-- Data for Name: notification_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification_logs (id, notification_id, send_status, error_message, sent_at) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 17486)
-- Dependencies: 273
-- Data for Name: notification_schedules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification_schedules (id, schedule_name, days_before, notification_time, is_active, created_at, updated_at) FROM stdin;
8efafc54-4347-485d-a71d-576b979e1f21	30일 전 알림	30	09:00:00	t	2025-08-28 13:23:01.430365+00	2025-08-28 13:23:01.430365+00
d6c30aa5-4f07-4417-9528-4e0e400fc1c4	연체 알림	-1	09:00:00	t	2025-08-28 13:23:01.430365+00	2025-08-28 13:23:01.430365+00
85fc8659-4f81-483d-8ad8-e0d3da875fcf	100일 전 알림	100	10:00:00	f	2025-09-02 05:13:13.644283+00	2025-09-02 05:13:31.759391+00
b7e60db7-20f1-40ae-9cbf-86096d0f1530	당일 알림	0	09:00:00	f	2025-08-28 13:23:01.430365+00	2025-09-03 04:56:34.133913+00
17af6222-a853-457e-be5e-7b8c855b7908	7일 전 알림	7	09:00:00	f	2025-08-28 13:23:01.430365+00	2025-09-03 04:56:47.404094+00
495a58a7-eef5-41c1-aa3b-5bb49d6a4f68	14일 전 알림	14	10:00:00	t	2025-08-28 13:23:01.430365+00	2025-09-03 08:04:25.794831+00
4b45b89f-0fbb-406a-9d9f-03a02a394538	1일 전 알림	1	10:00:00	t	2025-09-03 07:11:44.001415+00	2025-09-03 08:04:41.99986+00
\.


--
-- TOC entry 4173 (class 0 OID 17498)
-- Dependencies: 274
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, tax_id, notification_type, schedule_id, notification_date, notification_time, message, is_sent, sent_at, teams_channel_id, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4170 (class 0 OID 17447)
-- Dependencies: 271
-- Data for Name: tax_status_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_status_history (id, tax_id, previous_status, new_status, changed_by, changed_at, reason) FROM stdin;
\.


--
-- TOC entry 4169 (class 0 OID 17417)
-- Dependencies: 270
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxes (id, station_id, tax_type, tax_amount, due_date, status, payment_date, tax_notice_number, tax_year, tax_period, notes, created_by, updated_by, created_at, updated_at) FROM stdin;
d9ce90cc-6c15-41cc-b899-b729ef7b3f4d	5468560f-26f4-433d-8dc6-aa30b72d6e42	property	1000.00	2025-09-20	payment_scheduled	\N	\N	\N	1분기	\N	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	\N	2025-09-03 09:01:09.130822+00	2025-09-03 09:01:09.130822+00
\.


--
-- TOC entry 4171 (class 0 OID 17468)
-- Dependencies: 272
-- Data for Name: teams_channels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams_channels (id, channel_name, webhook_url, is_active, created_by, created_at, updated_at) FROM stdin;
d4a5384b-98c6-4c9f-a922-4e6477893682	세금 알림	https://bepsolar1.webhook.office.com/webhookb2/e8eeceaa-3e5f-42b7-a40d-1473c2253c99@71167b62-f79f-4dce-95ba-64f401100ca0/IncomingWebhook/c6690d084f6e42b7b91cd4198e70fd6b/8b389d7c-4f39-426b-8b81-23a21dc70176/V2Jhmn8ZQ78fp-wZ51Fhq_oNPy2udOZdg1CnaJjUdtMvs1	f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:36:38.190844+00	2025-09-02 02:50:54.860484+00
12c5f1fa-ef85-44a3-bdc8-1efb1973b38d	세금 알림	https://bepsolar1.webhook.office.com/webhookb2/e8eeceaa-3e5f-42b7-a40d-1473c2253c99@71167b62-f79f-4dce-95ba-64f401100ca0/IncomingWebhook/d680c3e63ad84278adf155cb62548f5e/8b389d7c-4f39-426b-8b81-23a21dc70176/V2SCMv5lc2KyQnuHSIUhbBhUsu09iziw8nxFehssdWRgE1	t	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:51:14.54467+00	2025-09-02 02:51:14.54467+00
\.


--
-- TOC entry 4176 (class 0 OID 17559)
-- Dependencies: 277
-- Data for Name: user_activity_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_activity_logs (id, user_id, action, entity_type, entity_id, old_value, new_value, details, ip_address, user_agent, created_at) FROM stdin;
\.


--
-- TOC entry 4167 (class 0 OID 17377)
-- Dependencies: 268
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, name, role, is_email_verified, created_at, updated_at, last_login_at) FROM stdin;
df30a616-774a-4de3-a9bc-cde68c740398	bokeum.eom@watercharging.com	bokeum.eom	admin	f	2025-08-28 02:43:25.271183+00	2025-08-28 02:43:28.300304+00	\N
b48fd082-c0b1-4179-9165-fc64dfe31083	kook.kim@watercharging.com	kook.kim	admin	f	2025-08-27 13:46:37.959628+00	2025-08-29 02:32:12.900039+00	\N
e9f8a5af-002f-4c81-968a-7e08be3f9e82	hyeonji.wang@watercharging.com	사용자	admin	f	2025-09-03 07:04:46.348544+00	2025-09-03 07:05:00.16907+00	\N
4fcce705-778b-44fe-ab55-72cd36a49cef	gwihwi.min@watercharging.com	민귀휘	admin	f	2025-09-03 07:04:24.726325+00	2025-09-03 07:05:00.918468+00	\N
a87aa309-7d6f-4b35-b213-e3db8fa24ebc	ray.kim@watercharging.com	ray.kim	admin	f	2025-08-28 02:10:18.154635+00	2025-09-03 07:05:02.213068+00	\N
\.


--
-- TOC entry 4160 (class 0 OID 17032)
-- Dependencies: 257
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-08-27 12:01:02
20211116045059	2025-08-27 12:01:03
20211116050929	2025-08-27 12:01:04
20211116051442	2025-08-27 12:01:04
20211116212300	2025-08-27 12:01:05
20211116213355	2025-08-27 12:01:06
20211116213934	2025-08-27 12:01:07
20211116214523	2025-08-27 12:01:08
20211122062447	2025-08-27 12:01:08
20211124070109	2025-08-27 12:01:09
20211202204204	2025-08-27 12:01:10
20211202204605	2025-08-27 12:01:11
20211210212804	2025-08-27 12:01:13
20211228014915	2025-08-27 12:01:14
20220107221237	2025-08-27 12:01:15
20220228202821	2025-08-27 12:01:16
20220312004840	2025-08-27 12:01:16
20220603231003	2025-08-27 12:01:18
20220603232444	2025-08-27 12:01:18
20220615214548	2025-08-27 12:01:19
20220712093339	2025-08-27 12:01:20
20220908172859	2025-08-27 12:01:21
20220916233421	2025-08-27 12:01:21
20230119133233	2025-08-27 12:01:22
20230128025114	2025-08-27 12:01:23
20230128025212	2025-08-27 12:01:24
20230227211149	2025-08-27 12:01:25
20230228184745	2025-08-27 12:01:25
20230308225145	2025-08-27 12:01:26
20230328144023	2025-08-27 12:01:27
20231018144023	2025-08-27 12:01:28
20231204144023	2025-08-27 12:01:29
20231204144024	2025-08-27 12:01:30
20231204144025	2025-08-27 12:01:30
20240108234812	2025-08-27 12:01:31
20240109165339	2025-08-27 12:01:32
20240227174441	2025-08-27 12:01:33
20240311171622	2025-08-27 12:01:34
20240321100241	2025-08-27 12:01:36
20240401105812	2025-08-27 12:01:38
20240418121054	2025-08-27 12:01:39
20240523004032	2025-08-27 12:01:41
20240618124746	2025-08-27 12:01:42
20240801235015	2025-08-27 12:01:43
20240805133720	2025-08-27 12:01:44
20240827160934	2025-08-27 12:01:44
20240919163303	2025-08-27 12:01:45
20240919163305	2025-08-27 12:01:46
20241019105805	2025-08-27 12:01:47
20241030150047	2025-08-27 12:01:49
20241108114728	2025-08-27 12:01:50
20241121104152	2025-08-27 12:01:51
20241130184212	2025-08-27 12:01:52
20241220035512	2025-08-27 12:01:53
20241220123912	2025-08-27 12:01:54
20241224161212	2025-08-27 12:01:54
20250107150512	2025-08-27 12:01:55
20250110162412	2025-08-27 12:01:56
20250123174212	2025-08-27 12:01:56
20250128220012	2025-08-27 12:01:57
20250506224012	2025-08-27 12:01:58
20250523164012	2025-08-27 12:01:58
20250714121412	2025-08-27 12:01:59
\.


--
-- TOC entry 4166 (class 0 OID 17167)
-- Dependencies: 264
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- TOC entry 4146 (class 0 OID 16546)
-- Dependencies: 240
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 17138)
-- Dependencies: 261
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4148 (class 0 OID 16588)
-- Dependencies: 242
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-08-27 12:00:59.494143
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-08-27 12:00:59.539784
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-08-27 12:00:59.553385
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-08-27 12:00:59.851737
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-08-27 12:01:00.176425
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-08-27 12:01:00.182011
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-08-27 12:01:00.192847
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-08-27 12:01:00.198193
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-08-27 12:01:00.203077
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-08-27 12:01:00.211914
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-08-27 12:01:00.220253
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-08-27 12:01:00.22848
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-08-27 12:01:00.256971
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-08-27 12:01:00.262258
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-08-27 12:01:00.26776
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-08-27 12:01:00.417191
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-08-27 12:01:00.427003
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-08-27 12:01:00.433574
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-08-27 12:01:00.533991
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-08-27 12:01:00.543956
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-08-27 12:01:00.554306
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-08-27 12:01:00.565064
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-08-27 12:01:00.587944
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-08-27 12:01:00.60987
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-08-27 12:01:00.615099
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-08-27 12:01:00.622121
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-08-27 12:01:00.627251
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-08-27 12:01:00.661429
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-08-27 12:01:00.67537
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-08-27 12:01:01.061284
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-08-27 12:01:01.082835
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-08-27 12:01:01.093869
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-08-27 12:01:01.101944
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-08-27 12:01:01.132937
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-08-27 12:01:01.135207
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-08-27 12:01:01.141846
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-08-27 12:01:01.150984
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-08-27 12:01:01.160484
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-08-27 12:01:01.166244
\.


--
-- TOC entry 4147 (class 0 OID 16561)
-- Dependencies: 241
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- TOC entry 4163 (class 0 OID 17093)
-- Dependencies: 260
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 17040)
-- Dependencies: 258
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 17054)
-- Dependencies: 259
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 3602 (class 0 OID 16658)
-- Dependencies: 243
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 235
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 420, true);


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 279
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 142, true);


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 263
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 3777 (class 2606 OID 16827)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 16531)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 16933)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 16951)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 16961)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 3730 (class 2606 OID 16524)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3779 (class 2606 OID 16820)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 3775 (class 2606 OID 16808)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 17001)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 3769 (class 2606 OID 16795)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 19918)
-- Name: oauth_clients oauth_clients_client_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_client_id_key UNIQUE (client_id);


--
-- TOC entry 3872 (class 2606 OID 19916)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3804 (class 2606 OID 16986)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3724 (class 2606 OID 16514)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 16738)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3789 (class 2606 OID 16867)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 3791 (class 2606 OID 16865)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 16881)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 16537)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3762 (class 2606 OID 16759)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 16848)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 16839)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3717 (class 2606 OID 16921)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3719 (class 2606 OID 16501)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3866 (class 2606 OID 19865)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 17407)
-- Name: charging_stations charging_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT charging_stations_pkey PRIMARY KEY (id);


--
-- TOC entry 3861 (class 2606 OID 17618)
-- Name: email_recipients email_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_recipients
    ADD CONSTRAINT email_recipients_pkey PRIMARY KEY (id);


--
-- TOC entry 3853 (class 2606 OID 17556)
-- Name: holidays holidays_holiday_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_holiday_date_key UNIQUE (holiday_date);


--
-- TOC entry 3855 (class 2606 OID 17554)
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- TOC entry 3851 (class 2606 OID 17540)
-- Name: notification_logs notification_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3845 (class 2606 OID 17495)
-- Name: notification_schedules notification_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_schedules
    ADD CONSTRAINT notification_schedules_pkey PRIMARY KEY (id);


--
-- TOC entry 3849 (class 2606 OID 17509)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3841 (class 2606 OID 17455)
-- Name: tax_status_history tax_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 17427)
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- TOC entry 3843 (class 2606 OID 17478)
-- Name: teams_channels teams_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams_channels
    ADD CONSTRAINT teams_channels_pkey PRIMARY KEY (id);


--
-- TOC entry 3859 (class 2606 OID 17567)
-- Name: user_activity_logs user_activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3827 (class 2606 OID 17388)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3829 (class 2606 OID 17386)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3825 (class 2606 OID 17326)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3822 (class 2606 OID 17175)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 3809 (class 2606 OID 17038)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3819 (class 2606 OID 17148)
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 3738 (class 2606 OID 16554)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 16595)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 3750 (class 2606 OID 16593)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 16571)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 17102)
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- TOC entry 3814 (class 2606 OID 17063)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 17048)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 1259 OID 16532)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 3707 (class 1259 OID 16748)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3708 (class 1259 OID 16750)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3709 (class 1259 OID 16751)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3765 (class 1259 OID 16829)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 3798 (class 1259 OID 16937)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 3754 (class 1259 OID 16917)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 3754
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 3759 (class 1259 OID 16745)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 3801 (class 1259 OID 16934)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 3802 (class 1259 OID 16935)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 3773 (class 1259 OID 16940)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 3770 (class 1259 OID 16801)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 3771 (class 1259 OID 16946)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 3867 (class 1259 OID 19919)
-- Name: oauth_clients_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_client_id_idx ON auth.oauth_clients USING btree (client_id);


--
-- TOC entry 3870 (class 1259 OID 19920)
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- TOC entry 3805 (class 1259 OID 16993)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 3806 (class 1259 OID 16992)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 3807 (class 1259 OID 16994)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 3710 (class 1259 OID 16752)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3711 (class 1259 OID 16749)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3720 (class 1259 OID 16515)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 3721 (class 1259 OID 16516)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 3722 (class 1259 OID 16744)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 3725 (class 1259 OID 16831)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 3728 (class 1259 OID 16936)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 3792 (class 1259 OID 16873)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 3793 (class 1259 OID 16938)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 3794 (class 1259 OID 16888)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 3797 (class 1259 OID 16887)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 3760 (class 1259 OID 16939)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 3763 (class 1259 OID 16830)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 3784 (class 1259 OID 16855)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 3787 (class 1259 OID 16854)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 3782 (class 1259 OID 16840)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 3783 (class 1259 OID 17002)
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- TOC entry 3772 (class 1259 OID 16999)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 3764 (class 1259 OID 16828)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 3712 (class 1259 OID 16908)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 3712
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 3713 (class 1259 OID 16746)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 3714 (class 1259 OID 16505)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 3715 (class 1259 OID 16963)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 3862 (class 1259 OID 19873)
-- Name: audit_logs_actor_id_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_actor_id_created_at_idx ON public.audit_logs USING btree (actor_id, created_at DESC);


--
-- TOC entry 3863 (class 1259 OID 19871)
-- Name: audit_logs_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_created_at_idx ON public.audit_logs USING btree (created_at DESC);


--
-- TOC entry 3864 (class 1259 OID 19872)
-- Name: audit_logs_menu_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_menu_created_at_idx ON public.audit_logs USING btree (menu, created_at DESC);


--
-- TOC entry 3832 (class 1259 OID 17576)
-- Name: idx_charging_stations_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_charging_stations_location ON public.charging_stations USING btree (location);


--
-- TOC entry 3833 (class 1259 OID 17575)
-- Name: idx_charging_stations_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_charging_stations_name ON public.charging_stations USING btree (station_name);


--
-- TOC entry 3846 (class 1259 OID 17581)
-- Name: idx_notifications_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_date ON public.notifications USING btree (notification_date);


--
-- TOC entry 3847 (class 1259 OID 17582)
-- Name: idx_notifications_sent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_sent ON public.notifications USING btree (is_sent);


--
-- TOC entry 3834 (class 1259 OID 17578)
-- Name: idx_taxes_due_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_due_date ON public.taxes USING btree (due_date);


--
-- TOC entry 3835 (class 1259 OID 17577)
-- Name: idx_taxes_station_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_station_id ON public.taxes USING btree (station_id);


--
-- TOC entry 3836 (class 1259 OID 17579)
-- Name: idx_taxes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_status ON public.taxes USING btree (status);


--
-- TOC entry 3837 (class 1259 OID 17580)
-- Name: idx_taxes_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taxes_type ON public.taxes USING btree (tax_type);


--
-- TOC entry 3856 (class 1259 OID 17584)
-- Name: idx_user_activity_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_activity_logs_created_at ON public.user_activity_logs USING btree (created_at);


--
-- TOC entry 3857 (class 1259 OID 17583)
-- Name: idx_user_activity_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_activity_logs_user_id ON public.user_activity_logs USING btree (user_id);


--
-- TOC entry 3820 (class 1259 OID 17327)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 3823 (class 1259 OID 17224)
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- TOC entry 3736 (class 1259 OID 16560)
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 3739 (class 1259 OID 16582)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 3810 (class 1259 OID 17074)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 3740 (class 1259 OID 17120)
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- TOC entry 3741 (class 1259 OID 17039)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 3742 (class 1259 OID 17122)
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- TOC entry 3815 (class 1259 OID 17123)
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- TOC entry 3743 (class 1259 OID 16583)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 3744 (class 1259 OID 17121)
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- TOC entry 3915 (class 2620 OID 17601)
-- Name: taxes create_auto_notifications_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER create_auto_notifications_trigger AFTER INSERT ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.create_auto_notifications();


--
-- TOC entry 3916 (class 2620 OID 17598)
-- Name: taxes set_initial_tax_status_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_initial_tax_status_trigger BEFORE INSERT ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.set_initial_tax_status();


--
-- TOC entry 3917 (class 2620 OID 17600)
-- Name: taxes track_tax_status_change_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER track_tax_status_change_trigger AFTER UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.track_tax_status_change();


--
-- TOC entry 3914 (class 2620 OID 17587)
-- Name: charging_stations update_charging_stations_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_charging_stations_updated_at BEFORE UPDATE ON public.charging_stations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3923 (class 2620 OID 17628)
-- Name: email_recipients update_email_recipients_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_email_recipients_updated_at BEFORE UPDATE ON public.email_recipients FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3921 (class 2620 OID 17590)
-- Name: notification_schedules update_notification_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_notification_schedules_updated_at BEFORE UPDATE ON public.notification_schedules FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3922 (class 2620 OID 17591)
-- Name: notifications update_notifications_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_notifications_updated_at BEFORE UPDATE ON public.notifications FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3918 (class 2620 OID 17588)
-- Name: taxes update_taxes_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_taxes_updated_at BEFORE UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3920 (class 2620 OID 17589)
-- Name: teams_channels update_teams_channels_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_teams_channels_updated_at BEFORE UPDATE ON public.teams_channels FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3913 (class 2620 OID 17586)
-- Name: users update_users_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 3919 (class 2620 OID 17599)
-- Name: taxes validate_tax_status_change_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER validate_tax_status_change_trigger BEFORE UPDATE ON public.taxes FOR EACH ROW EXECUTE FUNCTION public.validate_tax_status_change();


--
-- TOC entry 3912 (class 2620 OID 17180)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 3905 (class 2620 OID 17130)
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- TOC entry 3906 (class 2620 OID 17118)
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 3907 (class 2620 OID 17116)
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- TOC entry 3908 (class 2620 OID 17117)
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- TOC entry 3910 (class 2620 OID 17126)
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- TOC entry 3911 (class 2620 OID 17115)
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 3909 (class 2620 OID 17022)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 3875 (class 2606 OID 16732)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3879 (class 2606 OID 16821)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3878 (class 2606 OID 16809)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 3877 (class 2606 OID 16796)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 16987)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3873 (class 2606 OID 16765)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 16868)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 16941)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 16882)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 16760)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3880 (class 2606 OID 16849)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3904 (class 2606 OID 19866)
-- Name: audit_logs audit_logs_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.users(id);


--
-- TOC entry 3890 (class 2606 OID 17408)
-- Name: charging_stations charging_stations_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT charging_stations_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3903 (class 2606 OID 17619)
-- Name: email_recipients email_recipients_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_recipients
    ADD CONSTRAINT email_recipients_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id);


--
-- TOC entry 3901 (class 2606 OID 17541)
-- Name: notification_logs notification_logs_notification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_notification_id_fkey FOREIGN KEY (notification_id) REFERENCES public.notifications(id);


--
-- TOC entry 3897 (class 2606 OID 17525)
-- Name: notifications notifications_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3898 (class 2606 OID 17515)
-- Name: notifications notifications_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.notification_schedules(id);


--
-- TOC entry 3899 (class 2606 OID 17510)
-- Name: notifications notifications_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(id) ON DELETE CASCADE;


--
-- TOC entry 3900 (class 2606 OID 17520)
-- Name: notifications notifications_teams_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_teams_channel_id_fkey FOREIGN KEY (teams_channel_id) REFERENCES public.teams_channels(id);


--
-- TOC entry 3894 (class 2606 OID 17461)
-- Name: tax_status_history tax_status_history_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.users(id);


--
-- TOC entry 3895 (class 2606 OID 17456)
-- Name: tax_status_history tax_status_history_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_status_history
    ADD CONSTRAINT tax_status_history_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(id) ON DELETE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 17433)
-- Name: taxes taxes_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3892 (class 2606 OID 17428)
-- Name: taxes taxes_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.charging_stations(id);


--
-- TOC entry 3893 (class 2606 OID 17438)
-- Name: taxes taxes_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- TOC entry 3896 (class 2606 OID 17479)
-- Name: teams_channels teams_channels_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams_channels
    ADD CONSTRAINT teams_channels_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3902 (class 2606 OID 17568)
-- Name: user_activity_logs user_activity_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3889 (class 2606 OID 17389)
-- Name: users users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3874 (class 2606 OID 16572)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3888 (class 2606 OID 17103)
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3885 (class 2606 OID 17049)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3886 (class 2606 OID 17069)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3887 (class 2606 OID 17064)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4075 (class 0 OID 16525)
-- Dependencies: 238
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4089 (class 0 OID 16927)
-- Dependencies: 255
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4080 (class 0 OID 16725)
-- Dependencies: 246
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4074 (class 0 OID 16518)
-- Dependencies: 237
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4084 (class 0 OID 16814)
-- Dependencies: 250
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4083 (class 0 OID 16802)
-- Dependencies: 249
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4082 (class 0 OID 16789)
-- Dependencies: 248
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4090 (class 0 OID 16977)
-- Dependencies: 256
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4073 (class 0 OID 16507)
-- Dependencies: 236
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4087 (class 0 OID 16856)
-- Dependencies: 253
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4088 (class 0 OID 16874)
-- Dependencies: 254
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4076 (class 0 OID 16533)
-- Dependencies: 239
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4081 (class 0 OID 16755)
-- Dependencies: 247
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4086 (class 0 OID 16841)
-- Dependencies: 252
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4085 (class 0 OID 16832)
-- Dependencies: 251
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4072 (class 0 OID 16495)
-- Dependencies: 234
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4110 (class 3256 OID 17413)
-- Name: charging_stations All users can view charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view charging stations" ON public.charging_stations FOR SELECT USING (true);


--
-- TOC entry 4127 (class 3256 OID 17557)
-- Name: holidays All users can view holidays; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view holidays" ON public.holidays FOR SELECT USING (true);


--
-- TOC entry 4126 (class 3256 OID 17546)
-- Name: notification_logs All users can view notification logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notification logs" ON public.notification_logs FOR SELECT USING (true);


--
-- TOC entry 4122 (class 3256 OID 17496)
-- Name: notification_schedules All users can view notification schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notification schedules" ON public.notification_schedules FOR SELECT USING (true);


--
-- TOC entry 4124 (class 3256 OID 17530)
-- Name: notifications All users can view notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view notifications" ON public.notifications FOR SELECT USING (true);


--
-- TOC entry 4118 (class 3256 OID 17466)
-- Name: tax_status_history All users can view tax status history; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view tax status history" ON public.tax_status_history FOR SELECT USING (true);


--
-- TOC entry 4114 (class 3256 OID 17443)
-- Name: taxes All users can view taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view taxes" ON public.taxes FOR SELECT USING (true);


--
-- TOC entry 4120 (class 3256 OID 17484)
-- Name: teams_channels All users can view teams channels; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "All users can view teams channels" ON public.teams_channels FOR SELECT USING (true);


--
-- TOC entry 4131 (class 3256 OID 17606)
-- Name: users Authenticated users can create their profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can create their profile" ON public.users FOR INSERT WITH CHECK (((auth.uid() IS NOT NULL) AND (id = auth.uid())));


--
-- TOC entry 4113 (class 3256 OID 17416)
-- Name: charging_stations Only admins can delete charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can delete charging stations" ON public.charging_stations FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4117 (class 3256 OID 17446)
-- Name: taxes Only admins can delete taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can delete taxes" ON public.taxes FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4111 (class 3256 OID 17414)
-- Name: charging_stations Only admins can insert charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert charging stations" ON public.charging_stations FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4119 (class 3256 OID 17467)
-- Name: tax_status_history Only admins can insert tax status history; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert tax status history" ON public.tax_status_history FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4115 (class 3256 OID 17444)
-- Name: taxes Only admins can insert taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can insert taxes" ON public.taxes FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4128 (class 3256 OID 17558)
-- Name: holidays Only admins can manage holidays; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage holidays" ON public.holidays USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4123 (class 3256 OID 17497)
-- Name: notification_schedules Only admins can manage notification schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage notification schedules" ON public.notification_schedules USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4125 (class 3256 OID 17531)
-- Name: notifications Only admins can manage notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage notifications" ON public.notifications USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4121 (class 3256 OID 17485)
-- Name: teams_channels Only admins can manage teams channels; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can manage teams channels" ON public.teams_channels USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4112 (class 3256 OID 17415)
-- Name: charging_stations Only admins can update charging stations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can update charging stations" ON public.charging_stations FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4116 (class 3256 OID 17445)
-- Name: taxes Only admins can update taxes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only admins can update taxes" ON public.taxes FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.users
  WHERE ((users.id = auth.uid()) AND (users.role = 'admin'::public.user_role)))));


--
-- TOC entry 4130 (class 3256 OID 17574)
-- Name: user_activity_logs Only system can insert activity logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Only system can insert activity logs" ON public.user_activity_logs FOR INSERT WITH CHECK (true);


--
-- TOC entry 4132 (class 3256 OID 17607)
-- Name: users Service role can insert users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Service role can insert users" ON public.users FOR INSERT WITH CHECK (((auth.jwt() ->> 'role'::text) = 'service_role'::text));


--
-- TOC entry 4136 (class 3256 OID 17627)
-- Name: email_recipients Users can delete email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can delete email recipients" ON public.email_recipients FOR DELETE USING (true);


--
-- TOC entry 4134 (class 3256 OID 17625)
-- Name: email_recipients Users can insert email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert email recipients" ON public.email_recipients FOR INSERT WITH CHECK (true);


--
-- TOC entry 4135 (class 3256 OID 17626)
-- Name: email_recipients Users can update email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can update email recipients" ON public.email_recipients FOR UPDATE USING (true);


--
-- TOC entry 4109 (class 3256 OID 17395)
-- Name: users Users can update their own profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can update their own profile" ON public.users FOR UPDATE USING ((auth.uid() = id));


--
-- TOC entry 4133 (class 3256 OID 17624)
-- Name: email_recipients Users can view all email recipients; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view all email recipients" ON public.email_recipients FOR SELECT USING (true);


--
-- TOC entry 4129 (class 3256 OID 17573)
-- Name: user_activity_logs Users can view their own activity logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view their own activity logs" ON public.user_activity_logs FOR SELECT USING ((auth.uid() = user_id));


--
-- TOC entry 4108 (class 3256 OID 17394)
-- Name: users Users can view their own profile; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view their own profile" ON public.users FOR SELECT USING ((auth.uid() = id));


--
-- TOC entry 4107 (class 0 OID 19858)
-- Dependencies: 280
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4138 (class 3256 OID 19875)
-- Name: audit_logs audit_logs_insert_admin; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY audit_logs_insert_admin ON public.audit_logs FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.users u
  WHERE ((u.id = auth.uid()) AND (u.role = 'admin'::public.user_role)))));


--
-- TOC entry 4137 (class 3256 OID 19874)
-- Name: audit_logs audit_logs_select_admin; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY audit_logs_select_admin ON public.audit_logs FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.users u
  WHERE ((u.id = auth.uid()) AND (u.role = 'admin'::public.user_role)))));


--
-- TOC entry 4097 (class 0 OID 17397)
-- Dependencies: 269
-- Name: charging_stations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.charging_stations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4106 (class 0 OID 17608)
-- Dependencies: 278
-- Name: email_recipients; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.email_recipients ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4104 (class 0 OID 17547)
-- Dependencies: 276
-- Name: holidays; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.holidays ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4103 (class 0 OID 17532)
-- Dependencies: 275
-- Name: notification_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notification_logs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4101 (class 0 OID 17486)
-- Dependencies: 273
-- Name: notification_schedules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notification_schedules ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4102 (class 0 OID 17498)
-- Dependencies: 274
-- Name: notifications; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4099 (class 0 OID 17447)
-- Dependencies: 271
-- Name: tax_status_history; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tax_status_history ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4098 (class 0 OID 17417)
-- Dependencies: 270
-- Name: taxes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.taxes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4100 (class 0 OID 17468)
-- Dependencies: 272
-- Name: teams_channels; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.teams_channels ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4105 (class 0 OID 17559)
-- Dependencies: 277
-- Name: user_activity_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_activity_logs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4096 (class 0 OID 17377)
-- Dependencies: 268
-- Name: users; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4095 (class 0 OID 17311)
-- Dependencies: 267
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4077 (class 0 OID 16546)
-- Dependencies: 240
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4094 (class 0 OID 17138)
-- Dependencies: 261
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4079 (class 0 OID 16588)
-- Dependencies: 242
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4078 (class 0 OID 16561)
-- Dependencies: 241
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4093 (class 0 OID 17093)
-- Dependencies: 260
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4091 (class 0 OID 17040)
-- Dependencies: 258
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4092 (class 0 OID 17054)
-- Dependencies: 259
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4139 (class 6104 OID 16426)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- TOC entry 3595 (class 3466 OID 16621)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- TOC entry 3600 (class 3466 OID 16700)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- TOC entry 3594 (class 3466 OID 16619)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- TOC entry 3601 (class 3466 OID 16703)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- TOC entry 3596 (class 3466 OID 16622)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- TOC entry 3597 (class 3466 OID 16623)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


-- Completed on 2025-09-04 15:27:22

--
-- PostgreSQL database dump complete
--

