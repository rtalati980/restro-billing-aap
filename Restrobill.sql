--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.0

-- Started on 2025-11-27 22:23:28 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 66852)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    restro_id integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 66851)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 220 (class 1259 OID 66865)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    category_id integer,
    item_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    restro_id integer,
    CONSTRAINT menu_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 66864)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 219
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- TOC entry 222 (class 1259 OID 66882)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    table_id integer NOT NULL,
    items jsonb NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    restro_id integer,
    remarks character varying(200)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 66881)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 226 (class 1259 OID 69796)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    restro_id integer NOT NULL,
    restro_name character varying(100),
    tagline character varying(150),
    address text,
    gst_number character varying(20),
    sac_code character varying(20),
    tax_percent numeric(5,2),
    language character varying(20),
    currency character varying(5),
    service_charge numeric(5,2),
    packing_charge numeric(5,2),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 69795)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO postgres;

--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 225
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 216 (class 1259 OID 66840)
-- Name: table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."table" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer NOT NULL,
    floor character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    status boolean,
    restro_id integer,
    CONSTRAINT table_size_check CHECK ((size > 0))
);


ALTER TABLE public."table" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 66839)
-- Name: table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.table_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 215
-- Name: table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_id_seq OWNED BY public."table".id;


--
-- TOC entry 224 (class 1259 OID 66971)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    mobile character varying(20),
    otp character varying(6),
    otp_expires timestamp with time zone,
    is_verified boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    name character varying(50),
    restro_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 66970)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3471 (class 2604 OID 66855)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3474 (class 2604 OID 66868)
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- TOC entry 3477 (class 2604 OID 66885)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3482 (class 2604 OID 69799)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 66843)
-- Name: table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table" ALTER COLUMN id SET DEFAULT nextval('public.table_id_seq'::regclass);


--
-- TOC entry 3479 (class 2604 OID 66974)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3656 (class 0 OID 66852)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, description, created_at, updated_at, restro_id) FROM stdin;
4	rfthb	\N	2025-11-15 18:22:05.612611	2025-11-15 18:22:05.612611	3433
5	Main course	\N	2025-11-18 22:42:36.888557	2025-11-18 22:42:36.888557	3433
\.


--
-- TOC entry 3658 (class 0 OID 66865)
-- Dependencies: 220
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id, category_id, item_name, price, description, created_at, updated_at, restro_id) FROM stdin;
26	4	gfv	134.00	\N	2025-11-15 18:22:17.582683	2025-11-15 18:28:21.789384	3433
27	5	ROTI	100.00	\N	2025-11-18 22:42:57.393891	2025-11-18 22:42:57.393891	3433
\.


