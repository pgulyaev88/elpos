--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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

--
-- Name: DBRUTTO; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DBRUTTO" AS double precision;


ALTER DOMAIN public."DBRUTTO" OWNER TO fcc;

--
-- Name: DCODE; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DCODE" AS integer;


ALTER DOMAIN public."DCODE" OWNER TO fcc;

--
-- Name: DCOLOR; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DCOLOR" AS character(6);


ALTER DOMAIN public."DCOLOR" OWNER TO fcc;

--
-- Name: DCOUNT; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DCOUNT" AS integer;


ALTER DOMAIN public."DCOUNT" OWNER TO fcc;

--
-- Name: DDATE; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DDATE" AS date;


ALTER DOMAIN public."DDATE" OWNER TO fcc;

--
-- Name: DDELETED; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DDELETED" AS boolean;


ALTER DOMAIN public."DDELETED" OWNER TO fcc;

--
-- Name: DID; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DID" AS integer;


ALTER DOMAIN public."DID" OWNER TO fcc;

--
-- Name: DIP; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DIP" AS character(15);


ALTER DOMAIN public."DIP" OWNER TO fcc;

--
-- Name: DNAME; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DNAME" AS character varying(255);


ALTER DOMAIN public."DNAME" OWNER TO fcc;

--
-- Name: DNETTO; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DNETTO" AS double precision;


ALTER DOMAIN public."DNETTO" OWNER TO fcc;

--
-- Name: DNUM; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DNUM" AS numeric(3,2);


ALTER DOMAIN public."DNUM" OWNER TO fcc;

--
-- Name: DPARAM; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DPARAM" AS boolean;


ALTER DOMAIN public."DPARAM" OWNER TO fcc;

--
-- Name: DPERCENT; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DPERCENT" AS numeric(4,2);


ALTER DOMAIN public."DPERCENT" OWNER TO fcc;

--
-- Name: DTIME; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DTIME" AS time without time zone;


ALTER DOMAIN public."DTIME" OWNER TO fcc;

--
-- Name: DTIMESTAMP; Type: DOMAIN; Schema: public; Owner: fcc
--

CREATE DOMAIN "DTIMESTAMP" AS timestamp without time zone;


ALTER DOMAIN public."DTIMESTAMP" OWNER TO fcc;

--
-- Name: getResidues(integer); Type: FUNCTION; Schema: public; Owner: fcc
--

CREATE FUNCTION "getResidues"(userid integer) RETURNS TABLE(id integer, menuname "DNAME", username "DNAME", count "DCOUNT", counts "DCOUNT", lastupdate "DTIMESTAMP")
    LANGUAGE plpgsql
    AS $_$
DECLARE
userid ALIAS FOR $1;

BEGIN
PERFORM r.id AS id, m.name AS menuname, u.name AS username, r.count, r.counts, r.lastupdate
FROM residues r
LEFT JOIN menu m ON m.menu_id = r.menu_id
LEFT JOIN users u ON u.users_id = r.users_id
WHERE r.deleted='0'
AND u.deleted='0'
AND m.deleted='0'
AND r.users_id=userid;
END;
$_$;


ALTER FUNCTION public."getResidues"(userid integer) OWNER TO fcc;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dates; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE dates (
    dates_id integer NOT NULL,
    name "DNAME",
    visiable "DPARAM",
    deleted "DDELETED"
);


ALTER TABLE public.dates OWNER TO fcc;

--
-- Name: dates_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE dates_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_dates_id_seq OWNER TO fcc;

--
-- Name: dates_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE dates_dates_id_seq OWNED BY dates.dates_id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE menu (
    menu_id integer NOT NULL,
    type_id "DID",
    category_id "DID",
    code "DCODE",
    num "DNUM",
    name "DNAME",
    netto "DNETTO",
    percent "DPERCENT",
    deleted "DDELETED"
);
ALTER TABLE ONLY menu ALTER COLUMN menu_id SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN type_id SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN category_id SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN code SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN num SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN netto SET STATISTICS 0;
ALTER TABLE ONLY menu ALTER COLUMN percent SET STATISTICS 0;


ALTER TABLE public.menu OWNER TO fcc;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO fcc;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE menu_menu_id_seq OWNED BY menu.menu_id;


