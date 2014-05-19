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
-- Name: clinic; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA clinic;


ALTER SCHEMA clinic OWNER TO postgres;

SET search_path = clinic, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE doctors (
    name character varying(80),
    first_name character varying(80),
    last_name character varying(80),
    profession character varying(80),
    location character varying(80),
    email character varying(80),
    id integer NOT NULL,
    password character varying(80),
    profile_picture text,
    remember_token character varying(100),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE clinic.doctors OWNER TO postgres;

--
-- Name: doctors_doc_id_seq; Type: SEQUENCE; Schema: clinic; Owner: postgres
--

CREATE SEQUENCE doctors_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clinic.doctors_doc_id_seq OWNER TO postgres;

--
-- Name: doctors_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: clinic; Owner: postgres
--

ALTER SEQUENCE doctors_doc_id_seq OWNED BY doctors.id;


--
-- Name: medical_images; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE medical_images (
    medical_image_id character varying(80) NOT NULL,
    medical_image bytea
);


ALTER TABLE clinic.medical_images OWNER TO postgres;

--
-- Name: nurses; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE nurses (
    fingerprint_hash character varying(80) NOT NULL,
    name character varying(80) NOT NULL,
    village character varying(80) NOT NULL,
    dob date NOT NULL,
    gender public.gender NOT NULL,
    id_photo bytea
);


ALTER TABLE clinic.nurses OWNER TO postgres;

--
-- Name: patients; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE patients (
    name character varying(80),
    dob date,
    id_photo bytea,
    village character varying(80),
    fingerprint_hash character varying(80),
    ethnicity character varying(80),
    gender public.gender,
    pex_condition public.pex_condition[],
    first_name character varying(80),
    last_name character varying(80),
    id integer NOT NULL,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    last_visit timestamp without time zone,
    pending_visit boolean
);


ALTER TABLE clinic.patients OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: clinic; Owner: postgres
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clinic.patients_id_seq OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: clinic; Owner: postgres
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: resp_sounds; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE resp_sounds (
    resp_id character varying(80) NOT NULL,
    resp_sound bytea
);


ALTER TABLE clinic.resp_sounds OWNER TO postgres;

--
-- Name: visits; Type: TABLE; Schema: clinic; Owner: postgres; Tablespace: 
--

CREATE TABLE visits (
    visit_date date NOT NULL,
    nurse_fingerprint character varying(80) NOT NULL,
    patient_fingerprint character varying(80) NOT NULL,
    doctor_id integer,
    weight numeric,
    height numeric,
    bp_systolic integer,
    bp_diastolic integer,
    pulse_rate integer,
    resp_id character varying(80),
    blood_glucose numeric,
    id integer NOT NULL,
    patient_id integer,
    doc_diagnosis text,
    doc_treatment text,
    doc_remark text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image_id character varying(80)
);


ALTER TABLE clinic.visits OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: clinic; Owner: postgres
--

CREATE SEQUENCE visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clinic.visits_id_seq OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: clinic; Owner: postgres
--

ALTER SEQUENCE visits_id_seq OWNED BY visits.id;


--
-- Name: id; Type: DEFAULT; Schema: clinic; Owner: postgres
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_doc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clinic; Owner: postgres
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: clinic; Owner: postgres
--

ALTER TABLE ONLY visits ALTER COLUMN id SET DEFAULT nextval('visits_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY doctors (name, first_name, last_name, profession, location, email, id, password, profile_picture, remember_token, created_at, modified_at) FROM stdin;
\.


--
-- Name: doctors_doc_id_seq; Type: SEQUENCE SET; Schema: clinic; Owner: postgres
--

SELECT pg_catalog.setval('doctors_doc_id_seq', 3, true);


--
-- Data for Name: medical_images; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY medical_images (medical_image_id, medical_image) FROM stdin;
\.


--
-- Data for Name: nurses; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY nurses (fingerprint_hash, name, village, dob, gender, id_photo) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY patients (name, dob, id_photo, village, fingerprint_hash, ethnicity, gender, pex_condition, first_name, last_name, id, created_at, modified_at, last_visit, pending_visit) FROM stdin;
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: clinic; Owner: postgres
--

SELECT pg_catalog.setval('patients_id_seq', 16, true);


--
-- Data for Name: resp_sounds; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY resp_sounds (resp_id, resp_sound) FROM stdin;
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: clinic; Owner: postgres
--

COPY visits (visit_date, nurse_fingerprint, patient_fingerprint, doctor_id, weight, height, bp_systolic, bp_diastolic, pulse_rate, resp_id, blood_glucose, id, patient_id, doc_diagnosis, doc_treatment, doc_remark, created_at, updated_at, image_id) FROM stdin;
\.


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: clinic; Owner: postgres
--

SELECT pg_catalog.setval('visits_id_seq', 1, false);


--
-- Name: medical_images_pkey; Type: CONSTRAINT; Schema: clinic; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medical_images
    ADD CONSTRAINT medical_images_pkey PRIMARY KEY (medical_image_id);


--
-- Name: nurses_pkey; Type: CONSTRAINT; Schema: clinic; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nurses
    ADD CONSTRAINT nurses_pkey PRIMARY KEY (fingerprint_hash);


--
-- Name: respiratorsounds_pkey; Type: CONSTRAINT; Schema: clinic; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resp_sounds
    ADD CONSTRAINT respiratorsounds_pkey PRIMARY KEY (resp_id);


--
-- PostgreSQL database dump complete
--

