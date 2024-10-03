--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-10-03 17:42:47

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
-- TOC entry 216 (class 1259 OID 17140)
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
-- TOC entry 215 (class 1259 OID 17139)
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
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 215
-- Name: abrigo_id_abrigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abrigo_id_abrigo_seq OWNED BY public.abrigo.id_abrigo;


--
-- TOC entry 226 (class 1259 OID 17195)
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
-- TOC entry 225 (class 1259 OID 17194)
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
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 225
-- Name: desastre_id_desastre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.desastre_id_desastre_seq OWNED BY public.desastre.id_desastre;


--
-- TOC entry 228 (class 1259 OID 17207)
-- Name: perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm (
    id_perm integer NOT NULL,
    nome_perm character varying(50)
);


ALTER TABLE public.perm OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17206)
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
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 227
-- Name: perm_id_perm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_id_perm_seq OWNED BY public.perm.id_perm;


--
-- TOC entry 224 (class 1259 OID 17183)
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
-- TOC entry 223 (class 1259 OID 17182)
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
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 223
-- Name: riscos_id_riscos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riscos_id_riscos_seq OWNED BY public.riscos.id_riscos;


--
-- TOC entry 218 (class 1259 OID 17147)
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
-- TOC entry 217 (class 1259 OID 17146)
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
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 230 (class 1259 OID 17214)
-- Name: usuario_perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perm (
    id_us_perm integer NOT NULL,
    id_usuario integer,
    id_perm integer
);


ALTER TABLE public.usuario_perm OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17213)
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
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuario_perm_id_us_perm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perm_id_us_perm_seq OWNED BY public.usuario_perm.id_us_perm;


--
-- TOC entry 220 (class 1259 OID 17159)
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
-- TOC entry 219 (class 1259 OID 17158)
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
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 219
-- Name: vitima_id_vitima_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vitima_id_vitima_seq OWNED BY public.vitima.id_vitima;


--
-- TOC entry 222 (class 1259 OID 17171)
-- Name: voluntario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voluntario (
    id_volunt integer NOT NULL,
    id_usuario integer,
    endereco character varying(100)
);


ALTER TABLE public.voluntario OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17170)
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
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 221
-- Name: voluntario_id_volunt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voluntario_id_volunt_seq OWNED BY public.voluntario.id_volunt;


