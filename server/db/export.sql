--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ArtistTags; Type: TABLE; Schema: public; Owner: kenzie
--

CREATE TABLE public."ArtistTags" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "tagId" integer NOT NULL
);


ALTER TABLE public."ArtistTags" OWNER TO kenzie;

--
-- Name: Artists; Type: TABLE; Schema: public; Owner: kenzie
--

CREATE TABLE public."Artists" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    lat numeric,
    lng numeric,
    insta character varying(255),
    region character varying(255),
    followers character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Artists" OWNER TO kenzie;

--
-- Name: Artists_id_seq; Type: SEQUENCE; Schema: public; Owner: kenzie
--

CREATE SEQUENCE public."Artists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Artists_id_seq" OWNER TO kenzie;

--
-- Name: Artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kenzie
--

ALTER SEQUENCE public."Artists_id_seq" OWNED BY public."Artists".id;


--
-- Name: Favorites; Type: TABLE; Schema: public; Owner: kenzie
--

CREATE TABLE public."Favorites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public."Favorites" OWNER TO kenzie;

--
-- Name: Tags; Type: TABLE; Schema: public; Owner: kenzie
--

CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Tags" OWNER TO kenzie;

--
-- Name: Tags_id_seq; Type: SEQUENCE; Schema: public; Owner: kenzie
--

CREATE SEQUENCE public."Tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tags_id_seq" OWNER TO kenzie;

--
-- Name: Tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kenzie
--

ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: kenzie
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255),
    username character varying(255),
    password character varying(255),
    lat numeric,
    lng numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO kenzie;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: kenzie
--

CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO kenzie;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kenzie
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Artists" ALTER COLUMN id SET DEFAULT nextval('public."Artists_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: ArtistTags; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."ArtistTags" ("createdAt", "updatedAt", "artistId", "tagId") FROM stdin;
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	2	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	6	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	7	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	8	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	9	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	12	3
2018-05-11 11:55:42.205-05	2018-05-11 11:55:42.205-05	13	3
2018-05-11 11:55:42.212-05	2018-05-11 11:55:42.212-05	7	11
2018-05-11 11:55:42.212-05	2018-05-11 11:55:42.212-05	8	11
2018-05-11 11:56:05.937-05	2018-05-11 11:56:05.937-05	84	25
2018-05-11 11:56:54.138-05	2018-05-11 11:56:54.138-05	84	27
2018-05-11 11:57:57.764-05	2018-05-11 11:57:57.764-05	88	13
2018-05-11 11:57:57.764-05	2018-05-11 11:57:57.764-05	88	28
2018-05-11 11:58:40.33-05	2018-05-11 11:58:40.33-05	88	3
2018-05-11 11:58:54.883-05	2018-05-11 11:58:54.883-05	69	2
2018-05-11 11:59:53.976-05	2018-05-11 11:59:53.976-05	44	2
2018-05-11 12:00:08.7-05	2018-05-11 12:00:08.7-05	94	2
2018-05-11 12:00:32.818-05	2018-05-11 12:00:32.818-05	94	1
2018-05-11 12:00:44.77-05	2018-05-11 12:00:44.77-05	97	2
2018-05-11 12:01:18.028-05	2018-05-11 12:01:18.028-05	93	26
2018-05-11 12:01:18.028-05	2018-05-11 12:01:18.028-05	93	1
2018-05-11 12:02:06.847-05	2018-05-11 12:02:06.847-05	29	3
2018-05-11 12:02:06.847-05	2018-05-11 12:02:06.847-05	29	15
2018-05-11 12:02:06.847-05	2018-05-11 12:02:06.847-05	29	11
2018-05-11 13:36:17.598-05	2018-05-11 13:36:17.598-05	100	29
2018-05-11 13:36:17.598-05	2018-05-11 13:36:17.598-05	100	1
2018-05-11 13:36:49.659-05	2018-05-11 13:36:49.659-05	24	30
2018-05-11 13:36:49.659-05	2018-05-11 13:36:49.659-05	24	31
2018-05-11 13:36:49.659-05	2018-05-11 13:36:49.659-05	24	3
2018-05-11 13:36:58.575-05	2018-05-11 13:36:58.575-05	24	7
2018-05-11 13:37:54.602-05	2018-05-11 13:37:54.602-05	46	3
2018-05-14 11:16:42.159-05	2018-05-14 11:16:42.159-05	31	3
2018-05-14 11:16:42.159-05	2018-05-14 11:16:42.159-05	31	32
2018-05-14 11:17:11.982-05	2018-05-14 11:17:11.982-05	54	3
2018-05-14 11:17:11.982-05	2018-05-14 11:17:11.982-05	54	33
2018-05-14 11:18:05.212-05	2018-05-14 11:18:05.212-05	54	17
2018-05-14 12:39:31.13-05	2018-05-14 12:39:31.13-05	48	3
2018-05-14 16:00:53.245-05	2018-05-14 16:00:53.245-05	55	3
2018-05-14 16:50:07.191-05	2018-05-14 16:50:07.191-05	101	2
2018-05-14 16:50:07.191-05	2018-05-14 16:50:07.191-05	101	3
2018-05-14 16:50:07.191-05	2018-05-14 16:50:07.191-05	101	7
2018-05-14 16:50:07.191-05	2018-05-14 16:50:07.191-05	101	11
2018-05-14 16:52:54.641-05	2018-05-14 16:52:54.641-05	102	11
2018-05-14 16:52:54.641-05	2018-05-14 16:52:54.641-05	102	3
2018-05-14 16:52:54.641-05	2018-05-14 16:52:54.641-05	102	7
2018-05-14 16:55:48.711-05	2018-05-14 16:55:48.711-05	103	21
2018-05-14 16:55:48.711-05	2018-05-14 16:55:48.711-05	103	34
2018-05-14 16:55:48.711-05	2018-05-14 16:55:48.711-05	103	23
2018-05-14 16:55:48.711-05	2018-05-14 16:55:48.711-05	103	35
2018-05-14 16:55:48.711-05	2018-05-14 16:55:48.711-05	103	36
2018-05-14 16:59:00.746-05	2018-05-14 16:59:00.746-05	104	3
2018-05-14 16:59:00.746-05	2018-05-14 16:59:00.746-05	104	11
2018-05-14 16:59:00.746-05	2018-05-14 16:59:00.746-05	104	6
2018-05-14 16:59:00.746-05	2018-05-14 16:59:00.746-05	104	37
2018-05-14 16:59:00.746-05	2018-05-14 16:59:00.746-05	104	7
2018-05-14 17:01:33.026-05	2018-05-14 17:01:33.026-05	105	33
2018-05-14 17:01:33.026-05	2018-05-14 17:01:33.026-05	105	3
2018-05-14 17:01:33.026-05	2018-05-14 17:01:33.026-05	105	34
2018-05-14 17:01:33.026-05	2018-05-14 17:01:33.026-05	105	38
2018-05-14 17:03:17.104-05	2018-05-14 17:03:17.104-05	15	3
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	39
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	40
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	22
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	21
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	23
2018-05-14 17:04:35.368-05	2018-05-14 17:04:35.368-05	41	41
2018-05-15 09:24:28.439-05	2018-05-15 09:24:28.439-05	33	1
2018-05-15 09:24:45.312-05	2018-05-15 09:24:45.312-05	5	33
2018-05-15 09:24:45.312-05	2018-05-15 09:24:45.312-05	5	2
2018-05-15 09:25:20.992-05	2018-05-15 09:25:20.992-05	23	3
2018-05-15 09:25:20.992-05	2018-05-15 09:25:20.992-05	23	11
2018-05-15 09:25:20.992-05	2018-05-15 09:25:20.992-05	23	8
2018-05-15 09:25:20.992-05	2018-05-15 09:25:20.992-05	23	9
2018-05-15 09:26:46.566-05	2018-05-15 09:26:46.566-05	85	16
2018-05-15 09:26:46.566-05	2018-05-15 09:26:46.566-05	85	34
2018-05-15 09:26:46.566-05	2018-05-15 09:26:46.566-05	85	3
2018-05-15 09:26:46.566-05	2018-05-15 09:26:46.566-05	85	11
2018-05-15 13:42:33.211-05	2018-05-15 13:42:33.211-05	3	2
2018-05-15 13:42:44.46-05	2018-05-15 13:42:44.46-05	4	1
2018-05-15 13:43:58.118-05	2018-05-15 13:43:58.118-05	10	11
2018-05-15 13:43:58.118-05	2018-05-15 13:43:58.118-05	10	7
2018-05-15 13:43:58.118-05	2018-05-15 13:43:58.118-05	10	5
2018-05-15 13:43:58.118-05	2018-05-15 13:43:58.118-05	10	23
2018-05-15 13:43:58.118-05	2018-05-15 13:43:58.118-05	10	21
2018-05-15 13:44:14.711-05	2018-05-15 13:44:14.711-05	10	42
2018-05-15 13:45:29.081-05	2018-05-15 13:45:29.081-05	21	2
2018-05-15 13:45:29.081-05	2018-05-15 13:45:29.081-05	21	7
2018-05-15 13:45:29.081-05	2018-05-15 13:45:29.081-05	21	16
2018-05-15 13:45:29.081-05	2018-05-15 13:45:29.081-05	21	31
2018-05-15 13:46:19.097-05	2018-05-15 13:46:19.097-05	11	2
2018-05-15 13:46:19.097-05	2018-05-15 13:46:19.097-05	11	33
2018-05-15 13:47:32.94-05	2018-05-15 13:47:32.94-05	1	32
2018-05-15 13:47:32.94-05	2018-05-15 13:47:32.94-05	1	21
2018-05-15 13:47:32.94-05	2018-05-15 13:47:32.94-05	1	5
2018-05-15 13:47:32.94-05	2018-05-15 13:47:32.94-05	1	43
2018-05-15 13:47:32.94-05	2018-05-15 13:47:32.94-05	1	13
2018-05-15 16:00:30.987-05	2018-05-15 16:00:30.987-05	16	33
2018-05-15 16:00:30.987-05	2018-05-15 16:00:30.987-05	16	3
2018-05-15 16:02:14.546-05	2018-05-15 16:02:14.546-05	90	44
2018-05-15 20:24:57.248-05	2018-05-15 20:24:57.248-05	2	19
2018-05-15 20:24:57.248-05	2018-05-15 20:24:57.248-05	2	18
2018-05-15 20:26:28.233-05	2018-05-15 20:26:28.233-05	6	1
2018-05-15 20:26:52.265-05	2018-05-15 20:26:52.265-05	36	1
2018-05-15 20:26:52.265-05	2018-05-15 20:26:52.265-05	36	45
2018-05-15 20:26:52.265-05	2018-05-15 20:26:52.265-05	36	6
2018-05-15 20:31:23.259-05	2018-05-15 20:31:23.259-05	61	33
2018-05-15 20:31:23.259-05	2018-05-15 20:31:23.259-05	61	2
2018-05-16 10:11:24.933-05	2018-05-16 10:11:24.933-05	22	33
2018-05-16 10:11:24.933-05	2018-05-16 10:11:24.933-05	22	3
2018-05-16 10:12:39.269-05	2018-05-16 10:12:39.269-05	71	33
2018-05-16 10:12:39.269-05	2018-05-16 10:12:39.269-05	71	39
2018-05-16 10:12:39.269-05	2018-05-16 10:12:39.269-05	71	40
2018-05-16 10:12:39.269-05	2018-05-16 10:12:39.269-05	71	30
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	7
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	3
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	46
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	19
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	47
2018-05-16 10:17:35.158-05	2018-05-16 10:17:35.158-05	38	48
2018-05-16 10:19:05.246-05	2018-05-16 10:19:05.246-05	74	2
2018-05-16 10:19:05.246-05	2018-05-16 10:19:05.246-05	74	1
2018-05-16 10:19:05.246-05	2018-05-16 10:19:05.246-05	74	29
2018-05-16 10:21:09.499-05	2018-05-16 10:21:09.499-05	28	3
2018-05-16 10:21:09.499-05	2018-05-16 10:21:09.499-05	28	49
2018-05-16 10:21:58.391-05	2018-05-16 10:21:58.391-05	51	3
2018-05-16 10:21:58.391-05	2018-05-16 10:21:58.391-05	51	15
2018-05-16 10:21:58.391-05	2018-05-16 10:21:58.391-05	51	36
2018-05-16 10:21:58.391-05	2018-05-16 10:21:58.391-05	51	49
2018-05-16 10:23:19.361-05	2018-05-16 10:23:19.361-05	17	21
2018-05-16 10:23:19.361-05	2018-05-16 10:23:19.361-05	17	22
2018-05-16 10:23:19.361-05	2018-05-16 10:23:19.361-05	17	41
2018-05-16 10:23:19.361-05	2018-05-16 10:23:19.361-05	17	50
\.