--
-- Name: menucategory; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE menucategory (
    category_id integer NOT NULL,
    category_code "DCODE",
    category_name "DNAME",
    deleted "DDELETED"
);
ALTER TABLE ONLY menucategory ALTER COLUMN category_id SET STATISTICS 0;
ALTER TABLE ONLY menucategory ALTER COLUMN category_code SET STATISTICS 0;
ALTER TABLE ONLY menucategory ALTER COLUMN category_name SET STATISTICS 0;
ALTER TABLE ONLY menucategory ALTER COLUMN deleted SET STATISTICS 0;


ALTER TABLE public.menucategory OWNER TO fcc;

--
-- Name: menucategory_category_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE menucategory_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menucategory_category_id_seq OWNER TO fcc;

--
-- Name: menucategory_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE menucategory_category_id_seq OWNED BY menucategory.category_id;


--
-- Name: menutype; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE menutype (
    type_id integer NOT NULL,
    type_name "DNAME",
    deleted "DDELETED"
);
ALTER TABLE ONLY menutype ALTER COLUMN deleted SET STATISTICS 0;


ALTER TABLE public.menutype OWNER TO fcc;

--
-- Name: menutype_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE menutype_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menutype_type_id_seq OWNER TO fcc;

--
-- Name: menutype_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE menutype_type_id_seq OWNED BY menutype.type_id;


--
-- Name: prepare; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE prepare (
    prepare_id integer NOT NULL,
    users_id "DID",
    dates_id "DID",
    times_id "DID",
    delivery "DCOUNT",
    takeaway "DCOUNT"
);
ALTER TABLE ONLY prepare ALTER COLUMN times_id SET STATISTICS 0;
ALTER TABLE ONLY prepare ALTER COLUMN delivery SET STATISTICS 0;
ALTER TABLE ONLY prepare ALTER COLUMN takeaway SET STATISTICS 0;


ALTER TABLE public.prepare OWNER TO fcc;

--
-- Name: prepare2; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE prepare2 (
    prepare_id integer NOT NULL,
    users_id "DID",
    dates_id "DID",
    times_id "DID",
    delivery "DCOUNT",
    takeaway "DCOUNT"
);
ALTER TABLE ONLY prepare2 ALTER COLUMN times_id SET STATISTICS 0;
ALTER TABLE ONLY prepare2 ALTER COLUMN delivery SET STATISTICS 0;
ALTER TABLE ONLY prepare2 ALTER COLUMN takeaway SET STATISTICS 0;


ALTER TABLE public.prepare2 OWNER TO fcc;

--
-- Name: prepare2_prepare_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE prepare2_prepare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prepare2_prepare_id_seq OWNER TO fcc;

--
-- Name: prepare2_prepare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE prepare2_prepare_id_seq OWNED BY prepare2.prepare_id;


--
-- Name: prepare_prepare_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE prepare_prepare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prepare_prepare_id_seq OWNER TO fcc;

--
-- Name: prepare_prepare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE prepare_prepare_id_seq OWNED BY prepare.prepare_id;


--
-- Name: residues; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE residues (
    id integer NOT NULL,
    menu_id "DID",
    users_id "DID",
    count "DCOUNT",
    counts "DCOUNT",
    order_count "DCOUNT",
    lastupdate "DTIMESTAMP" DEFAULT now(),
    deleted "DDELETED"
);
ALTER TABLE ONLY residues ALTER COLUMN menu_id SET STATISTICS 0;
ALTER TABLE ONLY residues ALTER COLUMN users_id SET STATISTICS 0;
ALTER TABLE ONLY residues ALTER COLUMN count SET STATISTICS 0;
ALTER TABLE ONLY residues ALTER COLUMN counts SET STATISTICS 0;
ALTER TABLE ONLY residues ALTER COLUMN order_count SET STATISTICS 0;
ALTER TABLE ONLY residues ALTER COLUMN lastupdate SET STATISTICS 0;


ALTER TABLE public.residues OWNER TO fcc;

--
-- Name: residues_residues_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE residues_residues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.residues_residues_id_seq OWNER TO fcc;

--
-- Name: residues_residues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE residues_residues_id_seq OWNED BY residues.id;


--
-- Name: rights; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE rights (
    rights_id integer NOT NULL,
    name "DNAME",
    deleted "DDELETED"
);


ALTER TABLE public.rights OWNER TO fcc;

--
-- Name: rights_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE rights_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rights_rights_id_seq OWNER TO fcc;

--
-- Name: rights_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE rights_rights_id_seq OWNED BY rights.rights_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE roles (
    roles_id integer NOT NULL,
    name "DNAME",
    deleted "DDELETED"
);


ALTER TABLE public.roles OWNER TO fcc;

