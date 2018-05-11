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
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	2	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	6	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	7	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	8	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	9	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	12	3
2018-05-11 10:43:48.602-05	2018-05-11 10:43:48.602-05	13	3
2018-05-11 10:43:48.611-05	2018-05-11 10:43:48.611-05	7	11
2018-05-11 10:43:48.611-05	2018-05-11 10:43:48.611-05	8	11
\.


--
-- Data for Name: Artists; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Artists" (id, name, email, lat, lng, insta, region, followers, "createdAt", "updatedAt") FROM stdin;
1	Pari Corbitt	pari.corbitt@gmail.com	-37.7460575	144.963964	pari_corbitt	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
2	Dean Kalcoff	dean.kalcoff@gmail.com	-37.9712304	144.4913101	deankalcoff	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
3	Dani Queipo	daniqueipotattoo@hotmail.com	51.5285578	0.242025	daniqueipo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
4	Chris Wielk	CJWTATTOOS@GMAIL.COM	37.7251452	-122.4648061	chriswielk	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
5	Jon Larson	\N	42.2461445	-83.6120432	shitwishtattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
6	Dale Winter	dale.tattoo@gmail.com	-27.461636	153.004461	dvlewintertvttoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
7	Matt Webb	mattwebbtattoo@gmail.com	53.7435634	-0.3464867	mattwebbtattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
8	Brad Leander	bradleandertattoo@gmail.com	53.4021816	-1.5038851	bradleandertattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
9	Sam Kane	samkane2@hotmail.com	-34.033982	151.10118	samkanetattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
10	Stefani Stipple	\N	39.9588226	-75.6058243	stefanistipple.tattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
11	Max Kelling	\N	51.3995287	7.4300481999999874	kelling_btl	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
12	Magda Hanke	magda.hanke@web.de	53.560511	9.958298499999955	magda_hanke	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
13	Chris Stockings	Chrisstockingstattoo@gmail.com	52.084287	0.4373729999999796	chrisstockings	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
14	Mark Cross	\N	40.715831	-73.94441589999997	mark__cross	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
15	Mike Stockings	Mikestockingstattoouk@gmail.com	34.083853	-118.350392	mikestockings	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
16	Joe Frost	Joefrosttattoo@gmail.com	53.38112899999999	-1.47008500000004	hellomynamesjoe	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
17	Iain Sellar	Iain@longfox.co.uk	51.454513	-2.5879099999999653	iainsellar	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
18	Kelly Violet	Kellyviolettattoo@gmail.com	51.5073509	-0.12775829999998223	kellyviolence	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
19	Camilo Pino Maciel		-33.4378305	-70.65044920000003	camilo.pino.maciel	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
20	Jonny Farq	jonnyfarq@gmail.com	-27.454654	153.02981799999998	jon_ftw	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
21	Miss Quartz	missquartztattoo@hotmail.com	-37.857438	145.02947560000007	missquartz	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
22	Cody Dresser	CodyDresserTattoos@gmail.com	32.5631924	-97.14167680000003	codydresser	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
23	Maggie Gosselar	\N	44.268207	-88.47094500000003	block_ness	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
24	Alexis Gillenwater	Tattoosbyalexis@gmail.com	38.286931	-85.82456300000001	tattoosbyalexis	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
25	Mitch Hoggard	mitchhoggardtattoos@yahoo.com	32.529524	-92.6424097	mitchhoggardtattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
26	Eto Nastasya	\N	53.2415041	50.22124629999996	hellonastasya	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
27	Matt Lambdin	\N	39.9774295	-75.1246334	lambdin_	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
28	Isnard Barbosa	\N	53.344115	-6.268719000000033	isnardbarbosa	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
29	Ulysses Blair	Ulyss.Blair@gmail.com	34.8031405	-87.67685689999996	ulyss_blair	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
30	Tom Wagstaff	T_wagstaff@outlook.com	52.470675	-2.1539599999999837	tomwagstaff	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
31	Mike Moses	info.thedrowntown@gmail.com	39.9902309	-83.01244179999998	thedrowntown	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
32	Squire Strahan	\N	27.894302	-82.33030610000003	squirestrahan	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
33	Dalmiro Dalmont	\N	51.5073509	-0.12775829999998223	dalmirodalmont	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
34	Jeroen Gardenier	Jeroengardenier@Gmail.com	52.3682585	4.87538219999999	jeroengardenier	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
35	Claudia De Sabe	Sabeontheroad@gmail.com	51.5073509	-0.12775829999998223	claudiadesabe	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
36	Horitomo	\N	37.3493976	-121.8939823	horitomo_stateofgrace	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
37	Phil Hatchet-Yau	\N	32.7150263	-117.16045459999998	philhatchetyau	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
38	Georgina Liliane	georginatattoo@gmail.com	51.06554750000001	-1.3133397999999943	georginaliliane	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
39	Nomi Chi	nomi.tattoo@gmail.com	49.2830802	-123.10707360000004	lizard__milk	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
40	Lucy O'Connell	lucyoconnelltattoo@gmail.com	53.795967	-1.5401910000000498	lucylucyhorsehead	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
41	Nate Burns	revoltingworshiptattoos@gmail.com	40.01799099999999	-82.87238500000001	revoltingworship	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
42	Becca		51.56029299999999	0.2202838000000611	s6girl	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
43	Dan Fletcher	danfletchertattoos@gmail.com	49.86187400000001	-97.10879699999998	blindvulture	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
44	Aaron Ashworth	\N	-31.9307198	115.85960219999993	aj_tattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
45	Daniel Formentin	\N	-32.0526056	115.74961459999997	danielformentin	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
46	Chad Lenjer	LENJERTATTOOS@GMAIL.COM	41.31595939999999	-81.8358136	challenjer	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
47	Myra Brodsky	meibrent@hotmail.com	40.750872	-73.98666700000001	spinsterette	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
48	Mitchell Allenden	SNEAKYMITCHTATTOO@HOTMAIL.COM	53.793713	-1.5392795000000206	sneakymitch	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
49	Rob Borbas		47.162494	19.503304100000037	grindesign_tattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
50	Joshua Marks	\N	34.0522342	-118.2436849	joshuamarkstattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
51	Toni Donaire	\N	41.38506389999999	2.1734034999999494	tdonaire	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
52	Jesus Cuesta	\N	40.4167754	-3.7037901999999576	jesuscuesta	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
53	Dan Molloy	danmolloytattoo@gmail.com	-31.9505269	115.86045719999993	danmolloytattooer	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
54	Jonathan Penchoff	JONATHAN.EARTHGRASPER@GMAIL.COM	39.7631459	-104.9797423	earthgrasper	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
55	Alex Dorfler		51.31705359999999	9.492455199999995	alex_sances_one	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
56	James McKenna	james.mckenna12@gmail.com	-32.2172474	116.00833149999994	j__mckenna	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
57	Kat Marie Moya	\N	40.0259959	-83.01468590000002	muscadomestica	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
58	Lorena Morato	\N	50.937531	6.960278600000038	https://instagram.com/ninmesarra	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
59	Katie Shocrylas		49.2827291	-123.12073750000002	kshocs	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
60	Henry Gassner	henrytattoosme@gmail.com	35.5778197	-82.58051999999998	henrytattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
61	Samuel Briganti	\N	43.779985	11.258086800000001	samuelebriganti	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
62	Mico	micotattoo6162@gmail.com	35.17955429999999	129.07564160000004	micotattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
63	Alex Zampirri	Alexzampirritattoos@gmail.com	40.4064881	-75.50184769999998	azamp_	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
64	Rob Junod	6682robjunod@gmail.com	37.2291815	-93.29475120000001	robjunod	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
65	Ian Wahnshaffe		-34.60368440000001	-58.381559100000004	ian_ildet	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
66	Monika Vanasse	\N	43.6602101	-79.41545389999999	monikadarling	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
67	Kija Barudi	tatueringvisby@gmail.com	57.6355946	18.307409199999938	kijabarudi	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
68	Elizabeth Hapi	\N	-31.9307198	115.85960219999993	lizhapi	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
69	Zane Pendergast	zanependergast@gmail.com	36.1884944	-86.72888369999998	zanependergast_tattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
70	El Tanque	eltanquetattooer@gmail.com	41.87779150000001	12.523409300000026	el_tanque_tattooer	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
71	Brando Chiesa	brandochiesa.appointments@gmail.com	43.7695604	11.25581360000001	brandochiesa	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
72	Fabio Onorini	\N	45.0573607	7.671222400000033	fabioonorini	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
73	Fabio Nembo	Nembotattoo@gmail.com	41.87779150000001	12.523409300000026	fabio_nembo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
74	Gianluca Artico	\N	41.7712882	12.227009599999974	gianluca_artico	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
75	Samantha Ford	DESIGNS4SAM@YAHOO.CO.UK	53.353077	-2.855109999999968	sam_ford_tattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
76	Marco Giovanni	marcofgiovanni@gmail.com	52.6308859	1.2973550000000387	thehallowedharetattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
77	Rich Wren	Therichwren@gmail.com	40.211702	-75.139905	therichwren	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
78	Von Toma	vontomatattoo@gmail.com	42.3600825	-71.05888010000001	vontoma	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
79	Lauren Marie Sutton	lo.marie.tattoo@gmail.com	53.4835718	-2.2314062	lo_marie_s	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
80	Horikoi Young-jin Jeon	\N	35.17955429999999	129.07564160000004	horikoii	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
81	Matt Renshaw	Mrenshawtattoos@gmail.com	53.43043400000001	-1.3573140999999396	mattylaboosh_hgtc	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
82	Lauren Harper	Harpertattoos@gmail.com	53.4837261	-2.2324212999999418	laurenharpertattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
83	Delphine Noiztoy	Delphinenoiztoyink@gmail.com	51.54374900000001	-0.025351999999998043	delphinenoiztoy	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
84	Jeff Barnard	goldenyeti@ymail.com	35.925885	-86.87273979999998	golden_yeti	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
85	Muriel Zao	zaoink@gmail.com	33.4483771	-112.07403729999999	murielzaotattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
86	Sam Clark	samclarktattoos@gmail.com	-26.3645433	152.96766950000006	samclarktattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
87	Jacob Wiman	Jacobwiman@gmail.com	55.5946967	12.98928479999995	blackmagicjake	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
88	John Barrett	Johnbarrett863@gmail.com	33.4473361	-84.14686159999997	yogi_barrett	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
89	Jesse Rix	info@jesserix.com	42.933692	-72.27814089999998	jesse_rix	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
90	Vika Kiwi	\N	59.91482699999999	30.30701399999998	vika_kiwitattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
91	Sara Macneil	\N	-46.411449	168.35057660000007	saramacneiltattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
92	Heath Clifford		-46.411449	168.35057660000007	HeathClifford	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
93	Brad Hill	\N	35.925885	-86.87273979999998	elchupacabrad	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
94	Murray Sell	murrayftw@gmail.com	35.925885	-86.87273979999998	murraysell	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
95	Jenia Storik	\N	46.482526	30.723309500000028	hawaikatattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
96	David Chaston	davidschaston@gmail.com	-33.9303	18.42213000000004	davidchastontattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
97	Zack Deaton	ZackDeatonTattoo@gmail.com	36.176546	-86.75082099999997	zackdeaton	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
98	Debbie Jones	Debbiejonestattoos@gmail.com	51.6186698	-3.9474663999999393	debbiejonestattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
99	Betty Rose	bettyrosetattoos@gmail.com	40.6781784	-73.9441579	bettyrosetattoos	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
100	Mike Dorsey	mikedorseytattoo@gmail.com	39.1031182	-84.51201960000003	mikedorseytattoo	\N	\N	2018-05-11 10:43:48.553-05	2018-05-11 10:43:48.553-05
\.