--
-- Data for Name: Artists; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Artists" (id, name, email, lat, lng, insta, region, followers, "createdAt", "updatedAt") FROM stdin;
19	Camilo Pino Maciel		-33.4378305	-70.65044920000003	camilo.pino.maciel	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
34	Jeroen Gardenier	Jeroengardenier@Gmail.com	52.3682585	4.87538219999999	jeroengardenier	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
35	Claudia De Sabe	Sabeontheroad@gmail.com	51.5073509	-0.12775829999998223	claudiadesabe	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
40	Lucy O'Connell	lucyoconnelltattoo@gmail.com	53.795967	-1.5401910000000498	lucylucyhorsehead	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
53	Dan Molloy	danmolloytattoo@gmail.com	-31.9505269	115.86045719999993	danmolloytattooer	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
56	James McKenna	james.mckenna12@gmail.com	-32.2172474	116.00833149999994	j__mckenna	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
58	Lorena Morato	\N	50.937531	6.960278600000038	https://instagram.com/ninmesarra	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
59	Katie Shocrylas		49.2827291	-123.12073750000002	kshocs	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
62	Mico	micotattoo6162@gmail.com	35.17955429999999	129.07564160000004	micotattoo	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
24	Alexis Gillenwater	tattoosbyalexis@gmail.com	38.286931	-85.82456300000001	tattoosbyalexis	Indiana, United States	2725	2018-05-11 11:55:42.162-05	2018-05-11 13:36:58.516-05
14	Mark Cross	\N	40.715831	-73.94441589999997	mark__cross	New York, United States	65589	2018-05-11 11:55:42.162-05	2018-05-14 11:08:51.795-05
27	Matt Lambdin	\N	39.9774295	-75.1246334	lambdin_	Pennsylvania, United States	93034	2018-05-11 11:55:42.162-05	2018-05-14 11:08:59.847-05
31	Mike Moses	info.thedrowntown@gmail.com	39.9902309	-83.01244179999998	thedrowntown	Ohio, United States	81057	2018-05-11 11:55:42.162-05	2018-05-14 11:16:42.11-05
57	Kat Marie Moya	\N	40.0259959	-83.01468590000002	muscadomestica	Ohio, United States	7982	2018-05-11 11:55:42.162-05	2018-05-14 11:16:26.944-05
46	Chad Lenjer	lenjertattoos@gmail.com	41.31595939999999	-81.8358136	challenjer	Ohio, United States	48576	2018-05-11 11:55:42.162-05	2018-05-14 11:13:54.622-05
65	Ian Wahnshaffe		-34.60368440000001	-58.381559100000004	ian_ildet	Buenos Aires, Argentina	35331	2018-05-11 11:55:42.162-05	2018-05-14 11:16:07.686-05
52	Jesus Cuesta	\N	40.4167754	-3.7037901999999576	jesuscuesta	Comunidad de Madrid, Spain	33459	2018-05-11 11:55:42.162-05	2018-05-14 11:16:16.206-05
30	Tom Wagstaff	T_wagstaff@outlook.com	52.470675	-2.1539599999999837	tomwagstaff	England, United Kingdom	15757	2018-05-11 11:55:42.162-05	2018-05-14 11:16:21.645-05
68	Elizabeth Hapi	\N	-31.9307198	115.85960219999993	lizhapi	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
70	El Tanque	eltanquetattooer@gmail.com	41.87779150000001	12.523409300000026	el_tanque_tattooer	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
55	Alex Dorfler		51.31705359999999	9.492455199999995	alex_sances_one	Hessen, Germany	\N	2018-05-11 11:55:42.162-05	2018-05-14 16:00:53.213-05
12	Magda Hanke	magda.hanke@web.de	53.560511	9.958298499999955	magda_hanke	Hamburg, Germany	\N	2018-05-11 11:55:42.162-05	2018-05-14 15:59:49.794-05
33	Dalmiro Dalmont	\N	51.5073509	-0.12775829999998223	dalmirodalmont	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 09:24:28.413-05
66	Monika Vanasse	\N	43.6602101	-79.41545389999999	monikadarling	Ontario, Canada	\N	2018-05-11 11:55:42.162-05	2018-05-14 16:48:22.203-05
37	Phil Hatchet-Yau	\N	32.7150263	-117.16045459999998	philhatchetyau	California, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 17:02:20.826-05
5	Jon Larson	\N	42.2461445	-83.6120432	shitwishtattoos	Michigan, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 09:24:45.272-05
23	Maggie Gosselar	\N	44.268207	-88.47094500000003	block_ness	Wisconsin, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 09:25:20.934-05
73	Fabio Nembo	Nembotattoo@gmail.com	41.87779150000001	12.523409300000026	fabio_nembo	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
76	Marco Giovanni	marcofgiovanni@gmail.com	52.6308859	1.2973550000000387	thehallowedharetattoo	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
8	Brad Leander	bradleandertattoo@gmail.com	53.4021816	-1.5038851	bradleandertattoo	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:43:04.535-05
10	Stefani Stipple	\N	39.9588226	-75.6058243	stefanistipple.tattoos	Pennsylvania, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:44:14.662-05
21	Miss Quartz	missquartztattoo@hotmail.com	-37.857438	145.02947560000007	missquartz	Victoria, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:45:29.024-05
79	Lauren Marie Sutton	lo.marie.tattoo@gmail.com	53.4835718	-2.2314062	lo_marie_s	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
80	Horikoi Young-jin Jeon	\N	35.17955429999999	129.07564160000004	horikoii	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
6	Dale Winter	dale.tattoo@gmail.com	-27.461636	153.004461	dvlewintertvttoos	Queensland, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:26:28.211-05
26	Eto Nastasya	\N	53.2415041	50.22124629999996	hellonastasya	Samarskaya oblast', Russia	\N	2018-05-11 11:55:42.162-05	2018-05-15 16:00:40.092-05
2	Dean Kalcoff	dean.kalcoff@gmail.com	-37.9712304	144.4913101	deankalcoff	Victoria, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:24:57.225-05
36	Horitomo	\N	37.3493976	-121.8939823	horitomo_stateofgrace	California, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:26:52.218-05
81	Matt Renshaw	Mrenshawtattoos@gmail.com	53.43043400000001	-1.3573140999999396	mattylaboosh_hgtc	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:30:42.066-05
83	Delphine Noiztoy	Delphinenoiztoyink@gmail.com	51.54374900000001	-0.025351999999998043	delphinenoiztoy	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
87	Jacob Wiman	Jacobwiman@gmail.com	55.5946967	12.98928479999995	blackmagicjake	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
91	Sara Macneil	\N	-46.411449	168.35057660000007	saramacneiltattoo	\N	\N	2018-05-11 11:55:42.162-05	2018-05-11 11:55:42.162-05
28	Isnard Barbosa	\N	53.344115	-6.268719000000033	isnardbarbosa	County Dublin, Ireland	180450	2018-05-11 11:55:42.162-05	2018-05-16 10:21:09.445-05
42	Becca		51.56029299999999	0.2202838000000611	s6girl	England, United Kingdom	88443	2018-05-11 11:55:42.162-05	2018-05-16 10:08:44.759-05
38	Georgina Liliane	georginatattoo@gmail.com	51.06554750000001	-1.3133397999999943	georginaliliane	England, United Kingdom	25678	2018-05-11 11:55:42.162-05	2018-05-16 10:17:35.097-05
49	Rob Borbas		47.162494	19.503304100000037	grindesign_tattoo	\N	410434	2018-05-11 11:55:42.162-05	2018-05-16 10:08:51.269-05
61	Samuel Briganti	\N	43.779985	11.258086800000001	samuelebriganti	Toscana, Italy	259293	2018-05-11 11:55:42.162-05	2018-05-16 10:08:53.114-05
39	Nomi Chi	nomi.tattoo@gmail.com	49.2830802	-123.10707360000004	lizard__milk	British Columbia, Canada	111304	2018-05-11 11:55:42.162-05	2018-05-16 10:09:00.693-05
22	Cody Dresser	codydressertattoos@gmail.com	32.5631924	-97.14167680000003	codydresser	Texas, United States	30044	2018-05-11 11:55:42.162-05	2018-05-16 10:11:24.911-05
67	Kija Barudi	tatueringvisby@gmail.com	57.6355946	18.307409199999938	kijabarudi	Gotlands län, Sweden	3211	2018-05-11 11:55:42.162-05	2018-05-16 10:15:31.746-05
60	Henry Gassner	henrytattoosme@gmail.com	35.5778197	-82.58051999999998	henrytattoos	North Carolina, United States	6236	2018-05-11 11:55:42.162-05	2018-05-16 10:09:40.043-05
64	Rob Junod	6682robjunod@gmail.com	37.2291815	-93.29475120000001	robjunod	Missouri, United States	2281	2018-05-11 11:55:42.162-05	2018-05-16 10:11:12.179-05
13	Chris Stockings	Chrisstockingstattoo@gmail.com	52.084287	0.4373729999999796	chrisstockings	England, United Kingdom	48404	2018-05-11 11:55:42.162-05	2018-05-16 10:15:37.658-05
1	Pari Corbitt	pari.corbitt@gmail.com	-37.7460575	144.963964	pari_corbitt	Victoria, Australia	139165	2018-05-11 11:55:42.162-05	2018-05-16 10:11:30.359-05
17	Iain Sellar	iain@longfox.co.uk	51.454513	-2.5879099999999653	iainsellar	England, United Kingdom	40384	2018-05-11 11:55:42.162-05	2018-05-16 10:23:31.506-05
93	Brad Hill	\N	35.925885	-86.87273979999998	elchupacabrad	Tennessee, United States	1665	2018-05-11 11:55:42.162-05	2018-05-11 12:01:17.974-05
94	Murray Sell	murrayftw@gmail.com	35.925885	-86.87273979999998	murraysell	Tennessee, United States	9482	2018-05-11 11:55:42.162-05	2018-05-14 11:12:55.765-05
97	Zack Deaton	zackdeatontattoo@gmail.com	36.176546	-86.75082099999997	zackdeaton	Tennessee, United States	6599	2018-05-11 11:55:42.162-05	2018-05-11 14:57:43.121-05
25	Mitch Hoggard	mitchhoggardtattoos@yahoo.com	32.529524	-92.6424097	mitchhoggardtattoos	Louisiana, United States	1408	2018-05-11 11:55:42.162-05	2018-05-14 11:16:46.592-05
75	Samantha Ford	DESIGNS4SAM@YAHOO.CO.UK	53.353077	-2.855109999999968	sam_ford_tattoos	England, United Kingdom	63990	2018-05-11 11:55:42.162-05	2018-05-14 11:13:04.568-05
69	Zane Pendergast	zanependergast@gmail.com	36.1884944	-86.72888369999998	zanependergast_tattoo	Tennessee, United States	7325	2018-05-11 11:55:42.162-05	2018-05-11 14:58:41.953-05
72	Fabio Onorini	\N	45.0573607	7.671222400000033	fabioonorini	Piemonte, Italy	34837	2018-05-11 11:55:42.162-05	2018-05-14 11:13:07.915-05
82	Lauren Harper	Harpertattoos@gmail.com	53.4837261	-2.2324212999999418	laurenharpertattoo	England, United Kingdom	7395	2018-05-11 11:55:42.162-05	2018-05-14 10:31:56.509-05
63	Alex Zampirri	Alexzampirritattoos@gmail.com	40.4064881	-75.50184769999998	azamp_	Pennsylvania, United States	39456	2018-05-11 11:55:42.162-05	2018-05-14 11:09:11.868-05
43	Dan Fletcher	danfletchertattoos@gmail.com	49.86187400000001	-97.10879699999998	blindvulture	Manitoba, Canada	50088	2018-05-11 11:55:42.162-05	2018-05-14 11:16:52.002-05
84	Jeff Barnard	goldenyeti@ymail.com	35.925885	-86.87273979999998	golden_yeti	Tennessee, United States	3496	2018-05-11 11:55:42.162-05	2018-05-14 11:13:55.764-05
98	Debbie Jones	Debbiejonestattoos@gmail.com	51.6186698	-3.9474663999999393	debbiejonestattoos	Wales, United Kingdom	7595	2018-05-11 11:55:42.162-05	2018-05-14 11:16:14.887-05
54	Jonathan Penchoff	jonathan.earthgrasper@gmail.com	39.7631459	-104.9797423	earthgrasper	Colorado, United States	64989	2018-05-11 11:55:42.162-05	2018-05-14 11:18:05.186-05
77	Rich Wren	Therichwren@gmail.com	40.211702	-75.139905	therichwren	Pennsylvania, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 16:48:36.587-05
99	Betty Rose	bettyrosetattoos@gmail.com	40.6781784	-73.9441579	bettyrosetattoos	New York, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 16:48:41.403-05
89	Jesse Rix	info@jesserix.com	42.933692	-72.27814089999998	jesse_rix	New Hampshire, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 16:49:10.022-05
102	Kaitlin Greenwood	\N	-32.0569	115.74389999999994	_kaitlingreenwood	\N	\N	2018-05-14 16:52:54.568-05	2018-05-14 16:52:54.568-05
103	Valentin Hirsch	\N	52.4407709	13.44450710000001	valentinhirschtattoo	Berlin, Germany	\N	2018-05-14 16:55:48.645-05	2018-05-14 16:55:49.04-05
104	Kelsey Ellis	honeybasiltattoos@outlook.com	44.2311717	-76.48595439999997	honeybasiltattoos	Ontario, Canada	\N	2018-05-14 16:59:00.701-05	2018-05-14 16:59:01.09-05
15	Mike Stockings	mikestockingstattoouk@gmail.com	34.083853	-118.350392	mikestockings	California, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 17:03:17.08-05
50	Joshua Marks	\N	34.0522342	-118.2436849	joshuamarkstattoos	California, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 17:02:24.586-05
78	Von Toma	vontomatattoo@gmail.com	42.3600825	-71.05888010000001	vontoma	Massachusetts, United States	\N	2018-05-11 11:55:42.162-05	2018-05-14 17:02:17.8-05
85	Muriel Zao	zaoink@gmail.com	33.4483771	-112.07403729999999	murielzaotattoo	Arizona, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 09:26:46.519-05
3	Dani Queipo	daniqueipotattoo@hotmail.com	51.5285578	0.242025	daniqueipo	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:42:33.165-05
4	Chris Wielk	cjwtattoos@gmail.com	37.7251452	-122.4648061	chriswielk	California, United States	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:42:44.436-05
9	Sam Kane	samkane2@hotmail.com	-34.033982	151.10118	samkanetattoo	New South Wales, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:43:01.187-05
7	Matt Webb	mattwebbtattoo@gmail.com	53.7435634	-0.3464867	mattwebbtattoo	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:43:06.748-05
11	Max Kelling	\N	51.3995287	7.4300481999999874	kelling_btl	Nordrhein-Westfalen, Germany	\N	2018-05-11 11:55:42.162-05	2018-05-15 13:46:19.06-05
44	Aaron Ashworth	\N	-31.9307198	115.85960219999993	aj_tattoo	Western Australia, Australia	43963	2018-05-11 11:55:42.162-05	2018-05-15 20:24:42.158-05
45	Daniel Formentin	\N	-32.0526056	115.74961459999997	danielformentin	Western Australia, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 16:00:49.852-05
16	Joe Frost	joefrosttattoo@gmail.com	53.38112899999999	-1.47008500000004	hellomynamesjoe	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 16:00:30.963-05
90	Vika Kiwi	\N	59.91482699999999	30.30701399999998	vika_kiwitattoo	Saint Petersburg, Russia	\N	2018-05-11 11:55:42.162-05	2018-05-15 16:02:14.482-05
20	Jonny Farq	jonnyfarq@gmail.com	-27.454654	153.02981799999998	jon_ftw	Queensland, Australia	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:25:27.074-05
95	Jenia Storik	\N	46.482526	30.723309500000028	hawaikatattoo	Odessa Oblast, Ukraine	\N	2018-05-11 11:55:42.162-05	2018-05-15 16:01:18.23-05
18	Kelly Violet	Kellyviolettattoo@gmail.com	51.5073509	-0.12775829999998223	kellyviolence	England, United Kingdom	\N	2018-05-11 11:55:42.162-05	2018-05-15 20:30:33.8-05
74	Gianluca Artico	\N	41.7712882	12.227009599999974	gianluca_artico	Lazio, Italy	20425	2018-05-11 11:55:42.162-05	2018-05-16 10:19:05.197-05
48	Mitchell Allenden	sneakymitchtattoo@hotmail.com	53.793713	-1.5392795000000206	sneakymitch	England, United Kingdom	269248	2018-05-11 11:55:42.162-05	2018-05-16 10:08:30.059-05
29	Ulysses Blair	ulyss.blair@gmail.com	34.8031405	-87.67685689999996	ulyss_blair	Alabama, United States	35539	2018-05-11 11:55:42.162-05	2018-05-16 10:08:40.546-05
101	Jess Baker	jessbakerbookings@gmail.com	39.9588226	-75.6058243	jessbakertattoo	Pennsylvania, United States	17107	2018-05-14 16:50:07.151-05	2018-05-16 10:08:31.937-05
88	John Barrett	johnbarrett863@gmail.com	33.4473361	-84.14686159999997	yogi_barrett	Georgia, United States	284563	2018-05-11 11:55:42.162-05	2018-05-16 10:08:35.305-05
47	Myra Brodsky	meibrent@hotmail.com	40.750872	-73.98666700000001	spinsterette	New York, United States	15578	2018-05-11 11:55:42.162-05	2018-05-16 10:08:54.709-05
41	Nate Burns	revoltingworshiptattoos@gmail.com	40.01799099999999	-82.87238500000001	revoltingworship	Ohio, United States	49215	2018-05-11 11:55:42.162-05	2018-05-16 10:08:57.511-05
96	David Chaston	davidschaston@gmail.com	-33.9303	18.42213000000004	davidchastontattoo	Western Cape, South Africa	2879	2018-05-11 11:55:42.162-05	2018-05-16 10:08:59.03-05
86	Sam Clark	samclarktattoos@gmail.com	-26.3645433	152.96766950000006	samclarktattoos	Queensland, Australia	224960	2018-05-11 11:55:42.162-05	2018-05-16 10:12:51.107-05
92	Heath Clifford		-46.411449	168.35057660000007	HeathClifford	Southland, New Zealand	121460	2018-05-11 11:55:42.162-05	2018-05-16 10:11:35.744-05
32	Squire Strahan	\N	27.894302	-82.33030610000003	squirestrahan	Florida, United States	29410	2018-05-11 11:55:42.162-05	2018-05-16 10:11:10.647-05
100	Mike Dorsey	mikedorseytattoo@gmail.com	39.1031182	-84.51201960000003	mikedorseytattoo	Ohio, United States	102488	2018-05-11 11:55:42.162-05	2018-05-16 10:11:14.008-05
71	Brando Chiesa	brandochiesa.appointments@gmail.com	43.7695604	11.25581360000001	brandochiesa	Toscana, Italy	521661	2018-05-11 11:55:42.162-05	2018-05-16 10:12:39.164-05
105	Little Andy	littleandytattoo@gmail.com	52.30791499999999	-1.9418580000000247	littleandytattoo	England, United Kingdom	163285	2018-05-14 17:01:32.962-05	2018-05-16 10:14:36.023-05
51	Toni Donaire	\N	41.38506389999999	2.1734034999999494	tdonaire	Catalunya, Spain	274025	2018-05-11 11:55:42.162-05	2018-05-16 10:21:58.337-05
\.


