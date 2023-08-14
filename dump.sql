--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL,
    icon text NOT NULL
);


--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pictures (
    id integer NOT NULL,
    "createdBy" integer NOT NULL,
    url text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "pictureMain" integer,
    price integer NOT NULL,
    "createdBy" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now(),
    available boolean DEFAULT true NOT NULL,
    "categoryId" integer NOT NULL
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    phone text NOT NULL,
    city text NOT NULL,
    cpf text NOT NULL,
    zipcode text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now(),
    picture text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: pictures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'Assistência técnica', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/assistencia-tecnica.svg');
INSERT INTO public.category VALUES (2, 'Aulas', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/aulas.svg');
INSERT INTO public.category VALUES (3, 'Autos', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/autos.svg');
INSERT INTO public.category VALUES (4, 'Consultoria', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/consultoria.svg');
INSERT INTO public.category VALUES (5, 'Design e Tecnologia', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/design-e-tecnologia.svg');
INSERT INTO public.category VALUES (6, 'Eventos', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/eventos.svg');
INSERT INTO public.category VALUES (7, 'Moda e beleza', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/moda-e-beleza.svg');
INSERT INTO public.category VALUES (8, 'Reformas e reparos', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/reformas-e-reparos.svg');
INSERT INTO public.category VALUES (9, 'Saúde', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/saude.svg');
INSERT INTO public.category VALUES (10, 'Serviços Domésticos', 'https://site-clientes-assets.getninjas.com.br/images/home/categories/servicos-domesticos.svg');


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pictures VALUES (12, 13, 'https://imgs.search.brave.com/LwDQWoehw2Gk_SAaCOBrMTVb7yzrHV5DzfRiTFbYY7U/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbml5/dWtpLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMS8wOC9h/bml5dWtpLXJvcm9u/b2Etem9yby04NS0x/MDI0eDU3My5qcGc', '2023-08-13 21:06:57.960797');
INSERT INTO public.pictures VALUES (13, 14, 'https://imgs.search.brave.com/LwDQWoehw2Gk_SAaCOBrMTVb7yzrHV5DzfRiTFbYY7U/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbml5/dWtpLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMS8wOC9h/bml5dWtpLXJvcm9u/b2Etem9yby04NS0x/MDI0eDU3My5qcGc', '2023-08-14 11:31:36.519263');
INSERT INTO public.pictures VALUES (14, 15, 'https://imgs.search.brave.com/oEzdpXsw1XY4plNjkOy1TliKl-glzO5rYOvZz1py38k/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA1LzY2LzcyLzE1/LzM2MF9GXzU2Njcy/MTU1N19zdnl3ZVpO/OG41YWJJQjZqeU9x/Rlhtc0puYnF1NXJs/OS5qcGc', '2023-08-14 12:23:32.982715');
INSERT INTO public.pictures VALUES (15, 16, 'https://imgs.search.brave.com/oEzdpXsw1XY4plNjkOy1TliKl-glzO5rYOvZz1py38k/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA1LzY2LzcyLzE1/LzM2MF9GXzU2Njcy/MTU1N19zdnl3ZVpO/OG41YWJJQjZqeU9x/Rlhtc0puYnF1NXJs/OS5qcGc', '2023-08-14 12:23:57.805926');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services VALUES (14, 'nome 3', 'descrição 3', 13, 300, 4, '2023-08-14 11:31:36.515849-03', true, 4);
INSERT INTO public.services VALUES (15, 'will name 1', 'descrição 1', 14, 100, 5, '2023-08-14 12:23:32.963677-03', true, 6);
INSERT INTO public.services VALUES (16, 'will name 3', 'descrição 3', 15, 200, 5, '2023-08-14 12:23:57.788441-03', false, 9);
INSERT INTO public.services VALUES (13, 'teste2', 'descrição 2', 12, 150, 4, '2023-08-13 21:06:57.955496-03', false, 2);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (4, 'Willyan Almeida', 'willy@willy.com.br', '$2b$10$A8UWtoWhHwl8CP1QU/BRp.pYoPPcd2uYUvtH97XPdsdHThmr/5n9O', '71991137877', 'Salvador', '06598844533', '40455160', '2023-08-13 19:28:41.962478-03', 'https://imgs.search.brave.com/LwDQWoehw2Gk_SAaCOBrMTVb7yzrHV5DzfRiTFbYY7U/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9hbml5/dWtpLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMS8wOC9h/bml5dWtpLXJvcm9u/b2Etem9yby04NS0x/MDI0eDU3My5qcGc');
INSERT INTO public.users VALUES (5, 'will', 'will@will.com.br', '$2b$10$Rz7Xbhnn0M2RPjxqo1jv3.8bKh.SojZ3IMKJh2ulzW9LvoCJc9jma', '71991807352', 'Salvador', '55404430559', '40455160', '2023-08-14 12:22:32.239307-03', 'https://imgs.search.brave.com/oEzdpXsw1XY4plNjkOy1TliKl-glzO5rYOvZz1py38k/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA1LzY2LzcyLzE1/LzM2MF9GXzU2Njcy/MTU1N19zdnl3ZVpO/OG41YWJJQjZqeU9x/Rlhtc0puYnF1NXJs/OS5qcGc');


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pictures_id_seq', 15, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: pictures pictures_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pk PRIMARY KEY (id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pk PRIMARY KEY (id);


--
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: pictures pictures_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_fk0 FOREIGN KEY ("createdBy") REFERENCES public.services(id);


--
-- Name: services services_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_fk0 FOREIGN KEY ("pictureMain") REFERENCES public.pictures(id);


--
-- Name: services services_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_fk1 FOREIGN KEY ("createdBy") REFERENCES public.users(id);


--
-- Name: services services_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_fk2 FOREIGN KEY ("categoryId") REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

