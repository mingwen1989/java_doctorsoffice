--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE doctors (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    specialty character varying
);


ALTER TABLE doctors OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    birthdate character varying,
    doctorid integer
);


ALTER TABLE patients OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY doctors (id, first_name, last_name, specialty) FROM stdin;
1	Alex	Smith	Pediatrics
2	Lucas	Jones	Dermatology
3	Lisa	Arthur	Optometry
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('doctors_id_seq', 3, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patients (id, first_name, last_name, birthdate, doctorid) FROM stdin;
1	John	Doe	1985-05-06	1
4	Margret	Ann	1974-08-12	3
2	Randel	Cobb	1995-03-21	2
3	Mourice	Jean-Lucas	1987-07-05	1
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patients_id_seq', 4, true);


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