--
-- Name: Artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenzie
--

SELECT pg_catalog.setval('public."Artists_id_seq"', 105, true);


--
-- Data for Name: Favorites; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Favorites" ("createdAt", "updatedAt", "artistId", "userId") FROM stdin;
2018-05-11 11:55:42.218-05	2018-05-11 11:55:42.218-05	3	1
2018-05-11 14:52:01.551-05	2018-05-11 14:52:01.551-05	31	1
2018-05-11 14:52:03.401-05	2018-05-11 14:52:03.401-05	5	1
2018-05-11 14:52:05.078-05	2018-05-11 14:52:05.078-05	46	1
2018-05-11 14:52:06.94-05	2018-05-11 14:52:06.94-05	23	1
2018-05-11 14:52:09.175-05	2018-05-11 14:52:09.175-05	27	1
2018-05-14 10:31:48.379-05	2018-05-14 10:31:48.379-05	85	1
2018-05-14 11:09:16.502-05	2018-05-14 11:09:16.502-05	63	1
2018-05-14 11:28:47.86-05	2018-05-14 11:28:47.86-05	44	1
2018-05-14 12:39:22.273-05	2018-05-14 12:39:22.273-05	48	1
2018-05-14 16:00:09.018-05	2018-05-14 16:00:09.018-05	55	1
2018-05-15 09:23:21.259-05	2018-05-15 09:23:21.259-05	86	1
2018-05-15 09:23:58.883-05	2018-05-15 09:23:58.883-05	92	1
2018-05-15 09:24:11.485-05	2018-05-15 09:24:11.485-05	52	1
2018-05-15 15:59:28.694-05	2018-05-15 15:59:28.694-05	2	1
2018-05-15 16:00:34.176-05	2018-05-15 16:00:34.176-05	16	1
2018-05-15 16:00:58.84-05	2018-05-15 16:00:58.84-05	45	1
2018-05-15 16:01:06.06-05	2018-05-15 16:01:06.06-05	51	1
2018-05-15 16:01:18.962-05	2018-05-15 16:01:18.962-05	95	1
2018-05-15 20:29:30.364-05	2018-05-15 20:29:30.364-05	36	1
2018-05-15 20:30:05.442-05	2018-05-15 20:30:05.442-05	54	1
2018-05-15 20:30:23.053-05	2018-05-15 20:30:23.053-05	28	1
2018-05-15 20:31:01.612-05	2018-05-15 20:31:01.612-05	71	1
2018-05-15 20:31:15.958-05	2018-05-15 20:31:15.958-05	61	1
\.