--
-- TOC entry 4669 (class 2604 OID 17143)
-- Name: abrigo id_abrigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abrigo ALTER COLUMN id_abrigo SET DEFAULT nextval('public.abrigo_id_abrigo_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 17198)
-- Name: desastre id_desastre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre ALTER COLUMN id_desastre SET DEFAULT nextval('public.desastre_id_desastre_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 17210)
-- Name: perm id_perm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm ALTER COLUMN id_perm SET DEFAULT nextval('public.perm_id_perm_seq'::regclass);


--
-- TOC entry 4673 (class 2604 OID 17186)
-- Name: riscos id_riscos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos ALTER COLUMN id_riscos SET DEFAULT nextval('public.riscos_id_riscos_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 17150)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 4676 (class 2604 OID 17217)
-- Name: usuario_perm id_us_perm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm ALTER COLUMN id_us_perm SET DEFAULT nextval('public.usuario_perm_id_us_perm_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 17162)
-- Name: vitima id_vitima; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima ALTER COLUMN id_vitima SET DEFAULT nextval('public.vitima_id_vitima_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 17174)
-- Name: voluntario id_volunt; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario ALTER COLUMN id_volunt SET DEFAULT nextval('public.voluntario_id_volunt_seq'::regclass);


--
-- TOC entry 4844 (class 0 OID 17140)
-- Dependencies: 216
-- Data for Name: abrigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abrigo (id_abrigo, nome_abrigo, endereco, vagas, cadastros) FROM stdin;
2	Abrigo2	bb	2	2
1	Abrigo1	aa	10	3
\.


--
-- TOC entry 4854 (class 0 OID 17195)
-- Dependencies: 226
-- Data for Name: desastre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desastre (id_desastre, id_vitima, nome_desastre, data_desastre) FROM stdin;
\.


--
-- TOC entry 4856 (class 0 OID 17207)
-- Dependencies: 228
-- Data for Name: perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perm (id_perm, nome_perm) FROM stdin;
1	ADMIN
2	FUNCIONARIO
3	VOLUNTARIO
4	VITIMA
\.


--
-- TOC entry 4852 (class 0 OID 17183)
-- Dependencies: 224
-- Data for Name: riscos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riscos (id_riscos, id_vitima, frio, nutricao, desidrat, machucado) FROM stdin;
\.


--
-- TOC entry 4846 (class 0 OID 17147)
-- Dependencies: 218
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nome, cpf, data_cad, idade, id_abrigo) FROM stdin;
1	André	123.456.789-10	2024-07-11	12	1
2	aa	324.543.334-21	2024-07-11	43	1
3	gf	126.432.123-32	2024-07-11	435	1
6	asd	312.432.123-43	2024-07-11	123	2
7	gsfsda	123.321.321-54	2024-07-11	123	2
\.


--
-- TOC entry 4858 (class 0 OID 17214)
-- Dependencies: 230
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
-- TOC entry 4848 (class 0 OID 17159)
-- Dependencies: 220
-- Data for Name: vitima; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vitima (id_vitima, id_usuario, ultimo_end, presente) FROM stdin;
\.


--
-- TOC entry 4850 (class 0 OID 17171)
-- Dependencies: 222
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
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 215
-- Name: abrigo_id_abrigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abrigo_id_abrigo_seq', 2, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 225
-- Name: desastre_id_desastre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.desastre_id_desastre_seq', 2, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 227
-- Name: perm_id_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_id_perm_seq', 4, true);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 223
-- Name: riscos_id_riscos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riscos_id_riscos_seq', 1, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 7, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuario_perm_id_us_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perm_id_us_perm_seq', 6, true);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 219
-- Name: vitima_id_vitima_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vitima_id_vitima_seq', 2, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 221
-- Name: voluntario_id_volunt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voluntario_id_volunt_seq', 5, true);


--
-- TOC entry 4678 (class 2606 OID 17145)
-- Name: abrigo abrigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abrigo
    ADD CONSTRAINT abrigo_pkey PRIMARY KEY (id_abrigo);


--
-- TOC entry 4688 (class 2606 OID 17200)
-- Name: desastre desastre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre
    ADD CONSTRAINT desastre_pkey PRIMARY KEY (id_desastre);


--
-- TOC entry 4690 (class 2606 OID 17212)
-- Name: perm perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm
    ADD CONSTRAINT perm_pkey PRIMARY KEY (id_perm);


--
-- TOC entry 4686 (class 2606 OID 17188)
-- Name: riscos riscos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos
    ADD CONSTRAINT riscos_pkey PRIMARY KEY (id_riscos);


--
-- TOC entry 4692 (class 2606 OID 17219)
-- Name: usuario_perm usuario_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_pkey PRIMARY KEY (id_us_perm);


--
-- TOC entry 4680 (class 2606 OID 17152)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4682 (class 2606 OID 17164)
-- Name: vitima vitima_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_pkey PRIMARY KEY (id_vitima);


--
-- TOC entry 4684 (class 2606 OID 17176)
-- Name: voluntario voluntario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id_volunt);


--
-- TOC entry 4697 (class 2606 OID 17201)
-- Name: desastre desastre_id_vitima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desastre
    ADD CONSTRAINT desastre_id_vitima_fkey FOREIGN KEY (id_vitima) REFERENCES public.vitima(id_vitima);


--
-- TOC entry 4696 (class 2606 OID 17189)
-- Name: riscos riscos_id_vitima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riscos
    ADD CONSTRAINT riscos_id_vitima_fkey FOREIGN KEY (id_vitima) REFERENCES public.vitima(id_vitima);


--
-- TOC entry 4693 (class 2606 OID 17153)
-- Name: usuario usuario_id_abrigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_abrigo_fkey FOREIGN KEY (id_abrigo) REFERENCES public.abrigo(id_abrigo);


--
-- TOC entry 4698 (class 2606 OID 17225)
-- Name: usuario_perm usuario_perm_id_perm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_id_perm_fkey FOREIGN KEY (id_perm) REFERENCES public.perm(id_perm);


--
-- TOC entry 4699 (class 2606 OID 17220)
-- Name: usuario_perm usuario_perm_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perm
    ADD CONSTRAINT usuario_perm_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 4694 (class 2606 OID 17165)
-- Name: vitima vitima_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 4695 (class 2606 OID 17177)
-- Name: voluntario voluntario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


-- Completed on 2024-10-03 17:42:47

--
-- PostgreSQL database dump complete
--

