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

INSERT INTO public.users VALUES ('df30a616-774a-4de3-a9bc-cde68c740398', 'bokeum.eom@watercharging.com', 'bokeum.eom', 'admin', false, '2025-08-28 02:43:25.271183+00', '2025-08-28 02:43:28.300304+00', NULL);
INSERT INTO public.users VALUES ('b48fd082-c0b1-4179-9165-fc64dfe31083', 'kook.kim@watercharging.com', 'kook.kim', 'admin', false, '2025-08-27 13:46:37.959628+00', '2025-08-29 02:32:12.900039+00', NULL);
INSERT INTO public.users VALUES ('e9f8a5af-002f-4c81-968a-7e08be3f9e82', 'hyeonji.wang@watercharging.com', '사용자', 'admin', false, '2025-09-03 07:04:46.348544+00', '2025-09-03 07:05:00.16907+00', NULL);
INSERT INTO public.users VALUES ('4fcce705-778b-44fe-ab55-72cd36a49cef', 'gwihwi.min@watercharging.com', '민귀휘', 'admin', false, '2025-09-03 07:04:24.726325+00', '2025-09-03 07:05:00.918468+00', NULL);
INSERT INTO public.users VALUES ('a87aa309-7d6f-4b35-b213-e3db8fa24ebc', 'ray.kim@watercharging.com', 'ray.kim', 'admin', false, '2025-08-28 02:10:18.154635+00', '2025-09-03 07:05:02.213068+00', NULL);


