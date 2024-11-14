--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-14 15:11:19

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
-- TOC entry 216 (class 1259 OID 16497)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    account_id integer NOT NULL,
    balanse integer NOT NULL,
    currency_type character varying NOT NULL,
    account_type character varying NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16504)
-- Name: account_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_access (
    table_id integer NOT NULL,
    client_id integer NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.account_access OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16490)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16519)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    date date NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 16497)
-- Dependencies: 216
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (account_id, balanse, currency_type, account_type, owner_id) FROM stdin;
1	0	uah	personal	3
2	0	uah	corporative	1
\.


--
-- TOC entry 4857 (class 0 OID 16504)
-- Dependencies: 217
-- Data for Name: account_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_access (table_id, client_id, account_id) FROM stdin;
1	1	2
2	2	2
3	3	1
\.


--
-- TOC entry 4855 (class 0 OID 16490)
-- Dependencies: 215
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, name, phone) FROM stdin;
1	John	+380000000000
2	Doe	+380000000001
3	Ostap	+380000000002
\.


--
-- TOC entry 4858 (class 0 OID 16519)
-- Dependencies: 218
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (transaction_id, date, sender_id, receiver_id, amount) FROM stdin;
1	2024-11-13	1	2	100
\.


--
-- TOC entry 4702 (class 2606 OID 16503)
-- Name: account account_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pk PRIMARY KEY (account_id);


--
-- TOC entry 4700 (class 2606 OID 16496)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);


--
-- TOC entry 4704 (class 2606 OID 16508)
-- Name: account_access table_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_access
    ADD CONSTRAINT table_pk PRIMARY KEY (table_id);


--
-- TOC entry 4706 (class 2606 OID 16523)
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (transaction_id);


--
-- TOC entry 4708 (class 2606 OID 16514)
-- Name: account_access account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_access
    ADD CONSTRAINT account_id FOREIGN KEY (account_id) REFERENCES public.account(account_id);


--
-- TOC entry 4709 (class 2606 OID 16509)
-- Name: account_access client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_access
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 4707 (class 2606 OID 16547)
-- Name: account owner_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT owner_pk FOREIGN KEY (owner_id) REFERENCES public.client(client_id);


--
-- TOC entry 4710 (class 2606 OID 16529)
-- Name: transaction receiver_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT receiver_fk FOREIGN KEY (receiver_id) REFERENCES public.account(account_id);


--
-- TOC entry 4711 (class 2606 OID 16524)
-- Name: transaction sender_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT sender_fk FOREIGN KEY (sender_id) REFERENCES public.account(account_id);


-- Completed on 2024-11-14 15:11:19

--
-- PostgreSQL database dump complete
--

