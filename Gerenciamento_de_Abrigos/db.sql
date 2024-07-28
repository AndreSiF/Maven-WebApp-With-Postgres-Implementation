--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: abrigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abrigo (
    id_abrigo integer NOT NULL,
    nome_abrigo character varying(100),
    endereco character varying(100),
    vagas integer,
    cadastros integer
);


ALTER TABLE public.abrigo OWNER TO postgres;

--
-- Name: abrigo_id_abrigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abrigo_id_abrigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abrigo_id_abrigo_seq OWNER TO postgres;

--
-- Name: abrigo_id_abrigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abrigo_id_abrigo_seq OWNED BY public.abrigo.id_abrigo;


--
-- Name: desastre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desastre (
    id_desastre integer NOT NULL,
    id_vitima integer,
    nome_desastre character varying(100),
    data_desastre date
);


ALTER TABLE public.desastre OWNER TO postgres;

--
-- Name: desastre_id_desastre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.desastre_id_desastre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.desastre_id_desastre_seq OWNER TO postgres;

--
-- Name: desastre_id_desastre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.desastre_id_desastre_seq OWNED BY public.desastre.id_desastre;


--
-- Name: perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm (
    id_perm integer NOT NULL,
    nome_perm character varying(50)
);


ALTER TABLE public.perm OWNER TO postgres;

--
-- Name: perm_id_perm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_id_perm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perm_id_perm_seq OWNER TO postgres;

--
-- Name: perm_id_perm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_id_perm_seq OWNED BY public.perm.id_perm;


--
-- Name: riscos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riscos (
    id_riscos integer NOT NULL,
    id_vitima integer,
    frio boolean,
    nutricao boolean,
    desidrat boolean,
    machucado boolean
);


ALTER TABLE public.riscos OWNER TO postgres;

--
-- Name: riscos_id_riscos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riscos_id_riscos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riscos_id_riscos_seq OWNER TO postgres;

--
-- Name: riscos_id_riscos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riscos_id_riscos_seq OWNED BY public.riscos.id_riscos;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome character varying(100),
    cpf character(14),
    data_cad date,
    idade integer,
    id_abrigo integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: usuario_perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perm (
    id_us_perm integer NOT NULL,
    id_usuario integer,
    id_perm integer
);


ALTER TABLE public.usuario_perm OWNER TO postgres;

--
-- Name: usuario_perm_id_us_perm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_perm_id_us_perm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_perm_id_us_perm_seq OWNER TO postgres;

--
-- Name: usuario_perm_id_us_perm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perm_id_us_perm_seq OWNED BY public.usuario_perm.id_us_perm;


--
-- Name: vitima; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vitima (
    id_vitima integer NOT NULL,
    id_usuario integer,
    ultimo_end character varying(100),
    presente boolean
);


ALTER TABLE public.vitima OWNER TO postgres;

--
-- Name: vitima_id_vitima_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vitima_id_vitima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vitima_id_vitima_seq OWNER TO postgres;

--
-- Name: vitima_id_vitima_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vitima_id_vitima_seq OWNED BY public.vitima.id_vitima;


--
-- Name: voluntario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voluntario (
    id_volunt integer NOT NULL,
    id_usuario integer,
    endereco character varying(100)
);


ALTER TABLE public.voluntario OWNER TO postgres;

--
-- Name: voluntario_id_volunt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voluntario_id_volunt_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voluntario_id_volunt_seq OWNER TO postgres;

--
-- Name: voluntario_id_volunt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voluntario_id_volunt_seq OWNED BY public.voluntario.id_volunt;


--
-- Name: abrigo id_abrigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abrigo ALTER COLUMN id_abrigo SET DEFAULT nextval('public.abrigo_id_abrigo_seq'::regclass);


--
-- Name: desastre id_desastre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre ALTER COLUMN id_desastre SET DEFAULT nextval('public.desastre_id_desastre_seq'::regclass);


--
-- Name: perm id_perm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm ALTER COLUMN id_perm SET DEFAULT nextval('public.perm_id_perm_seq'::regclass);