--
-- Name: Artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenzie
--

SELECT pg_catalog.setval('public."Artists_id_seq"', 100, true);


--
-- Data for Name: Favorites; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Favorites" ("createdAt", "updatedAt", "artistId", "userId") FROM stdin;
2018-05-11 10:43:48.618-05	2018-05-11 10:43:48.618-05	3	1
\.


--
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Tags" (id, name, "createdAt", "updatedAt") FROM stdin;
1	Japanese traditional	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
2	American traditional	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
3	neotraditional	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
4	bright colors	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
5	black and gray	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
6	cats	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
7	female	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
8	lgbtq	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
9	nonbinary	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
10	poc	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
11	floral	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
12	dark colors	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
13	realism	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
14	photorealism	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
15	birds	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
16	feminine	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
17	harry potter	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
18	star wars	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
19	dinosaurs	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
20	hand-poked	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
21	blackwork	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
22	engraving	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
23	stippling	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
24	art nouveau	2018-05-11 10:43:48.587-05	2018-05-11 10:43:48.587-05
\.


--
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenzie
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 24, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: kenzie
--

COPY public."Users" (id, email, username, password, lat, lng, "createdAt", "updatedAt") FROM stdin;
1	kenziebottoms@gmail.com	kenzie	$2a$08$nJtW12JI3CPYUdkU.tepNeoKINe4iciNh.peLRssqg4uCjlu70nMG	\N	\N	2018-05-11 10:43:48.542-05	2018-05-11 10:43:48.542-05
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

