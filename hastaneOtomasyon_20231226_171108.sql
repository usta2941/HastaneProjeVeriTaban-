--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

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

--
-- Name: hastaneOtomasyon; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "hastaneOtomasyon" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1254';


ALTER DATABASE "hastaneOtomasyon" OWNER TO postgres;

\connect "hastaneOtomasyon"

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
-- Name: Malzeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Malzeme" (
    id integer NOT NULL,
    ad character varying(40) NOT NULL
);


ALTER TABLE public."Malzeme" OWNER TO postgres;

--
-- Name: Malzeme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Malzeme_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Malzeme_id_seq" OWNER TO postgres;

--
-- Name: Malzeme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Malzeme_id_seq" OWNED BY public."Malzeme".id;


--
-- Name: MemnuniyetAnketi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MemnuniyetAnketi" (
    id integer NOT NULL,
    yorum text
);


ALTER TABLE public."MemnuniyetAnketi" OWNER TO postgres;

--
-- Name: MemnuniyetAnketi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MemnuniyetAnketi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."MemnuniyetAnketi_id_seq" OWNER TO postgres;

--
-- Name: MemnuniyetAnketi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MemnuniyetAnketi_id_seq" OWNED BY public."MemnuniyetAnketi".id;


--
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    "personelNo" integer NOT NULL,
    adi character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL,
    "personelTipi" character(40) NOT NULL
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- Name: Personel_personelNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Personel_personelNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Personel_personelNo_seq" OWNER TO postgres;

--
-- Name: Personel_personelNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Personel_personelNo_seq" OWNED BY public.personel."personelNo";


--
-- Name: departman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departman (
    id integer NOT NULL,
    ad character varying(40) NOT NULL,
    stok integer NOT NULL
);


ALTER TABLE public.departman OWNER TO postgres;

--
-- Name: departman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departman_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departman_id_seq OWNER TO postgres;

--
-- Name: departman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departman_id_seq OWNED BY public.departman.id;


--
-- Name: doktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doktor (
    "personelNo" integer NOT NULL,
    "departmanID" integer
);


ALTER TABLE public.doktor OWNER TO postgres;

--
-- Name: fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fatura (
    id integer NOT NULL,
    tutar double precision
);


ALTER TABLE public.fatura OWNER TO postgres;

--
-- Name: fatura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fatura_id_seq OWNER TO postgres;

--
-- Name: fatura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fatura_id_seq OWNED BY public.fatura.id;


--
-- Name: gorevli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gorevli (
    "personelNo" integer NOT NULL,
    "gorevliMeslekID" integer
);


ALTER TABLE public.gorevli OWNER TO postgres;

--
-- Name: gorevliler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gorevliler (
    id integer NOT NULL,
    meslek character varying(40) NOT NULL
);


ALTER TABLE public.gorevliler OWNER TO postgres;

--
-- Name: gorevliler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gorevliler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gorevliler_id_seq OWNER TO postgres;

--
-- Name: gorevliler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gorevliler_id_seq OWNED BY public.gorevliler.id;


--
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta (
    id integer NOT NULL,
    ad character varying(40) NOT NULL,
    soyad character varying(40) NOT NULL,
    "refakatciID" integer,
    "faturaID" integer,
    "DoktorID" integer,
    "anketID" integer,
    "receteID" integer
);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- Name: hasta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hasta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hasta_id_seq OWNER TO postgres;

--
-- Name: hasta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hasta_id_seq OWNED BY public.hasta.id;


--
-- Name: hemsire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hemsire (
    "personelNo" integer NOT NULL,
    "departmanID" integer
);


ALTER TABLE public.hemsire OWNER TO postgres;

--
-- Name: ilac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilac (
    id integer NOT NULL,
    ad character varying(40)
);


ALTER TABLE public.ilac OWNER TO postgres;

--
-- Name: ilacVeMalzeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ilacVeMalzeme" (
    id integer NOT NULL,
    "ilacID" integer,
    "malzemeID" integer,
    "stokID" integer
);


ALTER TABLE public."ilacVeMalzeme" OWNER TO postgres;

--
-- Name: ilacVeMalzeme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ilacVeMalzeme_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ilacVeMalzeme_id_seq" OWNER TO postgres;

--
-- Name: ilacVeMalzeme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ilacVeMalzeme_id_seq" OWNED BY public."ilacVeMalzeme".id;