--
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Tags" (id, name, "createdAt", "updatedAt") FROM stdin;
1	Japanese traditional	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
2	American traditional	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
3	neotraditional	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
4	bright colors	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
5	black and gray	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
6	cats	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
7	female	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
9	nonbinary	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
11	floral	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
12	dark colors	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
13	realism	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
14	photorealism	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
15	birds	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
16	feminine	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
19	dinosaurs	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
20	hand-poked	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
21	blackwork	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
22	engraving	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
23	stippling	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
24	art nouveau	2018-05-11 11:55:42.189-05	2018-05-11 11:55:42.189-05
25	new school	2018-05-11 11:56:05.922-05	2018-05-11 11:56:05.922-05
26	superheroes	2018-05-11 11:56:05.928-05	2018-05-11 11:56:05.928-05
27	reptiles	2018-05-11 11:56:54.132-05	2018-05-11 11:56:54.132-05
28	portraits	2018-05-11 11:57:57.749-05	2018-05-11 11:57:57.749-05
31	pinups	2018-05-11 13:36:49.65-05	2018-05-11 13:36:49.65-05
32	dark	2018-05-14 11:16:42.142-05	2018-05-14 11:16:42.142-05
33	bright color	2018-05-14 11:17:11.973-05	2018-05-14 11:17:11.973-05
34	geometric	2018-05-14 16:55:48.7-05	2018-05-14 16:55:48.7-05
35	owls	2018-05-14 16:55:48.704-05	2018-05-14 16:55:48.704-05
36	tigers	2018-05-14 16:55:48.705-05	2018-05-14 16:55:48.705-05
37	dogs	2018-05-14 16:59:00.738-05	2018-05-14 16:59:00.738-05
38	trippy	2018-05-14 17:01:33.018-05	2018-05-14 17:01:33.018-05
39	horror	2018-05-14 17:04:35.352-05	2018-05-14 17:04:35.352-05
40	gore	2018-05-14 17:04:35.36-05	2018-05-14 17:04:35.36-05
41	hatching	2018-05-14 17:04:35.361-05	2018-05-14 17:04:35.361-05
8	LGBTQ	2018-05-11 11:55:42.189-05	2018-05-15 11:06:17.724-05
10	POC	2018-05-11 11:55:42.189-05	2018-05-15 11:06:58.433-05
17	Harry Potter	2018-05-11 11:55:42.189-05	2018-05-15 11:07:20.891-05
18	Star Wars	2018-05-11 11:55:42.189-05	2018-05-15 11:07:34.359-05
29	Hannya	2018-05-11 13:36:17.586-05	2018-05-15 11:09:01.496-05
30	Pokemon	2018-05-11 13:36:49.645-05	2018-05-15 11:09:11.864-05
42	scars	2018-05-15 13:44:14.701-05	2018-05-15 13:44:14.701-05
43	insects	2018-05-15 13:47:32.932-05	2018-05-15 13:47:32.932-05
44	watercolor	2018-05-15 16:02:14.518-05	2018-05-15 16:02:14.518-05
45	Monmon cats	2018-05-15 20:26:52.249-05	2018-05-15 20:26:52.249-05
46	horses	2018-05-16 10:17:35.146-05	2018-05-16 10:17:35.146-05
47	dragons	2018-05-16 10:17:35.145-05	2018-05-16 10:17:35.145-05
48	wolves	2018-05-16 10:17:35.151-05	2018-05-16 10:17:35.151-05
49	busts	2018-05-16 10:21:09.485-05	2018-05-16 10:21:09.485-05
50	snakes	2018-05-16 10:23:19.356-05	2018-05-16 10:23:19.356-05
\.


--
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenzie
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 50, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Users" (id, email, username, password, lat, lng, "createdAt", "updatedAt") FROM stdin;
1	kenziebottoms@gmail.com	kenzie	$2a$08$McZwA0ZCnn7KfZ5P03eVee.BORlTVmI5GAuaUg/FWZVKBPkucwQce	\N	\N	2018-05-11 11:55:42.151-05	2018-05-11 11:55:42.151-05
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenzie
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, true);


--
-- Name: ArtistTags_pkey; Type: CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_pkey" PRIMARY KEY ("artistId", "tagId");


--
-- Name: Artists_pkey; Type: CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Artists"
    ADD CONSTRAINT "Artists_pkey" PRIMARY KEY (id);


--
-- Name: Favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY ("artistId", "userId");


--
-- Name: Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: ArtistTags_artistId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ArtistTags_tagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public."Tags"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Favorites_artistId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Favorites_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenzie
--

ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