--
-- TOC entry 3660 (class 0 OID 66882)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, table_id, items, total_amount, created_at, restro_id, remarks) FROM stdin;
29	6	[{"id": 26, "qty": 3, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	0.00	2025-11-17 22:47:29.556961	3433	\N
30	6	[{"id": 26, "qty": 2, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	394.80	2025-11-18 00:48:06.244598	3433	\N
31	6	[{"id": 26, "qty": 2, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	394.80	2025-11-18 11:21:37.617994	3433	\N
32	6	[{"id": 26, "qty": 2, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	394.80	2025-11-18 11:22:21.907189	3433	\N
33	6	[{"id": 26, "qty": 3, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	542.20	2025-11-18 11:58:01.173799	3433	\N
34	6	[{"id": 26, "qty": 1, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	247.40	2025-11-18 11:59:15.64194	3433	\N
35	6	[{"id": 26, "qty": 1, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	247.40	2025-11-18 12:00:52.518615	3433	\N
36	6	[{"id": 26, "qty": 1, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	247.40	2025-11-18 12:06:52.793272	3433	\N
37	6	[{"id": 26, "qty": 1, "price": "134.00", "remark": "", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	247.40	2025-11-18 14:16:06.859755	3433	\N
38	7	[{"id": 27, "qty": 2, "price": "100.00", "remark": "", "item_name": "ROTI", "restro_id": 3433, "created_at": "2025-11-18T17:12:57.393Z", "updated_at": "2025-11-18T17:12:57.393Z", "category_id": 5, "description": null}]	320.00	2025-11-18 22:43:10.497068	3433	\N
39	6	[{"id": 26, "qty": 2, "price": "134.00", "remark": "jain", "item_name": "gfv", "restro_id": 3433, "created_at": "2025-11-15T12:52:17.582Z", "updated_at": "2025-11-15T12:58:21.789Z", "category_id": 4, "description": null}]	394.80	2025-11-21 13:20:32.976489	3433	\N
40	6	[{"id": 27, "qty": 2, "price": "100.00", "remark": "", "item_name": "ROTI", "restro_id": 3433, "created_at": "2025-11-18T17:12:57.393Z", "updated_at": "2025-11-18T17:12:57.393Z", "category_id": 5, "description": null}]	320.00	2025-11-21 13:29:13.982349	3433	\N
\.


--
-- TOC entry 3664 (class 0 OID 69796)
-- Dependencies: 226
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, restro_id, restro_name, tagline, address, gst_number, sac_code, tax_percent, language, currency, service_charge, packing_charge, updated_at) FROM stdin;
1	3433	scx	2w	cdsc	23456	vgt	5.00	\N	\N	5.00	100.00	2025-11-18 11:18:43.58979
\.


--
-- TOC entry 3654 (class 0 OID 66840)
-- Dependencies: 216
-- Data for Name: table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."table" (id, name, size, floor, created_at, updated_at, status, restro_id) FROM stdin;
3	2	6	Grond	2025-10-15 15:29:11.241201	2025-10-15 15:29:11.241201	t	\N
2	3	4	Down	2025-10-14 12:23:43.285487	2025-10-14 12:23:43.285487	t	\N
7	hcyd	5	1	2025-11-18 22:42:25.498857	2025-11-18 22:42:25.498857	t	3433
6	e	6	1	2025-11-15 18:21:56.023028	2025-11-15 18:21:56.023028	t	3433
\.


--
-- TOC entry 3662 (class 0 OID 66971)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, mobile, otp, otp_expires, is_verified, created_at, name, restro_id) FROM stdin;
7	ronakjain980@gmail.com	$2b$10$hCdR84RWZuAcIMt.773QN.H08I55cbuse9ThbZCYUkwG0nISsOKNi	\N	\N	\N	t	2025-11-05 13:07:09.504884+05:30	qwserty	3433
\.


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 219
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_seq', 27, true);


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 40, true);


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 225
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 215
-- Name: table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_id_seq', 7, true);


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3491 (class 2606 OID 66863)
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- TOC entry 3493 (class 2606 OID 66861)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 66875)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3497 (class 2606 OID 66890)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 69804)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 69806)
-- Name: settings settings_restro_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_restro_id_key UNIQUE (restro_id);


--
-- TOC entry 3487 (class 2606 OID 66850)
-- Name: table table_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table"
    ADD CONSTRAINT table_name_key UNIQUE (name);


--
-- TOC entry 3489 (class 2606 OID 66848)
-- Name: table table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table"
    ADD CONSTRAINT table_pkey PRIMARY KEY (id);


--
-- TOC entry 3499 (class 2606 OID 66982)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3501 (class 2606 OID 66984)
-- Name: users users_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_mobile_key UNIQUE (mobile);


--
-- TOC entry 3503 (class 2606 OID 66980)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 1259 OID 69807)
-- Name: idx_settings_restroid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_settings_restroid ON public.settings USING btree (restro_id);


--
-- TOC entry 3509 (class 2606 OID 66876)
-- Name: menu menu_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE CASCADE;


-- Completed on 2025-11-27 22:23:28 IST

--
-- PostgreSQL database dump complete
--