--
-- Name: ilac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ilac_id_seq OWNER TO postgres;

--
-- Name: ilac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilac_id_seq OWNED BY public.ilac.id;


--
-- Name: recete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recete (
    id integer NOT NULL
);


ALTER TABLE public.recete OWNER TO postgres;

--
-- Name: receteIlac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."receteIlac" (
    id integer NOT NULL,
    "receteID" integer,
    "ilacID" integer
);


ALTER TABLE public."receteIlac" OWNER TO postgres;

--
-- Name: receteIlac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."receteIlac_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."receteIlac_id_seq" OWNER TO postgres;

--
-- Name: receteIlac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."receteIlac_id_seq" OWNED BY public."receteIlac".id;


--
-- Name: recete_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recete_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recete_id_seq OWNER TO postgres;

--
-- Name: recete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recete_id_seq OWNED BY public.recete.id;


--
-- Name: refakatci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refakatci (
    id integer NOT NULL,
    ad character varying(40) NOT NULL,
    soyad character varying(40) NOT NULL
);


ALTER TABLE public.refakatci OWNER TO postgres;

--
-- Name: refakatci_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refakatci_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refakatci_id_seq OWNER TO postgres;

--
-- Name: refakatci_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refakatci_id_seq OWNED BY public.refakatci.id;


--
-- Name: stok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stok (
    id integer NOT NULL
);


ALTER TABLE public.stok OWNER TO postgres;

--
-- Name: stok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stok_id_seq OWNER TO postgres;

--
-- Name: stok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stok_id_seq OWNED BY public.stok.id;


--
-- Name: Malzeme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Malzeme" ALTER COLUMN id SET DEFAULT nextval('public."Malzeme_id_seq"'::regclass);


--
-- Name: MemnuniyetAnketi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MemnuniyetAnketi" ALTER COLUMN id SET DEFAULT nextval('public."MemnuniyetAnketi_id_seq"'::regclass);


--
-- Name: departman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departman ALTER COLUMN id SET DEFAULT nextval('public.departman_id_seq'::regclass);


--
-- Name: fatura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura ALTER COLUMN id SET DEFAULT nextval('public.fatura_id_seq'::regclass);


--
-- Name: gorevliler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorevliler ALTER COLUMN id SET DEFAULT nextval('public.gorevliler_id_seq'::regclass);


--
-- Name: hasta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta ALTER COLUMN id SET DEFAULT nextval('public.hasta_id_seq'::regclass);


--
-- Name: ilac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac ALTER COLUMN id SET DEFAULT nextval('public.ilac_id_seq'::regclass);


--
-- Name: ilacVeMalzeme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacVeMalzeme" ALTER COLUMN id SET DEFAULT nextval('public."ilacVeMalzeme_id_seq"'::regclass);


--
-- Name: personel personelNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel ALTER COLUMN "personelNo" SET DEFAULT nextval('public."Personel_personelNo_seq"'::regclass);


--
-- Name: recete id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete ALTER COLUMN id SET DEFAULT nextval('public.recete_id_seq'::regclass);


--
-- Name: receteIlac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."receteIlac" ALTER COLUMN id SET DEFAULT nextval('public."receteIlac_id_seq"'::regclass);


--
-- Name: refakatci id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refakatci ALTER COLUMN id SET DEFAULT nextval('public.refakatci_id_seq'::regclass);


--
-- Name: stok id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok ALTER COLUMN id SET DEFAULT nextval('public.stok_id_seq'::regclass);


--
-- Data for Name: Malzeme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: MemnuniyetAnketi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MemnuniyetAnketi" (id, yorum) VALUES
	(1, NULL);


--
-- Data for Name: departman; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departman (id, ad, stok) VALUES
	(1, 'genel', 1);


--
-- Data for Name: doktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.doktor ("personelNo", "departmanID") VALUES
	(1, 1);


--
-- Data for Name: fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fatura (id, tutar) VALUES
	(1, 50);


