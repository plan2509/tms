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
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
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
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
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
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 420, true);


--
-- PostgreSQL database dump complete
--

