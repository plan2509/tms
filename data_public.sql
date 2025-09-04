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
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.holidays (id, holiday_date, holiday_name, is_recurring, created_at) FROM stdin;
\.


--
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
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxes (id, station_id, tax_type, tax_amount, due_date, status, payment_date, tax_notice_number, tax_year, tax_period, notes, created_by, updated_by, created_at, updated_at) FROM stdin;
d9ce90cc-6c15-41cc-b899-b729ef7b3f4d	5468560f-26f4-433d-8dc6-aa30b72d6e42	property	1000.00	2025-09-20	payment_scheduled	\N	\N	\N	1분기	\N	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	\N	2025-09-03 09:01:09.130822+00	2025-09-03 09:01:09.130822+00
\.


--
-- Data for Name: teams_channels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams_channels (id, channel_name, webhook_url, is_active, created_by, created_at, updated_at) FROM stdin;
d4a5384b-98c6-4c9f-a922-4e6477893682	세금 알림	https://bepsolar1.webhook.office.com/webhookb2/e8eeceaa-3e5f-42b7-a40d-1473c2253c99@71167b62-f79f-4dce-95ba-64f401100ca0/IncomingWebhook/c6690d084f6e42b7b91cd4198e70fd6b/8b389d7c-4f39-426b-8b81-23a21dc70176/V2Jhmn8ZQ78fp-wZ51Fhq_oNPy2udOZdg1CnaJjUdtMvs1	f	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:36:38.190844+00	2025-09-02 02:50:54.860484+00
12c5f1fa-ef85-44a3-bdc8-1efb1973b38d	세금 알림	https://bepsolar1.webhook.office.com/webhookb2/e8eeceaa-3e5f-42b7-a40d-1473c2253c99@71167b62-f79f-4dce-95ba-64f401100ca0/IncomingWebhook/d680c3e63ad84278adf155cb62548f5e/8b389d7c-4f39-426b-8b81-23a21dc70176/V2SCMv5lc2KyQnuHSIUhbBhUsu09iziw8nxFehssdWRgE1	t	a87aa309-7d6f-4b35-b213-e3db8fa24ebc	2025-09-02 02:51:14.54467+00	2025-09-02 02:51:14.54467+00
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, tax_id, notification_type, schedule_id, notification_date, notification_time, message, is_sent, sent_at, teams_channel_id, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notification_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification_logs (id, notification_id, send_status, error_message, sent_at) FROM stdin;
\.


--
-- Data for Name: tax_status_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_status_history (id, tax_id, previous_status, new_status, changed_by, changed_at, reason) FROM stdin;
\.


--
-- Data for Name: user_activity_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_activity_logs (id, user_id, action, entity_type, entity_id, old_value, new_value, details, ip_address, user_agent, created_at) FROM stdin;
\.


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 142, true);


--
-- PostgreSQL database dump complete
--