--
-- Name: roles_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE roles_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_roles_id_seq OWNER TO fcc;

--
-- Name: roles_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE roles_roles_id_seq OWNED BY roles.roles_id;


--
-- Name: rolesrights; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE rolesrights (
    rolesrights_id integer NOT NULL,
    roles_id "DID",
    rights_id "DID",
    param "DPARAM",
    deleted "DDELETED"
);
ALTER TABLE ONLY rolesrights ALTER COLUMN roles_id SET STATISTICS 0;
ALTER TABLE ONLY rolesrights ALTER COLUMN rights_id SET STATISTICS 0;
ALTER TABLE ONLY rolesrights ALTER COLUMN param SET STATISTICS 0;
ALTER TABLE ONLY rolesrights ALTER COLUMN deleted SET STATISTICS 0;


ALTER TABLE public.rolesrights OWNER TO fcc;

--
-- Name: rolesrights_rolesrights_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE rolesrights_rolesrights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rolesrights_rolesrights_id_seq OWNER TO fcc;

--
-- Name: rolesrights_rolesrights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE rolesrights_rolesrights_id_seq OWNED BY rolesrights.rolesrights_id;


--
-- Name: times; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE times (
    times_id integer NOT NULL,
    name "DNAME",
    visiable "DPARAM",
    deleted "DDELETED"
);


ALTER TABLE public.times OWNER TO fcc;

--
-- Name: times_times_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE times_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.times_times_id_seq OWNER TO fcc;

--
-- Name: times_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE times_times_id_seq OWNED BY times.times_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: fcc; Tablespace: 
--

CREATE TABLE users (
    users_id integer NOT NULL,
    roles_id "DID",
    name "DNAME",
    remote_ip "DIP",
    local_ip "DIP",
    cash_ip "DIP",
    sales_date "DDATE",
    color "DCOLOR",
    deleted "DDELETED"
);


ALTER TABLE public.users OWNER TO fcc;

--
-- Name: users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: fcc
--

CREATE SEQUENCE users_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_users_id_seq OWNER TO fcc;

--
-- Name: users_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fcc
--

ALTER SEQUENCE users_users_id_seq OWNED BY users.users_id;


--
-- Name: dates_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY dates ALTER COLUMN dates_id SET DEFAULT nextval('dates_dates_id_seq'::regclass);