--
-- Data for Name: charging_stations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.charging_stations VALUES ('af6b1cb5-48bc-420c-9038-53e2713368d5', '거제 성포해안도로 위판장우측주차장', '경남 거제시 사등면 성포리 325-6', '경남 거제시 사등면 성포리 325-6', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('60addf04-3c94-49bd-8854-8edd89543157', '거제 성포해안도로 위판장좌측주차장', '경남 거제시 사등면 성포리351-43', '경남 거제시 사등면 성포리351-43', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('c8a75729-f2c2-489c-84a5-00a4e979647f', '거제 능포수변공원 우측공영주차장', '경남 거제시 능포동 564-25', '경남 거제시 능포동 564-25', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('6c905296-252b-459e-9700-c0aef808466b', '동두천 놀자숲 테마파크 입구주차장', '경기 동두천시 탑동동 산33', '경기 동두천시 탑동동 산33', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('32c13d8c-d906-4fc8-867f-452f0bf2cea0', '동두천 자연휴양림 방문자센터주차장', '경기 동두천시 탑동동 산16', '경기 동두천시 탑동동 산16', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('acb2a101-0a33-4f9d-873c-8a6808e89d24', '동두천 소요별앤숲테마파크 제2주차장', '경기도 동두천시 상봉암동 15-24', '경기도 동두천시 상봉암동 15-24', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b3620f28-cccd-4508-ae52-221f5de48745', '한국도로공사 밀양지사', '경남 밀양시 산외면 남기리 844-1', '경남 밀양시 산외면 남기리 844-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a34c4e6d-f1fb-4667-9f82-26dc2ac78bc2', '한국도로공사 파주지사', '경기 파주시 법원읍 삼방리 434-14', '경기 파주시 법원읍 삼방리 434-14', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a96c6064-bf16-4603-9665-cd661c7cd703', '한국도로공사 용인지사', '경기 용인시 처인구 모현읍 이일로 80-24', '경기 용인시 처인구 모현읍 이일로 80-24', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('103abe37-a470-4bc0-ae8a-fc4390363903', '남원 대한교통', '전북특별자치도 남원시 의서길 28', '전북특별자치도 남원시 의서길 28', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f419c5d8-7617-4066-be9b-b80946feaa54', '의정부 부민운수', '경기도 의정부시 용민로61번길 58 부민운수', '경기도 의정부시 용민로61번길 58 부민운수', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('44519de4-4a30-466a-99ea-97d84e2d4d00', '제주 우진운수', '제주 제주시 선반로 4길 26', '제주 제주시 선반로 4길 26', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('dce3b37d-6a43-4db3-967f-c3935ebdc737', '전주교통', '전북특별자치도 전주시 덕진구 신복로 102-34', '전북특별자치도 전주시 덕진구 신복로 102-34', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('ec3c6ee5-64a2-40af-ab1a-bca0872593aa', '거제시반려동물지원센터', '경상남도 거제시 사등면 두동로1길 107 반려동물지원센터', '경상남도 거제시 사등면 두동로1길 107 반려동물지원센터', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('7e4a05fc-6c7e-43da-a936-ec81a4cbd669', '동두천시보건소', '경기도 동두천시 중앙로 167 동두천시보건소', '경기도 동두천시 중앙로 167 동두천시보건소', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3c368b52-0c80-4c3c-970d-f712c4165c5c', '동두천 불현동행정복지센터', '경기 동두천시 행선로 123', '경기 동두천시 행선로 123', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a8215bec-6099-434c-b85f-951eff79c570', '동두천 중앙동공영주차장', '경기 동두천시 생연동 612-1', '경기 동두천시 생연동 612-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('32e0d9b7-647c-4176-9672-945981a66389', '동두천 택시쉼터주차장', '경기도 동두천시 벌마들로 82', '경기도 동두천시 벌마들로 82', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3c49ecc5-def2-450d-bee3-a3842c36f37f', '동두천 한미우호의광장주차장', '경기도 동두천시 상패로 210-27', '경기도 동두천시 상패로 210-27', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('8a87d047-af7e-472a-b176-9e05188819c3', '동두천 대형자동차공영주차장', '경기도 동두천시 벌마들로 82', '경기도 동두천시 벌마들로 82', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('5bc109bf-c724-48a2-bb15-7f8decca54bc', '동두천시청 부설주차장', '경기 동두천시 생연동 428', '경기 동두천시 생연동 428', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('fb5d62e9-c73d-4195-9178-2006b2925eb1', '동두천시청', '경기 동두천시 방죽로 23', '경기 동두천시 방죽로 23', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('c6096b15-fc7a-424e-9112-dee3bee81264', '현풍휴게소 창원방향', '대구광역시 달성군 성하길 48 현풍휴게소(하행선)', '대구광역시 달성군 성하길 48 현풍휴게소(하행선)', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('0a4100b9-291b-4760-97a5-6fb1dd406d67', '현풍휴게소 대구방향', '대구 달성군 현풍읍 성하리 345', '대구 달성군 현풍읍 성하리 345', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('bfebbd6e-fd00-4e77-993b-5a27642ceed2', '함안휴게소 순천방향', '경상남도 함안군 군북면 유현리 992-6', '경상남도 함안군 군북면 유현리 992-6', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('ad6941db-9987-403a-b5e0-710dc141ea44', '함안휴게소 부산방향', '경남 함안군 군북면 유현리 804-1', '경남 함안군 군북면 유현리 804-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4220d77f-eef1-440d-9c60-880aa5628de9', '진주휴게소 반려견놀이터주차장', '경남 진주시 호탄동 802', '경남 진주시 호탄동 802', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('67cb10c3-20b7-4fc4-a96f-feeacad13299', '진영휴게소 순천방향', '경상남도 김해시 진영읍 우동리 318-5', '경상남도 김해시 진영읍 우동리 318-5', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('91f72c25-64dc-4882-ba95-64b7e66aab95', '장유휴게소 서부산방향', '경남 김해시 장유로116번길 44-82', '경남 김해시 장유로116번길 44-82', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3a22f511-ad91-4196-b506-3e91c9586fcc', '영산휴게소 창원방향', '경남 창녕군 영산면 장척호수길 56-110', '경남 창녕군 영산면 장척호수길 56-110', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4361a7fa-a61b-489f-9553-50de60b3b8fc', '산청휴게소 통영방향', '경상남도 산청군 단성면 방목리 367-10', '경상남도 산청군 단성면 방목리 367-10', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('236c5ac7-7253-40e6-8659-e14099e6ec01', '산청휴게소 대전방향', '경남 산청군 단성면 통영대전고속도로 76', '경남 산청군 단성면 통영대전고속도로 76', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('32b24d4c-87f8-406a-88b0-32a9c3de441b', '김해금관가야휴게소 창원방향', '경상남도 김해시 대동면 월촌리 761', '경상남도 김해시 대동면 월촌리 761', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e29ac1f5-2e00-474a-8ff5-f98421b50e13', '김해금관가야휴게소 기장방향', '경상남도 김해시 대동면 월촌리 773', '경상남도 김해시 대동면 월촌리 773', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a21c8826-4050-43bc-945e-1dfa5769384f', '고성공룡나라휴게소 통영방향', '경남 고성군 대가면 통영대전고속도로 29', '경남 고성군 대가면 통영대전고속도로 29', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('d9c8d967-514f-4bd1-92a3-7a58f9fd0f98', '고성공룡나라휴게소 대전방향', '경남 고성군 대가면 통영대전고속도로 32', '경남 고성군 대가면 통영대전고속도로 32', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4c9aa30c-6568-4a79-a3b2-7243a0c75b29', '경주휴게소 부산방향', '경상북도 경주시 내남면 경부고속도로 59', '경상북도 경주시 내남면 경부고속도로 59', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('83939736-f386-42d0-8531-5d192e704c4c', '칠곡휴게소 서울방향', '경북 칠곡군 왜관읍 경부고속도로 158', '경북 칠곡군 왜관읍 경부고속도로 158', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e822371f-742a-4b28-a814-c0a28cda3da7', '청통휴게소 대구방향', '경북 영천시 청통면 청통로 334-42', '경북 영천시 청통면 청통로 334-42', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a3760c34-f896-49d7-95bc-b3e739cb8673', '의성휴게소 청주방향', '경북 의성군 안계면 양곡리 산102-2', '경북 의성군 안계면 양곡리 산102-2', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f60ece08-eda8-4e48-974c-652bc62f022f', '영천휴게소 대구방향', '경북 영천시 임고면 운주로 791', '경북 영천시 임고면 운주로 791', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('6ba9f51f-a427-4d70-8d6a-cdc53b549ffb', '안동휴게소 부산방향', '경북 안동시 풍산읍 풍산태사로 1903-27', '경북 안동시 풍산읍 풍산태사로 1903-27', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('9bb5a56b-58bc-42aa-9493-a25ff43521ae', '남성주참외휴게소 양평방향', '경북 성주군 용암면 중부내륙고속도로 76', '경북 성주군 용암면 중부내륙고속도로 76', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('390dc82e-0fd0-474b-8dc2-64c9d9c7a973', '군위휴게소 부산방향', '대구 군위군 군위읍 오곡리 413', '대구 군위군 군위읍 오곡리 413', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('8a72633f-dceb-4cac-aa36-c2d2fe5c50d4', '충주휴게소 양평방향', '충북 충주시 중앙탑면 중부내륙고속도로 230-1', '충북 충주시 중앙탑면 중부내륙고속도로 230-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('d47ece6e-8f1c-4b8c-954c-b4c457be7ed6', '천등산휴게소 평택방향', '충북 충주시 산척면 평택제천고속도로 109', '충북 충주시 산척면 평택제천고속도로 109', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('31ea4a25-6307-4869-828f-d5567c165591', '천등산휴게소 제천방향', '충북 충주시 산척면 평택제천고속도로 106', '충북 충주시 산척면 평택제천고속도로 106', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e376f898-66f3-4a65-9479-ea669af233de', '선산휴게소 양평방향', '경북 구미시 옥성면 중부내륙고속도로 128', '경북 구미시 옥성면 중부내륙고속도로 128', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('cce993d6-8165-4052-9048-ae06eb99470a', '문경휴게소 창원방향', '경북 문경시 중부내륙고속도로 173', '경북 문경시 중부내륙고속도로 173', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b73d924a-6587-4ae2-a78d-4ca31f8f42e3', '문경휴게소 양평방향', '경상북도 문경시 중부내륙고속도로 174 문경양평방향휴게소', '경상북도 문경시 중부내륙고속도로 174 문경양평방향휴게소', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('59fbfcd6-ab65-491e-a6f7-aefa6f485b2c', '괴산휴게소 창원방향', '충청북도 괴산군 장연면 중부내륙고속도로 205 괴산마산휴게소', '충청북도 괴산군 장연면 중부내륙고속도로 205 괴산마산휴게소', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3ad07b80-7452-437a-bd7e-242701c03d29', '횡성휴게소 강릉방향', '강원특별자치도 횡성군 안흥면 영동고속도로 154-2', '강원특별자치도 횡성군 안흥면 영동고속도로 154-2', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('35650de1-fa33-4517-be62-a1679c9694e9', '홍천강휴게소 춘천방향', '강원 홍천군 북방면 소매곡리 284-2,301-4,284-1', '강원 홍천군 북방면 소매곡리 284-2,301-4,284-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('ea22131b-fccb-4088-8991-ddfa929d9702', '홍천휴게소 양양방향', '강원 홍천군 화촌면 군업리 산240-5', '강원 홍천군 화촌면 군업리 산240-5', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('2f48dfa3-9f90-499f-8a7a-a6e14e320842', '홍천휴게소 서울방향', '강원특별자치도 홍천군 화촌면 서울양양고속도로 83', '강원특별자치도 홍천군 화촌면 서울양양고속도로 83', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('d4aa2850-d8fd-48ed-aa48-515024f66db4', '평창휴게소 강릉방향', '강원 평창군 용평면 이목정리 775', '강원 평창군 용평면 이목정리 775', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e4aeb518-aad4-471f-863a-1b0057d52205', '원주휴게소 춘천방향', '강원 원주시 호저면 마근거리길 110', '강원 원주시 호저면 마근거리길 110', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b6dbda10-51a8-4d88-82a0-5b3df4d3e91e', '용인휴게소 인천방향', '경기 용인시 처인구 고림동 76-2', '경기 용인시 처인구 고림동 76-2', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('65944ca1-6201-4556-9316-7108d9117f9e', '용인휴게소 강릉방향', '경기 용인시 처인구 주북로94번길 30-1', '경기 용인시 처인구 주북로94번길 30-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b06d6000-969b-4628-bdb1-3309949a6f1f', '옥계휴게소 속초방향', '강원 강릉시 옥계면 도직리 126-7', '강원 강릉시 옥계면 도직리 126-7', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a64567c1-3638-4285-9c0d-9fcadbaf0b92', '여주휴게소 인천방향', '경기도 여주시 화평길 116 여주휴게소', '경기도 여주시 화평길 116 여주휴게소', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a9bf72a8-6f13-4d1c-bb6a-8c943a5bf128', '여주휴게소 강릉방향', '경기도 여주시 가남읍 본두리 703-2', '경기도 여주시 가남읍 본두리 703-2', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('46d9d867-c862-46ea-93ca-bf846a2a9d5e', '서여주휴게소 창원방향', '경기 여주시 세종대왕면 중부내륙고속도로 271', '경기 여주시 세종대왕면 중부내륙고속도로 271', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f87d75e1-c2c4-4d80-9920-6f8f128edcfd', '문막휴게소 인천방향', '강원 원주시 문막읍 포진리 938-1', '강원 원주시 문막읍 포진리 938-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('12b4538a-6289-40a0-98f1-447dc0f68566', '내린천휴게소 양양방향', '강원 인제군 상남면 서울양양고속도로 117', '강원 인제군 상남면 서울양양고속도로 117', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f5beaa65-8561-414e-baf8-112649c3dd5a', '내린천휴게소 서울방향', '강원 인제군 상남면 하남리 345-1', '강원 인제군 상남면 하남리 345-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('30ba9f1b-6e74-4819-9630-67a35bfb03c2', '강릉대관령휴게소 인천방향', '강원특별자치도 강릉시 성산면 영동고속도로 231 강릉상휴게소', '강원특별자치도 강릉시 성산면 영동고속도로 231 강릉상휴게소', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('06bc7420-b031-4056-a640-d922afbd8f25', '강릉대관령휴게소 강릉방향', '강원특별자치도 강릉시 성산면 보광리 산41-1', '강원특별자치도 강릉시 성산면 보광리 산41-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('bae52233-3da4-458e-b41e-e414694dd818', '예산예당호휴게소 익산방향', '충청남도 예산군 응봉면 평촌리 산61-4', '충청남도 예산군 응봉면 평촌리 산61-4', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('fa6884da-3e79-4a08-b98f-71bf775deab6', '예산예당호휴게소 평택방향', '충청남도 예산군 응봉면 평촌리 산61-4', '충청남도 예산군 응봉면 평촌리 산61-4', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('37eac11a-65ef-4ab6-9fd4-c8a6b1992763', '평택호휴게소 외부입주민주차장', '경기 평택시 현덕면 권관리 산95', '경기 평택시 현덕면 권관리 산95', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('55c4308a-7c44-4a31-b2b4-60320c92d136', '평택호휴게소 익산방향', '경기도 평택시 현덕면 권관리 산95', '경기도 평택시 현덕면 권관리 산95', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('c2840b80-1b23-46f2-8067-fe45d92caeae', '평택호휴게소 평택방향', ' 경기도 평택시 현덕면 권관리 산95', ' 경기도 평택시 현덕면 권관리 산95', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e0b2a573-b2cb-40ab-8a19-799498d35366', '의정부 범한상운', '경기 의정부시 입석로55번길 1-16', '경기 의정부시 입석로55번길 1-16', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('84734fa1-5c4c-4cb2-be63-ff4fac928a1b', '서산 청자운수', '충남 서산시 양대3길 9', '충남 서산시 양대3길 9', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('49fc8242-0ff0-48d7-b6aa-4d305c465212', '서산 신흥택시', '충남 서산시 갈산1길 17-2', '충남 서산시 갈산1길 17-2', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('9e447a13-086b-4f86-bf96-1f84a5e1129f', '서산 서령택시', '충남 서산시 서령로 286', '충남 서산시 서령로 286', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f9fc8a2e-8f87-4065-8d02-246bb7cd7282', '당진 대우가스', '충남 당진시 합덕읍 남부로 1985', '충남 당진시 합덕읍 남부로 1985', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('6c72b87c-5128-41e1-b12f-975e26478bb4', '평택 천호운수', '경기 평택시 송탄로 37', '경기 평택시 송탄로 37', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('465fad8b-9f4f-4d35-bd05-8cca7b35ebdb', '버거킹 제주애월DT', '제주 제주시 애월읍 신엄리 2321', '제주 제주시 애월읍 신엄리 2321', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('fc2bd962-d860-43d6-9c1f-7a2874540ff4', '버거킹 부산명지DT', '부산 강서구 명지국제6로 218', '부산 강서구 명지국제6로 218', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('8bc789a8-f970-4755-aeeb-a3aab28bd406', '버거킹 대전용두DT', '대전 중구 용두동 29-22', '대전 중구 용두동 29-22', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('95c4ff66-c97e-412f-b98d-d2755de1867a', '버거킹 진주하대DT', '경남 진주시 대신로 345', '경남 진주시 대신로 345', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('cc4c2cc2-ddbb-4d11-97d4-ec2cdd78bbff', '버거킹 전주삼천DT', '전북 전주시 완산구 장승배기로 4', '전북 전주시 완산구 장승배기로 4', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('ca165aaa-2af9-4884-9840-925b93f05e79', '버거킹 제주화북DT', '제주 제주시 화북일동3 907-9', '제주 제주시 화북일동3 907-9', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('ca5867be-3ba4-4532-9518-bfccf28e0557', '버거킹 제주함덕DT', '제주 제주시 조천읍 일주동로 1186', '제주 제주시 조천읍 일주동로 1186', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('aa8e342c-72ae-4566-be5d-bda51028c80c', '버거킹 제주민속오일장DT', '제주 제주시 일주서로 7802', '제주 제주시 일주서로 7802', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b7e0f16f-7e1a-417a-9a76-a8e7d521b555', '버거킹 고양덕양', '경기 고양시 덕양구 호국로 1821', '경기 고양시 덕양구 호국로 1821', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('53d0fee2-06db-4348-a241-dfb94a5fbe3c', '유니클로 제주이도', '제주 제주시 구남로8길 1', '제주 제주시 구남로8길 1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('79bf413b-5a5c-4f4e-a0a2-a4ce818c21de', '유니클로 원주', '강원 원주시 북원로 2054', '강원 원주시 북원로 2054', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('52d0f6c3-4574-4c39-99c2-dfbf99acefbd', '유니클로 양산신기', '경남 양산시 양산대로 921', '경남 양산시 양산대로 921', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('207d7b90-40c4-41c1-9420-4fbba607a5fa', '유니클로 전주효자', '전북 전주시 완산구 콩쥐팥쥐로 1713', '전북 전주시 완산구 콩쥐팥쥐로 1713', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('8b6f585a-a5c2-4b8e-a6f7-4943eb897d23', '유니클로 부산사하', '부산 사하구 하신중앙로 129', '부산 사하구 하신중앙로 129', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e5115f00-1d15-47bb-bd06-290ac67ece58', '유니클로 포항장성', '경북 포항시 북구 장성동 449-3', '경북 포항시 북구 장성동 449-3', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a2e61571-792d-4aa4-9f49-6d0ff2e14155', '유니클로 충주', '충북 충주시 계명대로 191', '충북 충주시 계명대로 191', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('12630544-0ca9-46b3-a7d6-ca9b8b3b7a33', '제주 하도리문화복지회관', '제주 제주시 구좌읍 일주동로 3417', '제주 제주시 구좌읍 일주동로 3417', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b9f3c023-895a-4579-aa15-7b0f0a81cbe0', '제주 북촌리사무소', '제주 제주시 조천읍 일주동로 1514', '제주 제주시 조천읍 일주동로 1514', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('afaabfc1-e3a5-4572-a30d-4716bd3d2bb4', '제주 신촌리사무소', '제주 제주시 조천읍 신북로 54', '제주 제주시 조천읍 신북로 54', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e983f74e-a81c-4333-a025-1c8b04196120', '제주 하예하동마을회관', '제주 서귀포시 예래로 416', '제주 서귀포시 예래로 416', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('671b942b-bccf-467e-9c68-2c776cd53dc3', '제주 남원1리복지회관', '제주 서귀포시 남원읍 남원회관로 27', '제주 서귀포시 남원읍 남원회관로 27', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f8b65460-7a18-4993-ae43-6cdcec0d2059', '제주 동복리사무소', '제주 제주시 구좌읍 동복리 1693', '제주 제주시 구좌읍 동복리 1693', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('835a4fa6-3fa0-47c1-b98f-d4c52f2aa520', '제주 서광동리복지회관', '제주 서귀포시 안덕면 서광동로 17', '제주 서귀포시 안덕면 서광동로 17', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('12553c52-e883-417f-815a-5cce9fce555c', '제주 영락마을회관식당', '제주 서귀포시 대정읍 영락리 1285-13', '제주 서귀포시 대정읍 영락리 1285-13', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('00628219-0304-497a-b6af-cd9efeae8eca', '제주 덕수리마을회관', '제주 서귀포시 안덕면 덕수리 1921', '제주 서귀포시 안덕면 덕수리 1921', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4a2496e9-a7b5-4ea4-a522-5dfefa94ad30', '거제 반다비체육센터', '경남 거제시 계룡로 149', '경남 거제시 계룡로 149', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e2ab3143-ed09-4e0e-8a8c-b2f727287834', '거제 고현시장공영주차장', '경남 거제시 거제중앙로17길 6', '경남 거제시 거제중앙로17길 6', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('826e23aa-12df-480a-94f1-d6af2b37e881', '거제 농업기술센터', '경남 거제시 거제면 서정리 856-1', '경남 거제시 거제면 서정리 856-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('404b13cd-e846-4469-b7d0-d956d4a18912', '거제 고현중앙공영주차장', '경남 거제시 고현동 977-14', '경남 거제시 고현동 977-14', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('2c4cc205-6bd8-494d-85cd-ea781ccc3972', '거제 아주주민센터', '경남 거제시 아주동 290-13', '경남 거제시 아주동 290-13', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3863947b-8926-4c26-a713-8355d867f7c3', '원주 신림행정복지센터', '강원 원주시 신림면 치악로 28', '강원 원주시 신림면 치악로 28', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a0de6237-9c78-4c2d-b2e6-823a4a59f32d', '치악산 자연휴양림제1주차장', '강원 원주시 판부면 휴양림길 66', '강원 원주시 판부면 휴양림길 66', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('cd08f700-1ac0-4935-ba2d-4e9f91ea373b', '원주 우산행정복지센터', '강원 원주시 진광길 9', '강원 원주시 진광길 9', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3a100461-52fd-47bf-8a31-50bb619c81ab', '원주 반계은행나무광장주차장', '강원 원주시 문막읍 반계리 1092-1', '강원 원주시 문막읍 반계리 1092-1', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f4fc19ba-967a-4401-ac6f-4bb578397cf4', '구원주역공영주차장', '강원 원주시 평원로 158', '강원 원주시 평원로 158', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('2deaa91d-55c6-49e0-bf43-eab3f0741bf2', '원주 봉산미공영주차장', '강원 원주시 봉산동 1073-6', '강원 원주시 봉산동 1073-6', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('5aefe326-889e-44f5-b434-a898965ed994', '원주 태장행정복지센터', '강원 원주시 치악로 2068', '강원 원주시 치악로 2068', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('b9913864-166f-460a-86e7-539a1d3b3b67', '원주 일산행정복지센터', '강원 원주시 천사로 159', '강원 원주시 천사로 159', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4775c1ab-e095-4b85-851b-8aeb34a76d88', '원주공항', '강원 횡성군 횡성읍 횡성로 38', '강원 횡성군 횡성읍 횡성로 38', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('dcc1ff08-8f22-4cbc-981a-cbd2b7cb9794', '원주 치매안심센터', '강원특별자치도 원주시 지니기길 11-20', '강원특별자치도 원주시 지니기길 11-20', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('74b08d65-952b-433b-aeb2-634209ecf204', '원주 세무서앞공영주차장', '강원특별자치도 원주시 단계동 1080', '강원특별자치도 원주시 단계동 1080', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a0a79c38-e4a6-4afc-a318-b88369cfafde', '원주 개운행정복지센터', '강원 원주시 행구로 40', '강원 원주시 행구로 40', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3e7a1e70-6042-4e3a-b040-c324a5641c95', '고양 일산탄현마을', '경기 고양시 일산서구 탄현동 1506', '경기 고양시 일산서구 탄현동 1506', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a2a40e12-4776-46fd-8a58-49ca8e07da39', '고양 고봉커뮤니티센터', '경기 고양시 일산동구 공릉천로 347', '경기 고양시 일산동구 공릉천로 347', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('6f732ab6-a7f8-4cc2-a582-80735bd939b5', '킨텍스 제2전시장', '경기도 고양시 일산서구 킨텍스로 217-59 제2킨텍스', '경기도 고양시 일산서구 킨텍스로 217-59 제2킨텍스', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('18116744-3d9c-4bde-8b2e-44aa3dbb3f1b', '고양 탄현공원', '경기도 고양시 일산서구 탄현동 1515', '경기도 고양시 일산서구 탄현동 1515', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('1156f62f-e6cf-4ce2-b8a3-31a8724b07b5', '고양 대화레포츠공원', '경기도 고양시 일산서구 대화로 166 송포치안센터', '경기도 고양시 일산서구 대화로 166 송포치안센터', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('c5a3d414-8f66-4064-8ea2-9e4d6fcf755f', '고양 일산호수공원4', '경기 고양시 일산동구 장항동 905', '경기 고양시 일산동구 장항동 905', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('1f68d389-c8f3-458d-b9fe-2f06d775ed49', '고양 일산호수공원3', '경기도 고양시 일산동구 호수로 595 고양꽃전시관', '경기도 고양시 일산동구 호수로 595 고양꽃전시관', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('63d0026a-8489-4675-8dca-af896263a6bb', '고양 일산호수공원2', '경기 고양시 일산동구 호수로 595', '경기 고양시 일산동구 호수로 595', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('e7d4a59d-7ae5-4607-9e9d-32e731d78acf', '고양 일산호수공원1', '경기 고양시 일산동구 호수로 595', '경기 고양시 일산동구 호수로 595', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('96729a7c-f99b-4554-b6e4-62a5d8ff0e8a', '고양 농수산물유통센터 3주차장', '경기도 고양시 일산서구 대화동 2324-3', '경기도 고양시 일산서구 대화동 2324-3', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('91b36d6e-16aa-40ba-a414-30a468aa2216', '고양 스포츠타운', '경기 고양시 일산서구 대화동 2329', '경기 고양시 일산서구 대화동 2329', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('cb826280-8b2b-48c7-884b-2606b1276592', '고양 종합운동장 제3주차장', '경기도 고양시 일산서구 중앙로 1601 고양종합운동장', '경기도 고양시 일산서구 중앙로 1601 고양종합운동장', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('552df289-c255-416b-b39f-8815c6791d27', '고양 재활스포츠센터', '경기 고양시 일산서구 탄현로 139', '경기 고양시 일산서구 탄현로 139', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('7b533892-f05d-46b2-975d-179c1ea17c04', '고양 일산종합사회복지관', '경기 고양시 일산서구 고양대로 654', '경기 고양시 일산서구 고양대로 654', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a37b4164-eb19-4b12-82a1-054dbf014982', '서울시교통회관', '서울 송파구 올림픽로 319', '서울 송파구 올림픽로 319', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f96e48a1-8ed3-49dc-a690-343261ef9275', '연인산 제1주차장', '경기 가평군 북면 백둔리 807', '경기 가평군 북면 백둔리 807', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f9783b89-d4c5-4326-8233-2eb5c21f9106', '연인산 탐방안내소주차장', '경기 가평군 가평읍 승안리 297-60', '경기 가평군 가평읍 승안리 297-60', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('18470069-5ff5-419a-bb27-fefaacbab2da', '인천 우신교통', '인천 남동구 간석동 599', '인천 남동구 간석동 599', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('fdf72a0e-5314-43a3-9007-38e8749ad4cd', '버거킹 안성아양DT', '경기 안성시 아양2로 92', '경기 안성시 아양2로 92', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3769f42a-c1c9-4422-b742-313d9d2fb83f', '서울 태영운수', '서울 강서구 양천로27길 169', '서울 강서구 양천로27길 169', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('0e1dfbb8-2da0-4f83-ae9d-9a69f97094da', '세종 국립수목원', '세종 세종동 1203', '세종 세종동 1203', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('533721b1-6961-4199-96a3-f3ce793fbdfe', '버거킹 화성능동', '경기 화성시 동탄지성로 190', '경기 화성시 동탄지성로 190', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('c0500067-2a37-41b2-98eb-4fab5307cd64', '안산 선부', '경기 안산시 단원구 달미로 63', '경기 안산시 단원구 달미로 63', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('530b1057-0d07-4fde-b328-1f314d94ec2f', '송파 한양타워', '서울 송파구 법원로11길 12', '서울 송파구 법원로11길 12', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('f1f69875-063a-436b-b462-59f16d5b4649', '북한산 제1주차장', '서울 은평구 진관동 280', '서울 은평구 진관동 280', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('66c92550-9845-46cd-95b7-a51534490505', '용인 AK&기흥', '경기 용인시 기흥구 기흥역로 63 힐스테이트 기흥', '경기 용인시 기흥구 기흥역로 63 힐스테이트 기흥', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('a3f1077e-7454-48f5-93fc-08d7da9bccf2', '북한산 사기막야영장', '경기 고양시 덕양구 북한산로618번길 130', '경기 고양시 덕양구 북한산로618번길 130', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('17ea9597-8c75-4a0d-b466-f32d0586adcb', '버거킹 청주분평DT', '충북 청주시 서원구 청남로 1918', '충북 청주시 서원구 청남로 1918', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('6233eb6b-2a35-469b-b0f3-b808eeddb164', '태안 몽산포해수욕장', '충남 태안군 남면 안면대로 967', '충남 태안군 남면 안면대로 967', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('4f43acfd-22a9-4d0f-be67-9f9058ba36a0', '양양 서피비치', '강원 양양군 현북면 동해대로 1631', '강원 양양군 현북면 동해대로 1631', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('3f379ded-8b15-484f-a9d3-2475b3317e94', '보령 대천해수욕장', '충남 보령시 요암동 376', '충남 보령시 요암동 376', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('454beb84-3095-44f1-b6ec-455d6d235781', '부산 신평', '부산광역시 사하구 하신중앙로 121', '부산광역시 사하구 하신중앙로 121', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('934e1052-3c2e-4e5b-9ec5-74bf2a66e2ec', '대구 반월당', '대구 중구 달구벌대로 2095', '대구 중구 달구벌대로 2095', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('7cc3ef35-5627-420a-8532-9067fb05ca21', '경남 거제식물원', '경남 거제시 거제면 거제남서로 3595', '경남 거제시 거제면 거제남서로 3595', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('d1f8a4c2-8b5b-4eee-8955-8d3e76f1ac1a', '봉화 국립수목원', '경북 봉화군 춘양면 춘양로 1501 (서벽리)', '경북 봉화군 춘양면 춘양로 1501 (서벽리)', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');
INSERT INTO public.charging_stations VALUES ('5468560f-26f4-433d-8dc6-aa30b72d6e42', '서울 광화문', '서울 종로구 종로1길 50 (더케이트윈타워)', '서울 종로구 종로1길 50 (더케이트윈타워)', 'operating', NULL, '2025-08-29 04:07:10.377521+00', '2025-08-29 04:07:10.377521+00');


--
-- PostgreSQL database dump complete
--