--
-- Data for Name: gorevli; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: gorevliler; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hasta (id, ad, soyad, "refakatciID", "faturaID", "DoktorID", "anketID", "receteID") VALUES
	(2, 'Ahmet', 'USTA', NULL, NULL, NULL, NULL, NULL),
	(1, 'Ahmet', 'Uzun', 1, 1, 1, 1, 1),
	(3, 'Arif', 'Gezgin', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: hemsire; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ilac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilac (id, ad) VALUES
	(1, 'parol');


--
-- Data for Name: ilacVeMalzeme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personel ("personelNo", adi, soyadi, "personelTipi") VALUES
	(1, 'Ahmet', 'Gümüş', 'Doktor                                  ');


--
-- Data for Name: recete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recete (id) VALUES
	(1);


--
-- Data for Name: receteIlac; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: refakatci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.refakatci (id, ad, soyad) VALUES
	(1, 'Mehmet', 'Günay');


--
-- Data for Name: stok; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stok (id) VALUES
	(1);


--
-- Name: Malzeme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Malzeme_id_seq"', 1, false);


--
-- Name: MemnuniyetAnketi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MemnuniyetAnketi_id_seq"', 1, false);


--
-- Name: Personel_personelNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Personel_personelNo_seq"', 1, false);


--
-- Name: departman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departman_id_seq', 1, false);


--
-- Name: fatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fatura_id_seq', 1, false);


--
-- Name: gorevliler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gorevliler_id_seq', 1, false);


--
-- Name: hasta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hasta_id_seq', 2, true);


--
-- Name: ilacVeMalzeme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ilacVeMalzeme_id_seq"', 1, false);


--
-- Name: ilac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilac_id_seq', 1, true);


--
-- Name: receteIlac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."receteIlac_id_seq"', 1, false);


--
-- Name: recete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recete_id_seq', 1, false);


--
-- Name: refakatci_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refakatci_id_seq', 1, false);


--
-- Name: stok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stok_id_seq', 1, false);


--
-- Name: Malzeme Malzeme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Malzeme"
    ADD CONSTRAINT "Malzeme_pkey" PRIMARY KEY (id);


--
-- Name: MemnuniyetAnketi MemnuniyetAnketi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MemnuniyetAnketi"
    ADD CONSTRAINT "MemnuniyetAnketi_pkey" PRIMARY KEY (id);


--
-- Name: departman departman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departman
    ADD CONSTRAINT departman_pkey PRIMARY KEY (id);


--
-- Name: doktor doktorPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "doktorPK" PRIMARY KEY ("personelNo");


--
-- Name: fatura fatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT fatura_pkey PRIMARY KEY (id);


--
-- Name: gorevli gorevliPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorevli
    ADD CONSTRAINT "gorevliPK" PRIMARY KEY ("personelNo");


--
-- Name: gorevliler gorevliler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorevliler
    ADD CONSTRAINT gorevliler_pkey PRIMARY KEY (id);


--
-- Name: hasta hasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT hasta_pkey PRIMARY KEY (id);


--
-- Name: hemsire hemsirePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemsire
    ADD CONSTRAINT "hemsirePK" PRIMARY KEY ("personelNo");


--
-- Name: ilacVeMalzeme ilacVeMalzeme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacVeMalzeme"
    ADD CONSTRAINT "ilacVeMalzeme_pkey" PRIMARY KEY (id);


--
-- Name: ilac ilac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac
    ADD CONSTRAINT ilac_pkey PRIMARY KEY (id);


--
-- Name: personel personelPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "personelPK" PRIMARY KEY ("personelNo");


--
-- Name: receteIlac receteIlac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."receteIlac"
    ADD CONSTRAINT "receteIlac_pkey" PRIMARY KEY (id);


--
-- Name: recete recete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete
    ADD CONSTRAINT recete_pkey PRIMARY KEY (id);


--
-- Name: refakatci refakatci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refakatci
    ADD CONSTRAINT refakatci_pkey PRIMARY KEY (id);


--
-- Name: stok stok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok
    ADD CONSTRAINT stok_pkey PRIMARY KEY (id);


--
-- Name: fki_anketFromMemnuniyet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_anketFromMemnuniyet" ON public.hasta USING btree ("anketID");


--
-- Name: fki_departmanIsim; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_departmanIsim" ON public.hemsire USING btree ("departmanID");


--
-- Name: fki_departmanIsimfromdepartman; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_departmanIsimfromdepartman" ON public.hemsire USING btree ("departmanID");


--
-- Name: fki_departmanIsım; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_departmanIsım" ON public.doktor USING btree ("departmanID");


--
-- Name: fki_doktorFromDoktor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_doktorFromDoktor" ON public.hasta USING btree ("DoktorID");


--
-- Name: fki_faturafromftrId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_faturafromftrId" ON public.hasta USING btree ("faturaID");


--
-- Name: fki_ilacFRomIlac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ilacFRomIlac" ON public."ilacVeMalzeme" USING btree ("ilacID");


--
-- Name: fki_ilacFromIlac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ilacFromIlac" ON public."receteIlac" USING btree ("ilacID");


--
-- Name: fki_malzemeFrommalzeme; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_malzemeFrommalzeme" ON public."ilacVeMalzeme" USING btree ("malzemeID");


--
-- Name: fki_meslekFromGorevliler; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_meslekFromGorevliler" ON public.gorevli USING btree ("gorevliMeslekID");


--
-- Name: fki_receteFromRecete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_receteFromRecete" ON public.hasta USING btree ("receteID");


--
-- Name: fki_refakatciKisi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_refakatciKisi" ON public.hasta USING btree ("refakatciID");


--
-- Name: fki_stokFromStok; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_stokFromStok" ON public.departman USING btree (stok);


--
-- Name: fki_stokFromstok; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_stokFromstok" ON public."ilacVeMalzeme" USING btree ("stokID");


--
-- Name: hasta anketFromMemnuniyet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "anketFromMemnuniyet" FOREIGN KEY ("anketID") REFERENCES public."MemnuniyetAnketi"(id) NOT VALID;


--
-- Name: doktor departmanIsim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "departmanIsim" FOREIGN KEY ("departmanID") REFERENCES public.departman(id) NOT VALID;


--
-- Name: hemsire departmanIsimfromdepartman; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemsire
    ADD CONSTRAINT "departmanIsimfromdepartman" FOREIGN KEY ("departmanID") REFERENCES public.departman(id) NOT VALID;


--
-- Name: hasta doktorFromDoktor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "doktorFromDoktor" FOREIGN KEY ("DoktorID") REFERENCES public.doktor("personelNo") NOT VALID;


--
-- Name: doktor doktorPersonel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "doktorPersonel" FOREIGN KEY ("personelNo") REFERENCES public.personel("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hasta faturafromftrId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "faturafromftrId" FOREIGN KEY ("faturaID") REFERENCES public.fatura(id) NOT VALID;


--
-- Name: gorevli gorevliPersonel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorevli
    ADD CONSTRAINT "gorevliPersonel" FOREIGN KEY ("personelNo") REFERENCES public.personel("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hemsire hemsirePersonel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemsire
    ADD CONSTRAINT "hemsirePersonel" FOREIGN KEY ("personelNo") REFERENCES public.personel("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ilacVeMalzeme ilacFRomIlac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacVeMalzeme"
    ADD CONSTRAINT "ilacFRomIlac" FOREIGN KEY ("ilacID") REFERENCES public.ilac(id) NOT VALID;


--
-- Name: receteIlac ilacFromIlac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."receteIlac"
    ADD CONSTRAINT "ilacFromIlac" FOREIGN KEY ("ilacID") REFERENCES public.ilac(id) NOT VALID;


--
-- Name: ilacVeMalzeme malzemeFrommalzeme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacVeMalzeme"
    ADD CONSTRAINT "malzemeFrommalzeme" FOREIGN KEY ("malzemeID") REFERENCES public."Malzeme"(id) NOT VALID;


--
-- Name: gorevli meslekFromGorevliler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorevli
    ADD CONSTRAINT "meslekFromGorevliler" FOREIGN KEY ("gorevliMeslekID") REFERENCES public.gorevliler(id) NOT VALID;


--
-- Name: hasta receteFromRecete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "receteFromRecete" FOREIGN KEY ("receteID") REFERENCES public.recete(id) NOT VALID;


--
-- Name: receteIlac receteFromRecete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."receteIlac"
    ADD CONSTRAINT "receteFromRecete" FOREIGN KEY ("receteID") REFERENCES public.recete(id) NOT VALID;


--
-- Name: hasta refakatciKisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "refakatciKisi" FOREIGN KEY ("refakatciID") REFERENCES public.refakatci(id) NOT VALID;


--
-- Name: departman stokFromStok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departman
    ADD CONSTRAINT "stokFromStok" FOREIGN KEY (stok) REFERENCES public.stok(id) NOT VALID;


--
-- Name: ilacVeMalzeme stokFromstok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacVeMalzeme"
    ADD CONSTRAINT "stokFromstok" FOREIGN KEY ("stokID") REFERENCES public.stok(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