--
-- Name: riscos id_riscos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos ALTER COLUMN id_riscos SET DEFAULT nextval('public.riscos_id_riscos_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: usuario_perm id_us_perm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm ALTER COLUMN id_us_perm SET DEFAULT nextval('public.usuario_perm_id_us_perm_seq'::regclass);


--
-- Name: vitima id_vitima; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima ALTER COLUMN id_vitima SET DEFAULT nextval('public.vitima_id_vitima_seq'::regclass);


--
-- Name: voluntario id_volunt; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario ALTER COLUMN id_volunt SET DEFAULT nextval('public.voluntario_id_volunt_seq'::regclass);


--
-- Data for Name: abrigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abrigo (id_abrigo, nome_abrigo, endereco, vagas, cadastros) FROM stdin;
1	Abrigo1	aa	3	3
2	Abrigo2	bb	2	2
\.


--
-- Data for Name: desastre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desastre (id_desastre, id_vitima, nome_desastre, data_desastre) FROM stdin;
\.


--
-- Data for Name: perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perm (id_perm, nome_perm) FROM stdin;
1	ADMIN
2	FUNCIONARIO
3	VOLUNTARIO
4	VITIMA
\.


--
-- Data for Name: riscos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riscos (id_riscos, id_vitima, frio, nutricao, desidrat, machucado) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nome, cpf, data_cad, idade, id_abrigo) FROM stdin;
1	AndrÃ©	123.456.789-10	2024-07-11	12	1
2	aa	324.543.334-21	2024-07-11	43	1
3	gf	126.432.123-32	2024-07-11	435	1
6	asd	312.432.123-43	2024-07-11	123	2
7	gsfsda	123.321.321-54	2024-07-11	123	2
\.


--
-- Data for Name: usuario_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_perm (id_us_perm, id_usuario, id_perm) FROM stdin;
1	1	3
2	2	3
3	3	3
5	6	3
6	7	3
\.


--
-- Data for Name: vitima; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vitima (id_vitima, id_usuario, ultimo_end, presente) FROM stdin;
\.


--
-- Data for Name: voluntario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voluntario (id_volunt, id_usuario, endereco) FROM stdin;
1	1	bb
2	2	b
3	3	fgb
4	6	asdd
5	7	sdfgg
\.


--
-- Name: abrigo_id_abrigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abrigo_id_abrigo_seq', 2, true);


--
-- Name: desastre_id_desastre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.desastre_id_desastre_seq', 2, true);


--
-- Name: perm_id_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_id_perm_seq', 4, true);


--
-- Name: riscos_id_riscos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riscos_id_riscos_seq', 1, true);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 7, true);


--
-- Name: usuario_perm_id_us_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perm_id_us_perm_seq', 6, true);


--
-- Name: vitima_id_vitima_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vitima_id_vitima_seq', 2, true);


--
-- Name: voluntario_id_volunt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voluntario_id_volunt_seq', 5, true);


--
-- Name: abrigo abrigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abrigo
    ADD CONSTRAINT abrigo_pkey PRIMARY KEY (id_abrigo);


--
-- Name: desastre desastre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre
    ADD CONSTRAINT desastre_pkey PRIMARY KEY (id_desastre);


--
-- Name: perm perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm
    ADD CONSTRAINT perm_pkey PRIMARY KEY (id_perm);


--
-- Name: riscos riscos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos
    ADD CONSTRAINT riscos_pkey PRIMARY KEY (id_riscos);


--
-- Name: usuario_perm usuario_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_pkey PRIMARY KEY (id_us_perm);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: vitima vitima_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_pkey PRIMARY KEY (id_vitima);


--
-- Name: voluntario voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id_volunt);


--
-- Name: desastre desastre_id_vitima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre
    ADD CONSTRAINT desastre_id_vitima_fkey FOREIGN KEY (id_vitima) REFERENCES public.vitima(id_vitima);


--
-- Name: riscos riscos_id_vitima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos
    ADD CONSTRAINT riscos_id_vitima_fkey FOREIGN KEY (id_vitima) REFERENCES public.vitima(id_vitima);


--
-- Name: usuario usuario_id_abrigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_abrigo_fkey FOREIGN KEY (id_abrigo) REFERENCES public.abrigo(id_abrigo);


--
-- Name: usuario_perm usuario_perm_id_perm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_id_perm_fkey FOREIGN KEY (id_perm) REFERENCES public.perm(id_perm);


--
-- Name: usuario_perm usuario_perm_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: vitima vitima_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: voluntario voluntario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- PostgreSQL database dump complete
--