--
-- Name: menu_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY menu ALTER COLUMN menu_id SET DEFAULT nextval('menu_menu_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY menucategory ALTER COLUMN category_id SET DEFAULT nextval('menucategory_category_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY menutype ALTER COLUMN type_id SET DEFAULT nextval('menutype_type_id_seq'::regclass);


--
-- Name: prepare_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY prepare ALTER COLUMN prepare_id SET DEFAULT nextval('prepare_prepare_id_seq'::regclass);


--
-- Name: prepare_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY prepare2 ALTER COLUMN prepare_id SET DEFAULT nextval('prepare2_prepare_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY residues ALTER COLUMN id SET DEFAULT nextval('residues_residues_id_seq'::regclass);


--
-- Name: rights_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY rights ALTER COLUMN rights_id SET DEFAULT nextval('rights_rights_id_seq'::regclass);


--
-- Name: roles_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY roles ALTER COLUMN roles_id SET DEFAULT nextval('roles_roles_id_seq'::regclass);


--
-- Name: rolesrights_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY rolesrights ALTER COLUMN rolesrights_id SET DEFAULT nextval('rolesrights_rolesrights_id_seq'::regclass);


--
-- Name: times_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY times ALTER COLUMN times_id SET DEFAULT nextval('times_times_id_seq'::regclass);


--
-- Name: users_id; Type: DEFAULT; Schema: public; Owner: fcc
--

ALTER TABLE ONLY users ALTER COLUMN users_id SET DEFAULT nextval('users_users_id_seq'::regclass);


--
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO dates VALUES (1, '2013.03.07', true, false);
INSERT INTO dates VALUES (2, '2013.03.08', true, false);


--
-- Name: dates_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('dates_dates_id_seq', 2, true);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO menu VALUES (1, 1, 4, 1, 2.10, 'Лапша Удон с курицей с индийским орехом', 1, 1.00, false);


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('menu_menu_id_seq', 1, true);


--
-- Data for Name: menucategory; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO menucategory VALUES (4, 1, 'Макарики', false);


--
-- Name: menucategory_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('menucategory_category_id_seq', 4, true);


--
-- Data for Name: menutype; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO menutype VALUES (1, 'Блюдо', false);


--
-- Name: menutype_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('menutype_type_id_seq', 1, true);


--
-- Data for Name: prepare; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO prepare VALUES (186, 3, 1, 1, 1, 1);
INSERT INTO prepare VALUES (188, 3, 1, 4, 1, 1);
INSERT INTO prepare VALUES (187, 3, 1, 2, 1, 1);
INSERT INTO prepare VALUES (189, 3, 1, 5, 1, 1);
INSERT INTO prepare VALUES (190, 3, 1, 6, 1, 1);
INSERT INTO prepare VALUES (191, 3, 1, 7, 1, 1);
INSERT INTO prepare VALUES (192, 3, 1, 8, 1, 1);
INSERT INTO prepare VALUES (193, 3, 1, 9, 1, 1);
INSERT INTO prepare VALUES (194, 3, 1, 10, 1, 1);
INSERT INTO prepare VALUES (195, 3, 1, 11, 1, 1);
INSERT INTO prepare VALUES (196, 3, 1, 12, 1, 1);
INSERT INTO prepare VALUES (197, 3, 1, 13, 1, 1);
INSERT INTO prepare VALUES (198, 3, 1, 14, 1, 1);
INSERT INTO prepare VALUES (199, 3, 1, 15, 1, 1);
INSERT INTO prepare VALUES (200, 3, 1, 16, 1, 1);
INSERT INTO prepare VALUES (201, 3, 1, 17, 1, 1);
INSERT INTO prepare VALUES (202, 3, 1, 18, 1, 1);
INSERT INTO prepare VALUES (203, 3, 1, 19, 1, 1);
INSERT INTO prepare VALUES (204, 3, 1, 20, 1, 1);
INSERT INTO prepare VALUES (205, 3, 1, 21, 1, 1);
INSERT INTO prepare VALUES (206, 3, 1, 22, 1, 1);
INSERT INTO prepare VALUES (207, 3, 1, 23, 1, 1);
INSERT INTO prepare VALUES (208, 3, 1, 24, 1, 1);
INSERT INTO prepare VALUES (209, 3, 1, 25, 1, 1);
INSERT INTO prepare VALUES (210, 3, 1, 26, 1, 1);
INSERT INTO prepare VALUES (211, 3, 1, 27, 1, 1);
INSERT INTO prepare VALUES (212, 4, 1, 1, 1, 1);
INSERT INTO prepare VALUES (213, 4, 1, 2, 1, 1);
INSERT INTO prepare VALUES (214, 4, 1, 4, 1, 1);
INSERT INTO prepare VALUES (215, 4, 1, 5, 1, 1);
INSERT INTO prepare VALUES (216, 4, 1, 6, 1, 1);
INSERT INTO prepare VALUES (217, 4, 1, 7, 1, 1);
INSERT INTO prepare VALUES (218, 4, 1, 8, 1, 1);
INSERT INTO prepare VALUES (219, 4, 1, 9, 1, 1);
INSERT INTO prepare VALUES (220, 4, 1, 10, 1, 1);
INSERT INTO prepare VALUES (221, 4, 1, 11, 1, 1);
INSERT INTO prepare VALUES (222, 4, 1, 12, 1, 1);
INSERT INTO prepare VALUES (223, 4, 1, 13, 1, 1);
INSERT INTO prepare VALUES (224, 4, 1, 14, 1, 1);
INSERT INTO prepare VALUES (225, 4, 1, 15, 1, 1);
INSERT INTO prepare VALUES (226, 4, 1, 16, 1, 1);
INSERT INTO prepare VALUES (227, 4, 1, 17, 1, 1);
INSERT INTO prepare VALUES (228, 4, 1, 18, 1, 1);
INSERT INTO prepare VALUES (229, 4, 1, 19, 1, 1);
INSERT INTO prepare VALUES (230, 4, 1, 20, 1, 1);
INSERT INTO prepare VALUES (231, 4, 1, 21, 1, 1);
INSERT INTO prepare VALUES (232, 4, 1, 22, 1, 1);
INSERT INTO prepare VALUES (233, 4, 1, 23, 1, 1);
INSERT INTO prepare VALUES (234, 4, 1, 24, 1, 1);
INSERT INTO prepare VALUES (235, 4, 1, 25, 1, 1);
INSERT INTO prepare VALUES (236, 4, 1, 26, 1, 1);
INSERT INTO prepare VALUES (237, 4, 1, 27, 1, 1);
INSERT INTO prepare VALUES (238, 5, 1, 1, 1, 1);
INSERT INTO prepare VALUES (239, 5, 1, 2, 1, 1);
INSERT INTO prepare VALUES (240, 5, 1, 4, 1, 1);
INSERT INTO prepare VALUES (241, 5, 1, 5, 1, 1);
INSERT INTO prepare VALUES (242, 5, 1, 6, 1, 1);
INSERT INTO prepare VALUES (243, 5, 1, 7, 1, 1);
INSERT INTO prepare VALUES (244, 5, 1, 8, 1, 1);
INSERT INTO prepare VALUES (245, 5, 1, 9, 1, 1);
INSERT INTO prepare VALUES (246, 5, 1, 10, 1, 1);
INSERT INTO prepare VALUES (247, 5, 1, 11, 1, 1);
INSERT INTO prepare VALUES (248, 5, 1, 12, 1, 1);
INSERT INTO prepare VALUES (249, 5, 1, 13, 1, 1);
INSERT INTO prepare VALUES (250, 5, 1, 14, 1, 1);
INSERT INTO prepare VALUES (251, 5, 1, 15, 1, 1);
INSERT INTO prepare VALUES (252, 5, 1, 16, 1, 1);
INSERT INTO prepare VALUES (253, 5, 1, 17, 1, 1);
INSERT INTO prepare VALUES (254, 5, 1, 18, 1, 1);
INSERT INTO prepare VALUES (255, 5, 1, 19, 1, 1);
INSERT INTO prepare VALUES (256, 5, 1, 20, 1, 1);
INSERT INTO prepare VALUES (257, 5, 1, 21, 1, 1);
INSERT INTO prepare VALUES (258, 5, 1, 22, 1, 1);
INSERT INTO prepare VALUES (259, 5, 1, 23, 1, 1);
INSERT INTO prepare VALUES (260, 5, 1, 24, 1, 1);
INSERT INTO prepare VALUES (261, 5, 1, 25, 1, 1);
INSERT INTO prepare VALUES (262, 5, 1, 26, 1, 1);
INSERT INTO prepare VALUES (263, 5, 1, 27, 1, 1);
INSERT INTO prepare VALUES (264, 6, 1, 1, 1, 1);
INSERT INTO prepare VALUES (265, 6, 1, 2, 1, 1);
INSERT INTO prepare VALUES (266, 6, 1, 4, 1, 1);
INSERT INTO prepare VALUES (267, 6, 1, 5, 1, 1);
INSERT INTO prepare VALUES (268, 6, 1, 6, 1, 1);
INSERT INTO prepare VALUES (269, 6, 1, 7, 1, 1);
INSERT INTO prepare VALUES (270, 6, 1, 8, 1, 1);
INSERT INTO prepare VALUES (271, 6, 1, 9, 1, 1);
INSERT INTO prepare VALUES (272, 6, 1, 10, 1, 1);
INSERT INTO prepare VALUES (273, 6, 1, 11, 1, 1);
INSERT INTO prepare VALUES (274, 6, 1, 12, 1, 1);
INSERT INTO prepare VALUES (275, 6, 1, 13, 1, 1);
INSERT INTO prepare VALUES (276, 6, 1, 14, 1, 1);
INSERT INTO prepare VALUES (277, 6, 1, 15, 1, 1);
INSERT INTO prepare VALUES (278, 6, 1, 16, 1, 1);
INSERT INTO prepare VALUES (279, 6, 1, 17, 1, 1);
INSERT INTO prepare VALUES (280, 6, 1, 18, 1, 1);
INSERT INTO prepare VALUES (281, 6, 1, 19, 1, 1);
INSERT INTO prepare VALUES (282, 6, 1, 20, 1, 1);
INSERT INTO prepare VALUES (283, 6, 1, 21, 1, 1);
INSERT INTO prepare VALUES (284, 6, 1, 22, 1, 1);
INSERT INTO prepare VALUES (285, 6, 1, 23, 1, 1);
INSERT INTO prepare VALUES (286, 6, 1, 24, 1, 1);
INSERT INTO prepare VALUES (287, 6, 1, 25, 1, 1);
INSERT INTO prepare VALUES (288, 6, 1, 26, 1, 1);
INSERT INTO prepare VALUES (289, 6, 1, 27, 1, 1);
INSERT INTO prepare VALUES (291, 7, 1, 2, 1, 1);
INSERT INTO prepare VALUES (292, 7, 1, 4, 1, 1);
INSERT INTO prepare VALUES (293, 7, 1, 5, 1, 1);
INSERT INTO prepare VALUES (294, 7, 1, 6, 1, 1);
INSERT INTO prepare VALUES (295, 7, 1, 7, 1, 1);
INSERT INTO prepare VALUES (296, 7, 1, 8, 1, 1);
INSERT INTO prepare VALUES (297, 7, 1, 9, 1, 1);
INSERT INTO prepare VALUES (298, 7, 1, 10, 1, 1);
INSERT INTO prepare VALUES (299, 7, 1, 11, 1, 1);
INSERT INTO prepare VALUES (300, 7, 1, 12, 1, 1);
INSERT INTO prepare VALUES (301, 7, 1, 13, 1, 1);
INSERT INTO prepare VALUES (302, 7, 1, 14, 1, 1);
INSERT INTO prepare VALUES (303, 7, 1, 15, 1, 1);
INSERT INTO prepare VALUES (304, 7, 1, 16, 1, 1);
INSERT INTO prepare VALUES (305, 7, 1, 17, 1, 1);
INSERT INTO prepare VALUES (306, 7, 1, 18, 1, 1);
INSERT INTO prepare VALUES (307, 7, 1, 19, 1, 1);
INSERT INTO prepare VALUES (308, 7, 1, 20, 1, 1);
INSERT INTO prepare VALUES (309, 7, 1, 21, 1, 1);
INSERT INTO prepare VALUES (310, 7, 1, 22, 1, 1);
INSERT INTO prepare VALUES (311, 7, 1, 23, 1, 1);
INSERT INTO prepare VALUES (312, 7, 1, 24, 1, 1);
INSERT INTO prepare VALUES (313, 7, 1, 25, 1, 1);
INSERT INTO prepare VALUES (314, 7, 1, 26, 1, 1);
INSERT INTO prepare VALUES (315, 7, 1, 27, 1, 1);
INSERT INTO prepare VALUES (316, 8, 1, 1, 1, 1);
INSERT INTO prepare VALUES (317, 8, 1, 2, 1, 1);
INSERT INTO prepare VALUES (318, 8, 1, 4, 1, 1);
INSERT INTO prepare VALUES (319, 8, 1, 5, 1, 1);
INSERT INTO prepare VALUES (320, 8, 1, 6, 1, 1);
INSERT INTO prepare VALUES (321, 8, 1, 7, 1, 1);
INSERT INTO prepare VALUES (322, 8, 1, 8, 1, 1);
INSERT INTO prepare VALUES (323, 8, 1, 9, 1, 1);
INSERT INTO prepare VALUES (324, 8, 1, 10, 1, 1);
INSERT INTO prepare VALUES (325, 8, 1, 11, 1, 1);
INSERT INTO prepare VALUES (326, 8, 1, 12, 1, 1);
INSERT INTO prepare VALUES (327, 8, 1, 13, 1, 1);
INSERT INTO prepare VALUES (328, 8, 1, 14, 1, 1);
INSERT INTO prepare VALUES (329, 8, 1, 15, 1, 1);
INSERT INTO prepare VALUES (330, 8, 1, 16, 1, 1);
INSERT INTO prepare VALUES (331, 8, 1, 17, 1, 1);
INSERT INTO prepare VALUES (332, 8, 1, 18, 1, 1);
INSERT INTO prepare VALUES (333, 8, 1, 19, 1, 1);
INSERT INTO prepare VALUES (334, 8, 1, 20, 1, 1);
INSERT INTO prepare VALUES (335, 8, 1, 21, 1, 1);
INSERT INTO prepare VALUES (336, 8, 1, 22, 1, 1);
INSERT INTO prepare VALUES (337, 8, 1, 23, 1, 1);
INSERT INTO prepare VALUES (338, 8, 1, 24, 1, 1);
INSERT INTO prepare VALUES (339, 8, 1, 25, 1, 1);
INSERT INTO prepare VALUES (340, 8, 1, 26, 1, 1);
INSERT INTO prepare VALUES (341, 8, 1, 27, 1, 1);
INSERT INTO prepare VALUES (290, 7, 1, 1, 2, 1);


--
-- Data for Name: prepare2; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO prepare2 VALUES (342, 3, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (343, 3, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (344, 3, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (345, 3, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (346, 3, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (347, 3, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (348, 3, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (349, 3, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (350, 3, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (351, 3, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (352, 3, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (353, 3, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (354, 3, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (355, 3, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (356, 3, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (357, 3, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (358, 3, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (359, 3, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (360, 3, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (361, 3, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (362, 3, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (363, 3, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (364, 3, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (365, 3, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (366, 3, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (367, 3, 2, 27, 1, 1);
INSERT INTO prepare2 VALUES (368, 4, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (369, 4, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (370, 4, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (371, 4, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (372, 4, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (373, 4, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (374, 4, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (375, 4, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (376, 4, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (377, 4, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (378, 4, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (379, 4, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (380, 4, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (381, 4, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (382, 4, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (383, 4, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (384, 4, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (385, 4, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (386, 4, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (387, 4, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (388, 4, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (389, 4, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (390, 4, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (391, 4, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (392, 4, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (393, 4, 2, 27, 1, 1);
INSERT INTO prepare2 VALUES (394, 5, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (395, 5, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (396, 5, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (397, 5, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (398, 5, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (399, 5, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (400, 5, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (401, 5, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (402, 5, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (403, 5, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (404, 5, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (405, 5, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (406, 5, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (407, 5, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (408, 5, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (409, 5, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (410, 5, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (411, 5, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (412, 5, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (413, 5, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (414, 5, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (415, 5, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (416, 5, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (417, 5, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (418, 5, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (419, 5, 2, 27, 1, 1);
INSERT INTO prepare2 VALUES (420, 6, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (421, 6, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (422, 6, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (423, 6, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (424, 6, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (425, 6, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (426, 6, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (427, 6, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (428, 6, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (429, 6, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (430, 6, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (431, 6, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (432, 6, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (433, 6, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (434, 6, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (435, 6, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (436, 6, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (437, 6, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (438, 6, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (439, 6, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (440, 6, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (441, 6, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (442, 6, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (443, 6, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (444, 6, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (445, 6, 2, 27, 1, 1);
INSERT INTO prepare2 VALUES (446, 7, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (447, 7, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (448, 7, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (449, 7, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (450, 7, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (451, 7, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (452, 7, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (453, 7, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (454, 7, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (455, 7, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (456, 7, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (457, 7, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (458, 7, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (459, 7, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (460, 7, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (461, 7, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (462, 7, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (463, 7, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (464, 7, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (465, 7, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (466, 7, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (467, 7, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (468, 7, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (469, 7, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (470, 7, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (471, 7, 2, 27, 1, 1);
INSERT INTO prepare2 VALUES (472, 8, 2, 1, 1, 1);
INSERT INTO prepare2 VALUES (473, 8, 2, 2, 1, 1);
INSERT INTO prepare2 VALUES (474, 8, 2, 4, 1, 1);
INSERT INTO prepare2 VALUES (475, 8, 2, 5, 1, 1);
INSERT INTO prepare2 VALUES (476, 8, 2, 6, 1, 1);
INSERT INTO prepare2 VALUES (477, 8, 2, 7, 1, 1);
INSERT INTO prepare2 VALUES (478, 8, 2, 8, 1, 1);
INSERT INTO prepare2 VALUES (479, 8, 2, 9, 1, 1);
INSERT INTO prepare2 VALUES (480, 8, 2, 10, 1, 1);
INSERT INTO prepare2 VALUES (481, 8, 2, 11, 1, 1);
INSERT INTO prepare2 VALUES (482, 8, 2, 12, 1, 1);
INSERT INTO prepare2 VALUES (483, 8, 2, 13, 1, 1);
INSERT INTO prepare2 VALUES (484, 8, 2, 14, 1, 1);
INSERT INTO prepare2 VALUES (485, 8, 2, 15, 1, 1);
INSERT INTO prepare2 VALUES (486, 8, 2, 16, 1, 1);
INSERT INTO prepare2 VALUES (487, 8, 2, 17, 1, 1);
INSERT INTO prepare2 VALUES (488, 8, 2, 18, 1, 1);
INSERT INTO prepare2 VALUES (489, 8, 2, 19, 1, 1);
INSERT INTO prepare2 VALUES (490, 8, 2, 20, 1, 1);
INSERT INTO prepare2 VALUES (491, 8, 2, 21, 1, 1);
INSERT INTO prepare2 VALUES (492, 8, 2, 22, 1, 1);
INSERT INTO prepare2 VALUES (493, 8, 2, 23, 1, 1);
INSERT INTO prepare2 VALUES (494, 8, 2, 24, 1, 1);
INSERT INTO prepare2 VALUES (495, 8, 2, 25, 1, 1);
INSERT INTO prepare2 VALUES (496, 8, 2, 26, 1, 1);
INSERT INTO prepare2 VALUES (497, 8, 2, 27, 1, 1);


--
-- Name: prepare2_prepare_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('prepare2_prepare_id_seq', 1, false);


--
-- Name: prepare_prepare_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('prepare_prepare_id_seq', 497, true);


--
-- Data for Name: residues; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO residues VALUES (1, 1, 1, 5, 2, NULL, '2013-03-04 12:53:11', false);


--
-- Name: residues_residues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('residues_residues_id_seq', 2, true);


--
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO rights VALUES (1, 'admin', false);
INSERT INTO rights VALUES (2, 'sales', false);


--
-- Name: rights_rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('rights_rights_id_seq', 3, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO roles VALUES (1, 'admin', false);


--
-- Name: roles_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('roles_roles_id_seq', 1, true);


--
-- Data for Name: rolesrights; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO rolesrights VALUES (1, 1, 1, true, false);


--
-- Name: rolesrights_rolesrights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('rolesrights_rolesrights_id_seq', 1, true);


--
-- Data for Name: times; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO times VALUES (1, '11:00', true, false);
INSERT INTO times VALUES (2, '11:30', true, false);
INSERT INTO times VALUES (4, '12:00', true, false);
INSERT INTO times VALUES (5, '12:30', true, false);
INSERT INTO times VALUES (6, '13:00', true, false);
INSERT INTO times VALUES (7, '13:30', true, false);
INSERT INTO times VALUES (8, '14:00', true, false);
INSERT INTO times VALUES (9, '14:30', true, false);
INSERT INTO times VALUES (10, '15:00', true, false);
INSERT INTO times VALUES (11, '15:30', true, false);
INSERT INTO times VALUES (12, '16:00', true, false);
INSERT INTO times VALUES (13, '16:30', true, false);
INSERT INTO times VALUES (14, '17:00', true, false);
INSERT INTO times VALUES (15, '17:30', true, false);
INSERT INTO times VALUES (16, '18:00', true, false);
INSERT INTO times VALUES (17, '18:30', true, false);
INSERT INTO times VALUES (18, '19:00', true, false);
INSERT INTO times VALUES (19, '19:30', true, false);
INSERT INTO times VALUES (20, '20:00', true, false);
INSERT INTO times VALUES (21, '20:30', true, false);
INSERT INTO times VALUES (22, '21:00', true, false);
INSERT INTO times VALUES (23, '21:30', true, false);
INSERT INTO times VALUES (24, '22:00', true, false);
INSERT INTO times VALUES (25, '22:30', true, false);
INSERT INTO times VALUES (26, '23:00', true, false);
INSERT INTO times VALUES (27, '23:30', true, false);


--
-- Name: times_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('times_times_id_seq', 27, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fcc
--

INSERT INTO users VALUES (1, 1, 'Admin', '127.0.0.1      ', NULL, NULL, NULL, NULL, false);
INSERT INTO users VALUES (3, 1, 'Айсберг', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (4, 1, 'Машерова', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (5, 1, 'Притыцкого', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (6, 1, 'Рокоссовского', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (7, 1, 'Уручье', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (8, 1, 'Глобо', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fcc
--

SELECT pg_catalog.setval('users_users_id_seq', 8, true);


--
-- Name: dates_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (dates_id);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);


--
-- Name: menucategory_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY menucategory
    ADD CONSTRAINT menucategory_pkey PRIMARY KEY (category_id);


--
-- Name: menutype_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY menutype
    ADD CONSTRAINT menutype_pkey PRIMARY KEY (type_id);


--
-- Name: prepare2_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY prepare2
    ADD CONSTRAINT prepare2_pkey PRIMARY KEY (prepare_id);


--
-- Name: prepare_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY prepare
    ADD CONSTRAINT prepare_pkey PRIMARY KEY (prepare_id);


--
-- Name: residues_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY residues
    ADD CONSTRAINT residues_pkey PRIMARY KEY (id);


--
-- Name: rights_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY (rights_id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roles_id);


--
-- Name: rolesrights_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY rolesrights
    ADD CONSTRAINT rolesrights_pkey PRIMARY KEY (rolesrights_id);


--
-- Name: times_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY times
    ADD CONSTRAINT times_pkey PRIMARY KEY (times_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: fcc; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

