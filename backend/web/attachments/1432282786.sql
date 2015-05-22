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
-- Name: propensi; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA propensi;


ALTER SCHEMA propensi OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = propensi, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ACTIVITY_LOG; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "ACTIVITY_LOG" (
    "User_ID" integer NOT NULL,
    "Timestamp" timestamp without time zone NOT NULL,
    "Activity" character varying(100) NOT NULL
);


ALTER TABLE "ACTIVITY_LOG" OWNER TO postgres;

--
-- Name: ACTIVITY_LOG_User_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "ACTIVITY_LOG_User_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ACTIVITY_LOG_User_ID_seq" OWNER TO postgres;

--
-- Name: ACTIVITY_LOG_User_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "ACTIVITY_LOG_User_ID_seq" OWNED BY "ACTIVITY_LOG"."User_ID";


--
-- Name: ANSWER; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "ANSWER" (
    "User_ID" integer NOT NULL,
    "Quiz_ID" integer NOT NULL,
    "Question_ID" integer NOT NULL,
    "Timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    "Answer_text" text NOT NULL,
    "Subcategory_text" character varying(50) NOT NULL
);


ALTER TABLE "ANSWER" OWNER TO postgres;

--
-- Name: CATEGORIZATION; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "CATEGORIZATION" (
    "Category_ID" integer NOT NULL,
    "Subcategory_ID" integer NOT NULL
);


ALTER TABLE "CATEGORIZATION" OWNER TO postgres;

--
-- Name: CATEGORY; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "CATEGORY" (
    "Category_ID" integer NOT NULL,
    "Category_text" character varying(30) NOT NULL
);


ALTER TABLE "CATEGORY" OWNER TO postgres;

--
-- Name: CATEGORY_Category_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "CATEGORY_Category_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "CATEGORY_Category_ID_seq" OWNER TO postgres;

--
-- Name: CATEGORY_Category_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "CATEGORY_Category_ID_seq" OWNED BY "CATEGORY"."Category_ID";


--
-- Name: EMAIL; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "EMAIL" (
    "ID" integer NOT NULL,
    receiver_email character varying(100) NOT NULL,
    message text,
    attachment text,
    subject character varying(100),
    "timestamp" time without time zone NOT NULL
);


ALTER TABLE "EMAIL" OWNER TO postgres;

--
-- Name: EMAIL_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "EMAIL_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "EMAIL_ID_seq" OWNER TO postgres;

--
-- Name: EMAIL_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "EMAIL_ID_seq" OWNED BY "EMAIL"."ID";


--
-- Name: HISTORY; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "HISTORY" (
    "User_ID" integer NOT NULL,
    "Timestamp" timestamp without time zone NOT NULL,
    "Quiz_ID" integer NOT NULL,
    "Result_ID" integer NOT NULL
);


ALTER TABLE "HISTORY" OWNER TO postgres;

--
-- Name: QUESTION; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUESTION" (
    "Question_ID" integer NOT NULL,
    "Question_text" character varying(100) NOT NULL,
    "Weight" integer DEFAULT 0
);


ALTER TABLE "QUESTION" OWNER TO postgres;

--
-- Name: QUESTION_Question_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "QUESTION_Question_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "QUESTION_Question_ID_seq" OWNER TO postgres;

--
-- Name: QUESTION_Question_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "QUESTION_Question_ID_seq" OWNED BY "QUESTION"."Question_ID";


--
-- Name: QUEST_CATEGORY; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUEST_CATEGORY" (
    "Question_ID" integer NOT NULL,
    "Category_ID" integer NOT NULL
);


ALTER TABLE "QUEST_CATEGORY" OWNER TO postgres;

--
-- Name: QUIZ; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUIZ" (
    "Quiz_ID" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "Description" text NOT NULL,
    flag integer DEFAULT 0
);


ALTER TABLE "QUIZ" OWNER TO postgres;

--
-- Name: QUIZ_CONTENT; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUIZ_CONTENT" (
    "Quiz_ID" integer NOT NULL,
    "Question_ID" integer NOT NULL
);


ALTER TABLE "QUIZ_CONTENT" OWNER TO postgres;

--
-- Name: QUIZ_Quiz_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "QUIZ_Quiz_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "QUIZ_Quiz_ID_seq" OWNER TO postgres;

--
-- Name: QUIZ_Quiz_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "QUIZ_Quiz_ID_seq" OWNED BY "QUIZ"."Quiz_ID";


--
-- Name: QUIZ_RESULT; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUIZ_RESULT" (
    "Result_ID" integer NOT NULL,
    "Quiz_ID" integer NOT NULL,
    "Classification_result" character varying(20) NOT NULL,
    "Result_text" text NOT NULL
);


ALTER TABLE "QUIZ_RESULT" OWNER TO postgres;

--
-- Name: QUIZ_RESULT_Result_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "QUIZ_RESULT_Result_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "QUIZ_RESULT_Result_ID_seq" OWNER TO postgres;

--
-- Name: QUIZ_RESULT_Result_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "QUIZ_RESULT_Result_ID_seq" OWNED BY "QUIZ_RESULT"."Result_ID";


--
-- Name: SUB_CATEGORY; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "SUB_CATEGORY" (
    "Subcategory_text" character varying(50) NOT NULL,
    "Counter" integer DEFAULT 0,
    "Subcategory_ID" integer NOT NULL
);


ALTER TABLE "SUB_CATEGORY" OWNER TO postgres;

--
-- Name: SUB_CATEGORY_Subcategory_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "SUB_CATEGORY_Subcategory_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SUB_CATEGORY_Subcategory_ID_seq" OWNER TO postgres;

--
-- Name: SUB_CATEGORY_Subcategory_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "SUB_CATEGORY_Subcategory_ID_seq" OWNED BY "SUB_CATEGORY"."Subcategory_ID";


--
-- Name: TESTIMONY; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "TESTIMONY" (
    "User_ID" integer NOT NULL,
    "Timestamp" timestamp without time zone NOT NULL,
    "Testimony_text" text NOT NULL
);


ALTER TABLE "TESTIMONY" OWNER TO postgres;

--
-- Name: USER; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "USER" (
    "ID" integer NOT NULL,
    "Username" character varying(20) NOT NULL,
    "Password_hash" character(64) NOT NULL,
    "Password_reset_token" character varying(32),
    "Auth_key" character varying(32),
    "Role" character(1) NOT NULL,
    "Email" character varying(30) NOT NULL,
    "Status" integer NOT NULL,
    "Created_at" timestamp without time zone NOT NULL,
    "Updated_at" timestamp without time zone NOT NULL,
    "Date_of_birth" date NOT NULL,
    "Place_of_birth" character varying(30) NOT NULL,
    "Address" character varying(50) NOT NULL,
    "Gender" character(1) NOT NULL,
    "Phone" character varying(12) NOT NULL,
    "Education" character varying(4) NOT NULL,
    "Occupation" character varying(30) NOT NULL
);


ALTER TABLE "USER" OWNER TO postgres;

--
-- Name: USER_ID_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE "USER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "USER_ID_seq" OWNER TO postgres;

--
-- Name: USER_ID_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE "USER_ID_seq" OWNED BY "USER"."ID";


--
-- Name: migration; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE migration OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer DEFAULT 20 NOT NULL,
    date_of_birth date,
    place_of_birth character varying(30),
    address character varying(50),
    gender character varying(6),
    phone character varying(13),
    education character varying(4),
    occupation character varying(30),
    role integer NOT NULL
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: propensi; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: propensi; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: User_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ACTIVITY_LOG" ALTER COLUMN "User_ID" SET DEFAULT nextval('"ACTIVITY_LOG_User_ID_seq"'::regclass);


--
-- Name: Category_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORY" ALTER COLUMN "Category_ID" SET DEFAULT nextval('"CATEGORY_Category_ID_seq"'::regclass);


--
-- Name: ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "EMAIL" ALTER COLUMN "ID" SET DEFAULT nextval('"EMAIL_ID_seq"'::regclass);


--
-- Name: Question_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUESTION" ALTER COLUMN "Question_ID" SET DEFAULT nextval('"QUESTION_Question_ID_seq"'::regclass);


--
-- Name: Quiz_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUIZ" ALTER COLUMN "Quiz_ID" SET DEFAULT nextval('"QUIZ_Quiz_ID_seq"'::regclass);


--
-- Name: Result_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUIZ_RESULT" ALTER COLUMN "Result_ID" SET DEFAULT nextval('"QUIZ_RESULT_Result_ID_seq"'::regclass);


--
-- Name: Subcategory_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "SUB_CATEGORY" ALTER COLUMN "Subcategory_ID" SET DEFAULT nextval('"SUB_CATEGORY_Subcategory_ID_seq"'::regclass);


--
-- Name: ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "USER" ALTER COLUMN "ID" SET DEFAULT nextval('"USER_ID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: ACTIVITY_LOG; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-21 17:03:12', 'Melakukan registrasi');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-21 17:03:34', 'Login ke dalam sistem');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-22 12:22:49', 'Mengirim email');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-22 13:41:23', 'Mengisi kuesioner');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-22 13:42:24', 'Mengisi kuesioner');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-22 13:45:00', 'Mengisi kuesioner');
INSERT INTO "ACTIVITY_LOG" VALUES (2, '2015-05-21 17:07:26', 'Melakukan registrasi');
INSERT INTO "ACTIVITY_LOG" VALUES (2, '2015-05-21 18:13:33', 'Membuat kuesioner baru');
INSERT INTO "ACTIVITY_LOG" VALUES (2, '2015-05-21 18:25:51', 'Membuat pertanyaan baru');
INSERT INTO "ACTIVITY_LOG" VALUES (2, '2015-05-21 18:27:16', 'Membuat pertanyaan baru');
INSERT INTO "ACTIVITY_LOG" VALUES (2, '2015-05-21 19:34:33', 'Menghapus sebuah kuesioner');
INSERT INTO "ACTIVITY_LOG" VALUES (11, '2015-05-22 13:55:23', 'Melakukan registrasi');
INSERT INTO "ACTIVITY_LOG" VALUES (11, '2015-05-22 13:57:25', 'Login ke dalam sistem');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-05-22 13:58:52', 'Login ke dalam sistem');
INSERT INTO "ACTIVITY_LOG" VALUES (11, '2015-05-22 15:07:55', 'Login ke dalam sistem');
INSERT INTO "ACTIVITY_LOG" VALUES (11, '2015-05-22 15:08:08', 'Mengisi kuesioner');


--
-- Name: ACTIVITY_LOG_User_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"ACTIVITY_LOG_User_ID_seq"', 5, false);


--
-- Data for Name: ANSWER; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 18:00:00', 'Jalan menuju sukses', 'Jalan hidup');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 19:00:00', 'Sesuatu yang anda sukai dalam mengerjakannya dan dapat memberikan penghasilan untuk memenuhi kebutuhan harian', 'Penunjang kehidupan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 20:00:00', 'Proses mencapai visi diri. Didalamnya terdapat rasa senang hati menjalankannya, pengembangan diri, perbaikan siri terus menerus. Karir tidak selalu sama dengan pekerjaan. Karir dicapai dalam jangka yang panjang.', 'Aktualisasi diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 21:00:00', 'Merupakan jiwa saya', 'Jati diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 22:00:00', 'Karir adalah jalur rintisan peningkatan level dalam pekerjaan secara berhierarki vertikal', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-10 23:00:00', 'wadah untuk menyalurkan bakat, skill dan passion untuk juga kemudian di asah sehingga menjadi lebih baik.', 'Aktualisasi diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 00:00:00', 'Jenjang dalam pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 01:00:00', 'Karir adalah proses menuju pemahaman baru dalam berkarya. Tidak untuk kepuasan batin tetapi berbuat sesuatu untuk orang-orang yang dicintai.', 'Bermanfaat bagi orang lain');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 02:00:00', 'Progress atau jenjang dari pekerjaan berdasarkan prestasi dan kompetensi masing2 individu', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 03:00:00', 'Progres seseorang dalam konteks perkerjaan, dimana ia melalui tahapan/tingkat, yang bersifat hirarki. Mulai dari tingkat bawah, sampai suatu tingkat tertentu dimana perubahan tingkat padanya relevan/koheren dengan tingkat sebelumnya.', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 04:00:00', 'tahapan dalam mengembangkan diri dalam lingkup pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 05:00:00', 'Proses menuju sebuah pencapaian diri yang terbaik.', 'Pencapaian diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 06:00:00', 'karir adalah kondisi pekerjaan seseorang, dimana karir bisa dimulai dari bawah karena kemampuan atau dimulai dari mana diinginkan karena relasi/warisan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 07:00:00', 'Jenjang dari suatu pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 08:00:00', 'tujuan dalam mencapai pekerjaan yang ada dalam diri individu. Mulai dari passion dalam pekerjaan, nilai yang kita miliki, dan rasa nyaman. Karier itu sendiri sudah dimiliki oleh setiap individu tanpa kecuali. Kita hanya harus mengembangkan dan mengarahkan ke mana arah tujuan karier kita nantinya.Karier juga bisa berarti cita-cita kita untuk ke depannya.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 09:00:00', 'Karir: keningkatan sumberdaya manusia, yang mana kenaikan meningkat dari tangga awal sampai tangga kehidupan,', 'Peningkatan diri dalam kehidupan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 10:00:00', 'Jenjang dari pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 11:00:00', 'Jalan hidup', 'Jalan hidup');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 12:00:00', 'Jenjang dari pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 13:00:00', 'suatu jenjang dalam pekerjaan kita dimana yang kita harapkan adalah suatu jenjang karir yang terus meningkat', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 14:00:00', 'Suatu usaha yang dilakukan sendiri, bekerja sama, ataupun bekerja pada orang lain dengan harapan memperoleh imbalan hasil.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 15:00:00', 'Karir adalah suatu jenjangan dalam pekerjaan. Yang bisa dijalani oleh siapa saja tanpa harus ad kriteria khusus ataupun persyaratan khusus dlm memasukinya. Misalnya ijazah, tinggi bdn dsb.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 16:00:00', 'suatu bidang dari pekerjaan kita', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 17:00:00', 'Suatu perkembangan pada pekerjaan yang kita jalani dan kita miliki', 'Pencapaian pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 18:00:00', 'kegiatan produktif yang dilakukan individu demi kemajuan finansial dalam hidupnya', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 19:00:00', 'Cara saya mengaktualisasikan diri dan potensi yang saya miliki dan cara saya memberikan manfaat kepada masyarakat banyak', 'Aktualisasi diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 20:00:00', 'Karir adalah salah satu dari sekian banyak cara aktualisasi diri.', 'Aktualisasi diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 21:00:00', 'karir adalah suatu bidang yang membutuhkan keahlian  profesi tertentu.', 'keahlian');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 22:00:00', 'Karir adalah suatu pekerjaan yg kita lakukan d sebagian besar waktu kehidupan kita.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-11 23:00:00', 'Karir adalah suatu pekerjaan yg kita lakukan d sebagian besar waktu kehidupan kita.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 00:00:00', 'Profesi.', 'Profesi');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 01:00:00', 'Karir adalah jenjang dr sebuah pekerjaan', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 02:00:00', 'Jalan Yg dijalani sesuai dengan minat, dorongan, dan latar belakang penitipan.', 'Minat');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 03:00:00', 'Sarana/jalan untuk mengembangkan pekerjaan dan keterampilan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 04:00:00', 'Karir adalah jenjang dalam suatu pekerjaan, maksudnya yaitu perkembangan dan kemajuan yang bersifat baik pada seseorang dalam pekerjaannya.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 05:00:00', 'Dimana seseorang menyalurkan kemampuan yg ia miliki untuk kepentingan atau kebutuhan orang lain dan mendapatkan reward atasnya', 'Kompetensi');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 06:00:00', 'Karir adalah sesuatu yang harus dimiliki oleh setiap orang baik laki-laki maupun perempuan, entah itu karir yang baik atau pun yang buruk. tetapi sebagai manusia tentunya harus berusaha semaksimal mungkin untuk memiliki karir yang baik', 'Bagian penting dalam hidup');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 07:00:00', 'Karir adalah dimana suatu tingkat/nilai prestasi dari pekerjaan kita', 'Pencapaian pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 08:00:00', 'Karir adalah jenjang perjalanan pekerjaan meliputi jabatan, skill, pengetahuan akan pekerjaan yang telah ataupun yang sedang digeluti', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 09:00:00', 'Karir adalah pekerjaan yang ditempuh sesuai dengan jenjang pendidikan yang dipilih', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 10:00:00', 'Karir adalah jenis kegiatan yang dilakukan untuk dapat menopang kehidupan sekaligus mendayagunakan potensi diri', 'Aktualisasi diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 11:00:00', 'Pekerjaan yg memiliki jenjang peningkatan dalam waktu yg jelaa', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 12:00:00', 'Perkembangan dalam sebuah pekerjaan', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 13:00:00', 'Segala apapun jenis bidang profesi yang ditekuni dengan tujuan untuk menjadikan diri lebih baik juga mendapatkan penghasilan. Dan biasanya ada kenikmatan tersendiri disaat karir itu menjadi lebih baik atau naik tingkatannya.', 'Penunjang kehidupan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 14:00:00', 'Segala apapun jenis bidang profesi yang ditekuni dengan tujuan untuk menjadikan diri lebih baik juga mendapatkan penghasilan. Dan biasanya ada kenikmatan tersendiri disaat karir itu menjadi lebih baik atau naik tingkatannya.', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 15:00:00', 'pekerjaan utama yang benar-benar ditekuni dan dalam jangka waktu panjang', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 16:00:00', 'Karir adalah jenjang yang bisa dikejar melalui beberapa tahapan dan juga semangat dan niat', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 17:00:00', 'Pekerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 18:00:00', 'Karir ialah suatu capaian pribadi seseorang terhadap apa yg dia dia lakukan dalam suatu target, itu bisa terkait dengan pekerjaaan maupun capaian yang lain lainnya yang mana itu membanggakan dirinya sendiri.', 'Pencapaian pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 19:00:00', 'Pencapaian prestasi dalam bentuk kerja nyata yang saya minati bidangnya bisa berupa jabatan strategis atau income yg besar', 'Pencapaian pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 20:00:00', 'Sesuatu hal yang ditekuni dalam pekerjaan seseorang', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 21:00:00', 'Sebuah perjalanan yang dialami oleh seseorang dalam menggapai impian dan berkarya sesuai dengan passion yang di milikinya', 'Passion');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 22:00:00', 'bidang pekerjaan atau profesi yang dipilih seseorang dengan tingkatan tertentu.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-12 23:00:00', 'Kesibukan dalam dunia kerja yang kita nyaman berada di dalamnya walaupun dalam kondisi tertekan sekalipun.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 00:00:00', 'Sesuatu yg perlu diraih dan diperjuangkan krna saat ini adalah masa dimana perempuan tidak hanya berpangku pada suami ttp hrus lebih mandiri menghasilkan sesuatu yg mampu menyokong kehidupannya', 'Penunjang kehidupan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 01:00:00', 'bentuk apresiasi terhadap peningkatan kinerja seseorang', 'Apresiasi kerja');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 02:00:00', 'Pekerjaan yang sedang ditekuni sehingga mendapatkan hasil dan penilaian kepuasan dari diri sendiri maupun orang lain, sehingga dalam kegiatan formal sering dijadikan suatu cara untuk dapat menaikan kepercayaan diri maupun dari orang lain untuk menjadi lebih baik dari sebelumnya baik secara kualitas maupun kuantitas.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 03:00:00', 'Pekerjaan yang dilakukan seseorang untuk memenuhi kebutuhan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 04:00:00', 'sesuatu yang dilakukan karena didasari minat', 'Implementasi Minat');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 05:00:00', 'Jenjang2 / tingkatan posisi dalam pekerjaan, dimana semakin tinggi posisi kita semakin besar juga kita bakal dibayar. makanya ada orang yg bilang jenjang karir di perusahaan ini or itu bagus', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 06:00:00', 'karir adalah suatu jenjang atau tingkatan dalam dunia pekerjaan.', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 08:00:00', 'Pekerjaan seseorang yang bertahap maju untuk pekerjaannya', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 09:00:00', 'Karir itu, kemajuan dalam pekerjaan seseorang atau bisa juga menjadi jenjang atau acuan untuk suatu pekerjaan seseorang ke depan nya .', 'Jenjang pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 10:00:00', 'perkembangan dan kemajuan dalam pekerjaan seseorang.', 'Kemajuan pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 11:00:00', 'karir adalah suatu hal yg dijalani mulai kita menginjak anak anak sampai masa tua', 'Proses kehidupan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 12:00:00', 'Karir adalah suatu jenjang usaha yang kita geluti baik itu membawa hal baik (keuntungan) atau bahkan sebaliknya. Karir sendiri bisa kita tekuni sesuai apa yang kita inginkan dan apa yang bisa kita kerjakan. Contoh wirausahawan atau artis', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 13:00:00', 'Tingkat jabatan yang dijalani..agar mendapat tahta atau semacamnya..', 'Jenjang jabatan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 14:00:00', 'kerjaan', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 15:00:00', 'Pencapaian dari suatu pekerjaan', 'Pencapaian pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2000-11-13 16:00:00', 'Kegiatan yang menjadi identitas kita di masyarakat.', 'Jati diri');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-11-11 09:00:00', 'HAHAHAHAHA', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-11-11 09:00:10', 'hahahah', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 09:53:50', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 09:53:50', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 09:53:50', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 09:53:50', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:04:00', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:04:00', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:04:00', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:04:00', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:04:49', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:04:49', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:04:49', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:04:49', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:05:51', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:05:51', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:05:51', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:05:51', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:05:54', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:05:54', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:05:54', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:05:54', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:07:34', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:07:35', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:07:35', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:07:35', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:07:36', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:07:36', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:07:36', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:07:36', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:08:58', 'lol', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:08:58', 'rofl', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:08:58', 'rofllll', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:08:58', 'waawawa', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 1, '2015-04-22 10:11:47', 'hahaha', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 2, '2015-04-22 10:11:47', 'hohoho', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 3, '2015-04-22 10:11:47', 'hiii', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (1, 1, 5, '2015-04-22 10:11:47', 'huuhuhuh', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 1, '2015-04-22 11:29:23', 'test1', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 2, '2015-04-22 11:29:23', 'test2', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 3, '2015-04-22 11:29:23', 'tets3', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 5, '2015-04-22 11:29:23', 'test4', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 1, '2015-04-23 09:05:47', 'hahaha', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 2, '2015-04-23 09:05:47', 'hihihi', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 3, '2015-04-23 09:05:47', 'huhuhu', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 5, '2015-04-23 09:05:47', 'hehehe', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 1, '2015-04-23 09:08:12', 'hahaha', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 2, '2015-04-23 09:08:12', 'hihihi', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 3, '2015-04-23 09:08:12', 'huhuhu', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (2, 1, 5, '2015-04-23 09:08:12', 'hehehe', 'Pekerjaan');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:21:48', 'Kehidupan kami tidak teratur', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:22:32', 'kehidupan kami sangat tidak jelas', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:22:32', 'pekerjaan saya gabut', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:23:46', 'Akhir kuliah saya buruk', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:23:46', 'asdasd', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:27:25', 'qweqwe asdasd', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:27:25', '2weqeqwe qweqwe', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:28:05', 'q3e qw qsd13e', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:28:05', 'qwsd qqwd qwd', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:28:59', 'Akhir kuliah saya suram ', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:28:59', 'bolos terus', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:30:12', 'Aktivitas', 'Aktivitas');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:32:07', 'Aktivitas', 'Aktivitas');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:35:48', 'aktivitas', 'Uncategorized');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:35:48', 'Aktivitas', 'Aktivitas');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:36:30', 'Aktivitas', 'Aktivitas');
INSERT INTO "ANSWER" VALUES (11, 3, 1, '2015-05-20 21:38:44', 'Aktivitas', 'Aktivitas');
INSERT INTO "ANSWER" VALUES (11, 3, 5, '2015-05-20 21:38:44', 'aktivitas', 'Uncategorized');


--
-- Data for Name: CATEGORIZATION; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "CATEGORIZATION" VALUES (22, 1);
INSERT INTO "CATEGORIZATION" VALUES (21, 2);
INSERT INTO "CATEGORIZATION" VALUES (22, 2);
INSERT INTO "CATEGORIZATION" VALUES (21, 3);
INSERT INTO "CATEGORIZATION" VALUES (16, 4);
INSERT INTO "CATEGORIZATION" VALUES (16, 380);
INSERT INTO "CATEGORIZATION" VALUES (16, 5);
INSERT INTO "CATEGORIZATION" VALUES (8, 6);
INSERT INTO "CATEGORIZATION" VALUES (13, 7);
INSERT INTO "CATEGORIZATION" VALUES (13, 8);
INSERT INTO "CATEGORIZATION" VALUES (10, 9);
INSERT INTO "CATEGORIZATION" VALUES (15, 10);
INSERT INTO "CATEGORIZATION" VALUES (1, 11);
INSERT INTO "CATEGORIZATION" VALUES (6, 12);
INSERT INTO "CATEGORIZATION" VALUES (16, 13);
INSERT INTO "CATEGORIZATION" VALUES (5, 13);
INSERT INTO "CATEGORIZATION" VALUES (16, 14);
INSERT INTO "CATEGORIZATION" VALUES (11, 15);
INSERT INTO "CATEGORIZATION" VALUES (7, 16);
INSERT INTO "CATEGORIZATION" VALUES (8, 17);
INSERT INTO "CATEGORIZATION" VALUES (13, 18);
INSERT INTO "CATEGORIZATION" VALUES (9, 19);
INSERT INTO "CATEGORIZATION" VALUES (45, 22);
INSERT INTO "CATEGORIZATION" VALUES (15, 23);
INSERT INTO "CATEGORIZATION" VALUES (44, 24);
INSERT INTO "CATEGORIZATION" VALUES (22, 24);
INSERT INTO "CATEGORIZATION" VALUES (26, 25);
INSERT INTO "CATEGORIZATION" VALUES (44, 26);
INSERT INTO "CATEGORIZATION" VALUES (44, 27);
INSERT INTO "CATEGORIZATION" VALUES (26, 27);
INSERT INTO "CATEGORIZATION" VALUES (15, 28);
INSERT INTO "CATEGORIZATION" VALUES (1, 29);
INSERT INTO "CATEGORIZATION" VALUES (1, 30);
INSERT INTO "CATEGORIZATION" VALUES (46, 33);
INSERT INTO "CATEGORIZATION" VALUES (15, 36);
INSERT INTO "CATEGORIZATION" VALUES (47, 38);
INSERT INTO "CATEGORIZATION" VALUES (48, 42);
INSERT INTO "CATEGORIZATION" VALUES (38, 43);
INSERT INTO "CATEGORIZATION" VALUES (8, 48);
INSERT INTO "CATEGORIZATION" VALUES (31, 49);
INSERT INTO "CATEGORIZATION" VALUES (22, 49);
INSERT INTO "CATEGORIZATION" VALUES (39, 62);
INSERT INTO "CATEGORIZATION" VALUES (11, 63);
INSERT INTO "CATEGORIZATION" VALUES (1, 64);
INSERT INTO "CATEGORIZATION" VALUES (16, 65);
INSERT INTO "CATEGORIZATION" VALUES (5, 68);
INSERT INTO "CATEGORIZATION" VALUES (18, 70);
INSERT INTO "CATEGORIZATION" VALUES (9, 73);
INSERT INTO "CATEGORIZATION" VALUES (17, 77);
INSERT INTO "CATEGORIZATION" VALUES (1, 78);
INSERT INTO "CATEGORIZATION" VALUES (4, 79);
INSERT INTO "CATEGORIZATION" VALUES (19, 79);
INSERT INTO "CATEGORIZATION" VALUES (8, 80);
INSERT INTO "CATEGORIZATION" VALUES (17, 83);
INSERT INTO "CATEGORIZATION" VALUES (2, 84);
INSERT INTO "CATEGORIZATION" VALUES (2, 86);
INSERT INTO "CATEGORIZATION" VALUES (7, 90);
INSERT INTO "CATEGORIZATION" VALUES (13, 92);
INSERT INTO "CATEGORIZATION" VALUES (47, 93);
INSERT INTO "CATEGORIZATION" VALUES (9, 95);
INSERT INTO "CATEGORIZATION" VALUES (47, 96);
INSERT INTO "CATEGORIZATION" VALUES (16, 97);
INSERT INTO "CATEGORIZATION" VALUES (16, 98);
INSERT INTO "CATEGORIZATION" VALUES (36, 102);
INSERT INTO "CATEGORIZATION" VALUES (2, 104);
INSERT INTO "CATEGORIZATION" VALUES (4, 107);
INSERT INTO "CATEGORIZATION" VALUES (5, 111);
INSERT INTO "CATEGORIZATION" VALUES (35, 112);
INSERT INTO "CATEGORIZATION" VALUES (34, 113);
INSERT INTO "CATEGORIZATION" VALUES (35, 114);
INSERT INTO "CATEGORIZATION" VALUES (2, 115);
INSERT INTO "CATEGORIZATION" VALUES (5, 118);
INSERT INTO "CATEGORIZATION" VALUES (4, 123);
INSERT INTO "CATEGORIZATION" VALUES (1, 124);
INSERT INTO "CATEGORIZATION" VALUES (45, 125);
INSERT INTO "CATEGORIZATION" VALUES (24, 128);
INSERT INTO "CATEGORIZATION" VALUES (24, 129);
INSERT INTO "CATEGORIZATION" VALUES (46, 132);
INSERT INTO "CATEGORIZATION" VALUES (12, 133);
INSERT INTO "CATEGORIZATION" VALUES (3, 134);
INSERT INTO "CATEGORIZATION" VALUES (7, 134);
INSERT INTO "CATEGORIZATION" VALUES (15, 135);
INSERT INTO "CATEGORIZATION" VALUES (22, 140);
INSERT INTO "CATEGORIZATION" VALUES (29, 140);
INSERT INTO "CATEGORIZATION" VALUES (21, 141);
INSERT INTO "CATEGORIZATION" VALUES (22, 141);
INSERT INTO "CATEGORIZATION" VALUES (21, 142);
INSERT INTO "CATEGORIZATION" VALUES (46, 143);
INSERT INTO "CATEGORIZATION" VALUES (16, 144);
INSERT INTO "CATEGORIZATION" VALUES (31, 145);
INSERT INTO "CATEGORIZATION" VALUES (22, 145);
INSERT INTO "CATEGORIZATION" VALUES (7, 146);
INSERT INTO "CATEGORIZATION" VALUES (33, 149);
INSERT INTO "CATEGORIZATION" VALUES (33, 150);
INSERT INTO "CATEGORIZATION" VALUES (35, 151);
INSERT INTO "CATEGORIZATION" VALUES (21, 155);
INSERT INTO "CATEGORIZATION" VALUES (21, 156);
INSERT INTO "CATEGORIZATION" VALUES (21, 157);
INSERT INTO "CATEGORIZATION" VALUES (20, 158);
INSERT INTO "CATEGORIZATION" VALUES (21, 159);
INSERT INTO "CATEGORIZATION" VALUES (21, 160);
INSERT INTO "CATEGORIZATION" VALUES (22, 160);
INSERT INTO "CATEGORIZATION" VALUES (21, 161);
INSERT INTO "CATEGORIZATION" VALUES (26, 161);
INSERT INTO "CATEGORIZATION" VALUES (24, 162);
INSERT INTO "CATEGORIZATION" VALUES (6, 164);
INSERT INTO "CATEGORIZATION" VALUES (13, 165);
INSERT INTO "CATEGORIZATION" VALUES (25, 166);
INSERT INTO "CATEGORIZATION" VALUES (13, 168);
INSERT INTO "CATEGORIZATION" VALUES (19, 169);
INSERT INTO "CATEGORIZATION" VALUES (44, 171);
INSERT INTO "CATEGORIZATION" VALUES (52, 172);
INSERT INTO "CATEGORIZATION" VALUES (25, 173);
INSERT INTO "CATEGORIZATION" VALUES (22, 174);
INSERT INTO "CATEGORIZATION" VALUES (8, 175);
INSERT INTO "CATEGORIZATION" VALUES (9, 176);
INSERT INTO "CATEGORIZATION" VALUES (31, 177);
INSERT INTO "CATEGORIZATION" VALUES (7, 178);
INSERT INTO "CATEGORIZATION" VALUES (24, 181);
INSERT INTO "CATEGORIZATION" VALUES (31, 182);
INSERT INTO "CATEGORIZATION" VALUES (34, 187);
INSERT INTO "CATEGORIZATION" VALUES (35, 188);
INSERT INTO "CATEGORIZATION" VALUES (36, 189);
INSERT INTO "CATEGORIZATION" VALUES (34, 191);
INSERT INTO "CATEGORIZATION" VALUES (24, 192);
INSERT INTO "CATEGORIZATION" VALUES (24, 193);
INSERT INTO "CATEGORIZATION" VALUES (51, 194);
INSERT INTO "CATEGORIZATION" VALUES (24, 195);
INSERT INTO "CATEGORIZATION" VALUES (4, 198);
INSERT INTO "CATEGORIZATION" VALUES (37, 199);
INSERT INTO "CATEGORIZATION" VALUES (12, 200);
INSERT INTO "CATEGORIZATION" VALUES (18, 200);
INSERT INTO "CATEGORIZATION" VALUES (2, 203);
INSERT INTO "CATEGORIZATION" VALUES (2, 205);
INSERT INTO "CATEGORIZATION" VALUES (47, 206);
INSERT INTO "CATEGORIZATION" VALUES (47, 207);
INSERT INTO "CATEGORIZATION" VALUES (9, 208);
INSERT INTO "CATEGORIZATION" VALUES (45, 209);
INSERT INTO "CATEGORIZATION" VALUES (1, 210);
INSERT INTO "CATEGORIZATION" VALUES (45, 211);
INSERT INTO "CATEGORIZATION" VALUES (19, 212);
INSERT INTO "CATEGORIZATION" VALUES (4, 213);
INSERT INTO "CATEGORIZATION" VALUES (19, 214);
INSERT INTO "CATEGORIZATION" VALUES (19, 215);
INSERT INTO "CATEGORIZATION" VALUES (1, 219);
INSERT INTO "CATEGORIZATION" VALUES (18, 220);
INSERT INTO "CATEGORIZATION" VALUES (7, 221);
INSERT INTO "CATEGORIZATION" VALUES (23, 222);
INSERT INTO "CATEGORIZATION" VALUES (7, 223);
INSERT INTO "CATEGORIZATION" VALUES (7, 224);
INSERT INTO "CATEGORIZATION" VALUES (7, 225);
INSERT INTO "CATEGORIZATION" VALUES (7, 226);
INSERT INTO "CATEGORIZATION" VALUES (1, 228);
INSERT INTO "CATEGORIZATION" VALUES (3, 229);
INSERT INTO "CATEGORIZATION" VALUES (7, 230);
INSERT INTO "CATEGORIZATION" VALUES (26, 231);
INSERT INTO "CATEGORIZATION" VALUES (15, 232);
INSERT INTO "CATEGORIZATION" VALUES (1, 233);
INSERT INTO "CATEGORIZATION" VALUES (1, 234);
INSERT INTO "CATEGORIZATION" VALUES (2, 235);
INSERT INTO "CATEGORIZATION" VALUES (7, 236);
INSERT INTO "CATEGORIZATION" VALUES (2, 237);
INSERT INTO "CATEGORIZATION" VALUES (7, 238);
INSERT INTO "CATEGORIZATION" VALUES (1, 239);
INSERT INTO "CATEGORIZATION" VALUES (8, 240);
INSERT INTO "CATEGORIZATION" VALUES (1, 241);
INSERT INTO "CATEGORIZATION" VALUES (38, 244);
INSERT INTO "CATEGORIZATION" VALUES (16, 247);
INSERT INTO "CATEGORIZATION" VALUES (45, 248);
INSERT INTO "CATEGORIZATION" VALUES (16, 250);
INSERT INTO "CATEGORIZATION" VALUES (16, 251);
INSERT INTO "CATEGORIZATION" VALUES (2, 252);
INSERT INTO "CATEGORIZATION" VALUES (3, 253);
INSERT INTO "CATEGORIZATION" VALUES (18, 253);
INSERT INTO "CATEGORIZATION" VALUES (18, 254);
INSERT INTO "CATEGORIZATION" VALUES (1, 255);
INSERT INTO "CATEGORIZATION" VALUES (1, 256);
INSERT INTO "CATEGORIZATION" VALUES (38, 257);
INSERT INTO "CATEGORIZATION" VALUES (33, 259);
INSERT INTO "CATEGORIZATION" VALUES (32, 261);
INSERT INTO "CATEGORIZATION" VALUES (20, 261);
INSERT INTO "CATEGORIZATION" VALUES (24, 264);
INSERT INTO "CATEGORIZATION" VALUES (24, 265);
INSERT INTO "CATEGORIZATION" VALUES (22, 266);
INSERT INTO "CATEGORIZATION" VALUES (29, 266);
INSERT INTO "CATEGORIZATION" VALUES (26, 267);
INSERT INTO "CATEGORIZATION" VALUES (27, 268);
INSERT INTO "CATEGORIZATION" VALUES (21, 269);
INSERT INTO "CATEGORIZATION" VALUES (20, 270);
INSERT INTO "CATEGORIZATION" VALUES (29, 271);
INSERT INTO "CATEGORIZATION" VALUES (27, 271);
INSERT INTO "CATEGORIZATION" VALUES (51, 272);
INSERT INTO "CATEGORIZATION" VALUES (8, 275);
INSERT INTO "CATEGORIZATION" VALUES (8, 276);
INSERT INTO "CATEGORIZATION" VALUES (8, 277);
INSERT INTO "CATEGORIZATION" VALUES (47, 278);
INSERT INTO "CATEGORIZATION" VALUES (8, 279);
INSERT INTO "CATEGORIZATION" VALUES (47, 281);
INSERT INTO "CATEGORIZATION" VALUES (7, 282);
INSERT INTO "CATEGORIZATION" VALUES (47, 283);
INSERT INTO "CATEGORIZATION" VALUES (8, 284);
INSERT INTO "CATEGORIZATION" VALUES (7, 285);
INSERT INTO "CATEGORIZATION" VALUES (8, 286);
INSERT INTO "CATEGORIZATION" VALUES (47, 287);
INSERT INTO "CATEGORIZATION" VALUES (8, 288);
INSERT INTO "CATEGORIZATION" VALUES (5, 289);
INSERT INTO "CATEGORIZATION" VALUES (36, 290);
INSERT INTO "CATEGORIZATION" VALUES (30, 291);
INSERT INTO "CATEGORIZATION" VALUES (27, 291);
INSERT INTO "CATEGORIZATION" VALUES (51, 292);
INSERT INTO "CATEGORIZATION" VALUES (27, 292);
INSERT INTO "CATEGORIZATION" VALUES (24, 293);
INSERT INTO "CATEGORIZATION" VALUES (24, 294);
INSERT INTO "CATEGORIZATION" VALUES (24, 295);
INSERT INTO "CATEGORIZATION" VALUES (27, 296);
INSERT INTO "CATEGORIZATION" VALUES (8, 297);
INSERT INTO "CATEGORIZATION" VALUES (24, 298);
INSERT INTO "CATEGORIZATION" VALUES (8, 299);
INSERT INTO "CATEGORIZATION" VALUES (8, 300);
INSERT INTO "CATEGORIZATION" VALUES (8, 301);
INSERT INTO "CATEGORIZATION" VALUES (8, 302);
INSERT INTO "CATEGORIZATION" VALUES (7, 303);
INSERT INTO "CATEGORIZATION" VALUES (28, 304);
INSERT INTO "CATEGORIZATION" VALUES (27, 304);
INSERT INTO "CATEGORIZATION" VALUES (8, 305);
INSERT INTO "CATEGORIZATION" VALUES (7, 305);
INSERT INTO "CATEGORIZATION" VALUES (53, 306);
INSERT INTO "CATEGORIZATION" VALUES (27, 306);
INSERT INTO "CATEGORIZATION" VALUES (9, 307);
INSERT INTO "CATEGORIZATION" VALUES (8, 308);
INSERT INTO "CATEGORIZATION" VALUES (8, 309);
INSERT INTO "CATEGORIZATION" VALUES (28, 310);
INSERT INTO "CATEGORIZATION" VALUES (28, 311);
INSERT INTO "CATEGORIZATION" VALUES (27, 312);
INSERT INTO "CATEGORIZATION" VALUES (8, 313);
INSERT INTO "CATEGORIZATION" VALUES (7, 313);
INSERT INTO "CATEGORIZATION" VALUES (53, 314);
INSERT INTO "CATEGORIZATION" VALUES (23, 315);
INSERT INTO "CATEGORIZATION" VALUES (7, 315);
INSERT INTO "CATEGORIZATION" VALUES (7, 316);
INSERT INTO "CATEGORIZATION" VALUES (7, 317);
INSERT INTO "CATEGORIZATION" VALUES (24, 317);
INSERT INTO "CATEGORIZATION" VALUES (8, 318);
INSERT INTO "CATEGORIZATION" VALUES (27, 319);
INSERT INTO "CATEGORIZATION" VALUES (8, 320);
INSERT INTO "CATEGORIZATION" VALUES (9, 320);
INSERT INTO "CATEGORIZATION" VALUES (40, 324);
INSERT INTO "CATEGORIZATION" VALUES (27, 327);
INSERT INTO "CATEGORIZATION" VALUES (21, 328);
INSERT INTO "CATEGORIZATION" VALUES (27, 329);
INSERT INTO "CATEGORIZATION" VALUES (52, 330);
INSERT INTO "CATEGORIZATION" VALUES (51, 333);
INSERT INTO "CATEGORIZATION" VALUES (24, 333);
INSERT INTO "CATEGORIZATION" VALUES (30, 335);
INSERT INTO "CATEGORIZATION" VALUES (26, 335);
INSERT INTO "CATEGORIZATION" VALUES (21, 336);
INSERT INTO "CATEGORIZATION" VALUES (22, 336);
INSERT INTO "CATEGORIZATION" VALUES (30, 337);
INSERT INTO "CATEGORIZATION" VALUES (26, 337);
INSERT INTO "CATEGORIZATION" VALUES (26, 338);
INSERT INTO "CATEGORIZATION" VALUES (13, 343);
INSERT INTO "CATEGORIZATION" VALUES (13, 344);
INSERT INTO "CATEGORIZATION" VALUES (13, 345);
INSERT INTO "CATEGORIZATION" VALUES (10, 345);
INSERT INTO "CATEGORIZATION" VALUES (13, 346);
INSERT INTO "CATEGORIZATION" VALUES (19, 348);
INSERT INTO "CATEGORIZATION" VALUES (4, 349);
INSERT INTO "CATEGORIZATION" VALUES (18, 350);
INSERT INTO "CATEGORIZATION" VALUES (12, 351);
INSERT INTO "CATEGORIZATION" VALUES (9, 352);
INSERT INTO "CATEGORIZATION" VALUES (33, 353);
INSERT INTO "CATEGORIZATION" VALUES (42, 354);
INSERT INTO "CATEGORIZATION" VALUES (10, 357);
INSERT INTO "CATEGORIZATION" VALUES (46, 358);
INSERT INTO "CATEGORIZATION" VALUES (43, 359);
INSERT INTO "CATEGORIZATION" VALUES (1, 360);
INSERT INTO "CATEGORIZATION" VALUES (46, 361);
INSERT INTO "CATEGORIZATION" VALUES (13, 362);
INSERT INTO "CATEGORIZATION" VALUES (13, 363);
INSERT INTO "CATEGORIZATION" VALUES (13, 364);
INSERT INTO "CATEGORIZATION" VALUES (16, 365);
INSERT INTO "CATEGORIZATION" VALUES (7, 366);
INSERT INTO "CATEGORIZATION" VALUES (49, 367);
INSERT INTO "CATEGORIZATION" VALUES (20, 368);
INSERT INTO "CATEGORIZATION" VALUES (48, 369);
INSERT INTO "CATEGORIZATION" VALUES (48, 370);
INSERT INTO "CATEGORIZATION" VALUES (48, 371);
INSERT INTO "CATEGORIZATION" VALUES (50, 372);
INSERT INTO "CATEGORIZATION" VALUES (48, 373);
INSERT INTO "CATEGORIZATION" VALUES (20, 373);
INSERT INTO "CATEGORIZATION" VALUES (50, 374);
INSERT INTO "CATEGORIZATION" VALUES (20, 375);
INSERT INTO "CATEGORIZATION" VALUES (20, 376);
INSERT INTO "CATEGORIZATION" VALUES (49, 376);
INSERT INTO "CATEGORIZATION" VALUES (8, 377);
INSERT INTO "CATEGORIZATION" VALUES (29, 378);
INSERT INTO "CATEGORIZATION" VALUES (27, 379);


--
-- Data for Name: CATEGORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "CATEGORY" VALUES (1, 'Kehidupan');
INSERT INTO "CATEGORY" VALUES (2, 'Pekerjaan');
INSERT INTO "CATEGORY" VALUES (3, 'Kompetensi');
INSERT INTO "CATEGORY" VALUES (4, 'Kesuksesan');
INSERT INTO "CATEGORY" VALUES (5, 'Kesenangan');
INSERT INTO "CATEGORY" VALUES (6, 'Masa Depan');
INSERT INTO "CATEGORY" VALUES (7, 'Pengembangan Diri');
INSERT INTO "CATEGORY" VALUES (8, 'Aktualisasi Diri');
INSERT INTO "CATEGORY" VALUES (9, 'Tujuan');
INSERT INTO "CATEGORY" VALUES (10, 'Tujuan Ekonomi');
INSERT INTO "CATEGORY" VALUES (11, 'Rutinitas');
INSERT INTO "CATEGORY" VALUES (12, 'Mengandung Value');
INSERT INTO "CATEGORY" VALUES (13, 'Penghasilan');
INSERT INTO "CATEGORY" VALUES (14, 'Pemenuhan Kebutuhan Hidup');
INSERT INTO "CATEGORY" VALUES (15, 'Karir');
INSERT INTO "CATEGORY" VALUES (16, 'Aktivitas');
INSERT INTO "CATEGORY" VALUES (17, 'Jabatan');
INSERT INTO "CATEGORY" VALUES (18, 'Value');
INSERT INTO "CATEGORY" VALUES (19, 'Tujuan/Goal');
INSERT INTO "CATEGORY" VALUES (20, 'Usia Perkembangan');
INSERT INTO "CATEGORY" VALUES (21, 'Akhir Pendidikan');
INSERT INTO "CATEGORY" VALUES (22, 'Pendidikan Tinggi');
INSERT INTO "CATEGORY" VALUES (23, 'Pengalaman Kerja');
INSERT INTO "CATEGORY" VALUES (24, 'Waktu');
INSERT INTO "CATEGORY" VALUES (25, 'Awal Karir');
INSERT INTO "CATEGORY" VALUES (26, 'Pendidikan Menengah');
INSERT INTO "CATEGORY" VALUES (27, 'Uncategorized');
INSERT INTO "CATEGORY" VALUES (28, 'Kesempatan');
INSERT INTO "CATEGORY" VALUES (29, 'Proses Pendidikan');
INSERT INTO "CATEGORY" VALUES (30, 'Jenjang Pendidikan');
INSERT INTO "CATEGORY" VALUES (31, 'Awal Kerja');
INSERT INTO "CATEGORY" VALUES (32, 'Remaja');
INSERT INTO "CATEGORY" VALUES (33, 'Teman');
INSERT INTO "CATEGORY" VALUES (34, 'Orang yang Berpengalaman');
INSERT INTO "CATEGORY" VALUES (35, 'Kerabat');
INSERT INTO "CATEGORY" VALUES (36, 'Keluarga');
INSERT INTO "CATEGORY" VALUES (37, 'Pasangan');
INSERT INTO "CATEGORY" VALUES (38, 'Internal');
INSERT INTO "CATEGORY" VALUES (39, 'Guru');
INSERT INTO "CATEGORY" VALUES (40, 'Senior');
INSERT INTO "CATEGORY" VALUES (41, 'Kesempatan');
INSERT INTO "CATEGORY" VALUES (42, 'Tidak Ada');
INSERT INTO "CATEGORY" VALUES (43, 'Spiritual');
INSERT INTO "CATEGORY" VALUES (44, 'Awal Pendidikan');
INSERT INTO "CATEGORY" VALUES (45, 'Puncak Kerja');
INSERT INTO "CATEGORY" VALUES (46, 'Tuntutan');
INSERT INTO "CATEGORY" VALUES (47, 'Kebutuhan hidup');
INSERT INTO "CATEGORY" VALUES (48, 'Dewasa');
INSERT INTO "CATEGORY" VALUES (49, 'Usia Produktif');
INSERT INTO "CATEGORY" VALUES (50, 'Usia Lanjut');
INSERT INTO "CATEGORY" VALUES (51, 'Situasional');
INSERT INTO "CATEGORY" VALUES (52, 'Awal Berkeluarga');
INSERT INTO "CATEGORY" VALUES (53, 'Kebutuhan');
INSERT INTO "CATEGORY" VALUES (55, 'Kesempatan');


--
-- Name: CATEGORY_Category_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"CATEGORY_Category_ID_seq"', 55, true);


--
-- Data for Name: EMAIL; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "EMAIL" VALUES (1, 'william.suwignyo@gmail.com', '', 'attachments/1432271977.sql', 'sql', '12:20:05');
INSERT INTO "EMAIL" VALUES (2, 'william.suwignyo@ui.ac.id', '', 'attachments/1432272160.sql', 'sql', '12:22:49');


--
-- Name: EMAIL_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"EMAIL_ID_seq"', 2, true);


--
-- Data for Name: HISTORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "HISTORY" VALUES (1, '2015-05-22 13:41:23', 3, 1);
INSERT INTO "HISTORY" VALUES (1, '2015-05-22 13:42:24', 3, 1);
INSERT INTO "HISTORY" VALUES (1, '2015-05-22 13:45:00', 3, 1);
INSERT INTO "HISTORY" VALUES (11, '2015-05-22 15:08:08', 3, 1);


--
-- Data for Name: QUESTION; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUESTION" VALUES (1, 'Menurut saya, karir adalah', 0);
INSERT INTO "QUESTION" VALUES (2, 'Menurut saya , pekerjaan adalah', 0);
INSERT INTO "QUESTION" VALUES (3, 'Menurut saya, waktu yang paling tepat untuk mulai memikirkan karir adalah', 0);
INSERT INTO "QUESTION" VALUES (4, ' ', 0);
INSERT INTO "QUESTION" VALUES (5, 'Orang-orang yang saya mintai pendapat/masukan sebelum saya memutuskan pilihan karir saya adalah', 0);
INSERT INTO "QUESTION" VALUES (6, 'tes', 1);
INSERT INTO "QUESTION" VALUES (8, 'tes', NULL);
INSERT INTO "QUESTION" VALUES (9, 'sadsad', 21);


--
-- Name: QUESTION_Question_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUESTION_Question_ID_seq"', 9, true);


--
-- Data for Name: QUEST_CATEGORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUEST_CATEGORY" VALUES (1, 1);
INSERT INTO "QUEST_CATEGORY" VALUES (1, 2);
INSERT INTO "QUEST_CATEGORY" VALUES (1, 3);
INSERT INTO "QUEST_CATEGORY" VALUES (2, 1);
INSERT INTO "QUEST_CATEGORY" VALUES (2, 5);
INSERT INTO "QUEST_CATEGORY" VALUES (8, 1);
INSERT INTO "QUEST_CATEGORY" VALUES (8, 2);
INSERT INTO "QUEST_CATEGORY" VALUES (8, 4);
INSERT INTO "QUEST_CATEGORY" VALUES (9, 1);
INSERT INTO "QUEST_CATEGORY" VALUES (9, 7);
INSERT INTO "QUEST_CATEGORY" VALUES (9, 8);


--
-- Data for Name: QUIZ; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ" VALUES (3, 'Kuesioner Tes', 'hahahaha ini cuma buat ngetes doang kok', 1);
INSERT INTO "QUIZ" VALUES (1, 'Kuesioner Kesiapan Karir', 'Lorem ipsum dolor sit amet', 1);
INSERT INTO "QUIZ" VALUES (5, 'asdjksajd', 'aaaa', 0);


--
-- Data for Name: QUIZ_CONTENT; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ_CONTENT" VALUES (3, 1);
INSERT INTO "QUIZ_CONTENT" VALUES (3, 5);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 1);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 2);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 3);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 5);
INSERT INTO "QUIZ_CONTENT" VALUES (5, 1);
INSERT INTO "QUIZ_CONTENT" VALUES (5, 2);


--
-- Name: QUIZ_Quiz_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUIZ_Quiz_ID_seq"', 6, true);


--
-- Data for Name: QUIZ_RESULT; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ_RESULT" VALUES (1, 1, 'Sukses', 'Selamat! Anda merupakan pengunjung yang pertama');


--
-- Name: QUIZ_RESULT_Result_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUIZ_RESULT_Result_ID_seq"', 2, true);


--
-- Data for Name: SUB_CATEGORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "SUB_CATEGORY" VALUES ('Akhir kuliah', 2, 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Akhir SMA', 2, 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Akhir SMP', 1, 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktifitas Serius', 2, 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Berkesinambungan', 2, 5);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Bermanfaat', 1, 6);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Ekonomi', 68, 7);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Ekonomi Rutin', 1, 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas finansial', 1, 9);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Karir', 1, 10);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas kehidupan', 1, 11);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas masa depan', 1, 12);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas menyenangkan', 1, 13);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Rutin', 37, 14);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas sehari-hari', 1, 15);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas sesuai minat', 1, 16);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktualisasi diri', 12, 17);
INSERT INTO "SUB_CATEGORY" VALUES ('aktvitas Menghasilkan', 6, 18);
INSERT INTO "SUB_CATEGORY" VALUES ('Ambisi diri', 1, 19);
INSERT INTO "SUB_CATEGORY" VALUES ('anak saya, suami, dan oarang tua', 2, 20);
INSERT INTO "SUB_CATEGORY" VALUES ('apakah karir tersebut dapat memberikan', 1, 21);
INSERT INTO "SUB_CATEGORY" VALUES ('Apresiasi kerja', 1, 22);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal Karir', 1, 23);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal kuliah', 21, 24);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal penjurusan SMA', 1, 25);
INSERT INTO "SUB_CATEGORY" VALUES ('awal sekolah', 1, 26);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal SMA', 2, 27);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian Karir', 1, 28);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian penting dalam hidup', 1, 29);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian penting kehidupan', 4, 30);
INSERT INTO "SUB_CATEGORY" VALUES ('bakat', 15, 31);
INSERT INTO "SUB_CATEGORY" VALUES ('bakat nyaman lingkungan', 1, 32);
INSERT INTO "SUB_CATEGORY" VALUES ('Beban', 1, 33);
INSERT INTO "SUB_CATEGORY" VALUES ('Bermanfaat bagi orang lain', 3, 34);
INSERT INTO "SUB_CATEGORY" VALUES ('berpengalaman', 1, 35);
INSERT INTO "SUB_CATEGORY" VALUES ('Bidang Karir', 1, 36);
INSERT INTO "SUB_CATEGORY" VALUES ('bidang pekerjaan', 1, 37);
INSERT INTO "SUB_CATEGORY" VALUES ('Cara Survival', 1, 38);
INSERT INTO "SUB_CATEGORY" VALUES ('cita-cita', 2, 39);
INSERT INTO "SUB_CATEGORY" VALUES ('cita-cita saya', 2, 40);
INSERT INTO "SUB_CATEGORY" VALUES ('dana', 1, 41);
INSERT INTO "SUB_CATEGORY" VALUES ('Dewasa Awal', 1, 42);
INSERT INTO "SUB_CATEGORY" VALUES ('Diri Sendiri', 1, 43);
INSERT INTO "SUB_CATEGORY" VALUES ('dosen', 1, 44);
INSERT INTO "SUB_CATEGORY" VALUES ('dukungan keluarga', 1, 45);
INSERT INTO "SUB_CATEGORY" VALUES ('dukungan sosial', 2, 46);
INSERT INTO "SUB_CATEGORY" VALUES ('ekonomi keluarga', 1, 47);
INSERT INTO "SUB_CATEGORY" VALUES ('Ekspresi diri', 1, 48);
INSERT INTO "SUB_CATEGORY" VALUES ('Entry-Level', 7, 49);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor inchi faktor bakat', 1, 50);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor kelebihan dalam bidang apa', 1, 51);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor kesehatan', 1, 52);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor keyakinan', 1, 53);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor lingkungan dan apa yang dibutuhkan', 1, 54);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor pekerjaan', 5, 55);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor sosial', 1, 56);
INSERT INTO "SUB_CATEGORY" VALUES ('fasilitas', 1, 57);
INSERT INTO "SUB_CATEGORY" VALUES ('finansial', 1, 58);
INSERT INTO "SUB_CATEGORY" VALUES ('gaji', 1, 59);
INSERT INTO "SUB_CATEGORY" VALUES ('gaji fasilitas', 1, 60);
INSERT INTO "SUB_CATEGORY" VALUES ('gender', 2, 61);
INSERT INTO "SUB_CATEGORY" VALUES ('Guru', 45, 62);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal biasa', 1, 63);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal sulit', 1, 64);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal Tak Mudah', 1, 65);
INSERT INTO "SUB_CATEGORY" VALUES ('harapan keluarga', 1, 66);
INSERT INTO "SUB_CATEGORY" VALUES ('harapan tantangan', 2, 67);
INSERT INTO "SUB_CATEGORY" VALUES ('Hobi', 1, 68);
INSERT INTO "SUB_CATEGORY" VALUES ('hoi bakat', 1, 69);
INSERT INTO "SUB_CATEGORY" VALUES ('Ibadah', 1, 70);
INSERT INTO "SUB_CATEGORY" VALUES ('ibadan', 1, 71);
INSERT INTO "SUB_CATEGORY" VALUES ('idealisme', 1, 72);
INSERT INTO "SUB_CATEGORY" VALUES ('Impian', 1, 73);
INSERT INTO "SUB_CATEGORY" VALUES ('impian tujuan hidup saya', 1, 74);
INSERT INTO "SUB_CATEGORY" VALUES ('Implementasi Minat', 2, 75);
INSERT INTO "SUB_CATEGORY" VALUES ('informasi', 1, 76);
INSERT INTO "SUB_CATEGORY" VALUES ('Jabatan', 1, 77);
INSERT INTO "SUB_CATEGORY" VALUES ('Jalan hidup', 16, 78);
INSERT INTO "SUB_CATEGORY" VALUES ('Jalan kesuksesan', 1, 79);
INSERT INTO "SUB_CATEGORY" VALUES ('Jati diri', 15, 80);
INSERT INTO "SUB_CATEGORY" VALUES ('jenis karir lokasi prospek', 1, 81);
INSERT INTO "SUB_CATEGORY" VALUES ('jenis pekerjaan', 7, 82);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenis/Nama Jabatan', 2, 83);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenjang jabatan', 6, 84);
INSERT INTO "SUB_CATEGORY" VALUES ('jenjang karir', 5, 85);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenjang pekerjaan', 79, 86);
INSERT INTO "SUB_CATEGORY" VALUES ('jenjang pendidikan, prestasi,  skill', 1, 87);
INSERT INTO "SUB_CATEGORY" VALUES ('jurusan kuliah', 1, 88);
INSERT INTO "SUB_CATEGORY" VALUES ('karir', 5, 89);
INSERT INTO "SUB_CATEGORY" VALUES ('keahlian', 9, 90);
INSERT INTO "SUB_CATEGORY" VALUES ('keahlian dalam bidang tertentu', 1, 91);
INSERT INTO "SUB_CATEGORY" VALUES ('Keahlian Menghasilkan', 1, 92);
INSERT INTO "SUB_CATEGORY" VALUES ('Keberlangsungan Hidup', 1, 93);
INSERT INTO "SUB_CATEGORY" VALUES ('kebutuhan', 1, 94);
INSERT INTO "SUB_CATEGORY" VALUES ('Kebutuhan keluarga', 1, 95);
INSERT INTO "SUB_CATEGORY" VALUES ('Kebutuhan setiap orang', 1, 96);
INSERT INTO "SUB_CATEGORY" VALUES ('Kegiatan Produktif', 1, 97);
INSERT INTO "SUB_CATEGORY" VALUES ('Kegiatan Spesifik', 2, 98);
INSERT INTO "SUB_CATEGORY" VALUES ('keinginan', 4, 99);
INSERT INTO "SUB_CATEGORY" VALUES ('keinginan diri dari masa depan', 1, 100);
INSERT INTO "SUB_CATEGORY" VALUES ('kelebihan dan kekurangannya faktor', 1, 101);
INSERT INTO "SUB_CATEGORY" VALUES ('Keluarga', 205, 102);
INSERT INTO "SUB_CATEGORY" VALUES ('keluarga, pacar, teman', 2, 103);
INSERT INTO "SUB_CATEGORY" VALUES ('Kemajuan pekerjaan', 4, 104);
INSERT INTO "SUB_CATEGORY" VALUES ('kemampuan', 19, 105);
INSERT INTO "SUB_CATEGORY" VALUES ('kemampuan, kelebihan dan kekurangan', 1, 106);
INSERT INTO "SUB_CATEGORY" VALUES ('Kemapanan bekerja', 1, 107);
INSERT INTO "SUB_CATEGORY" VALUES ('kenikamatan dalam pekerjaan', 1, 108);
INSERT INTO "SUB_CATEGORY" VALUES ('kenyamanan', 5, 109);
INSERT INTO "SUB_CATEGORY" VALUES ('kepuasan', 1, 110);
INSERT INTO "SUB_CATEGORY" VALUES ('Kepuasan kerja', 1, 111);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerabat', 31, 112);
INSERT INTO "SUB_CATEGORY" VALUES ('kerabat berpengalaman', 22, 113);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerabat Pasangan', 1, 114);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerja', 2, 115);
INSERT INTO "SUB_CATEGORY" VALUES ('kesempatan', 15, 116);
INSERT INTO "SUB_CATEGORY" VALUES ('kesempatan berkembang', 2, 117);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesenangan', 1, 118);
INSERT INTO "SUB_CATEGORY" VALUES ('kesesuaian dengan kemampuan', 1, 119);
INSERT INTO "SUB_CATEGORY" VALUES ('kesesuaian karir', 1, 120);
INSERT INTO "SUB_CATEGORY" VALUES ('kesukaan kemampuan', 1, 121);
INSERT INTO "SUB_CATEGORY" VALUES ('kesukaan, keseharian, potensi', 1, 122);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan', 3, 123);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan hidup', 1, 124);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan pekerjaan', 1, 125);
INSERT INTO "SUB_CATEGORY" VALUES ('ketertarikan', 1, 126);
INSERT INTO "SUB_CATEGORY" VALUES ('ketertarikan dan pemahaman', 2, 127);
INSERT INTO "SUB_CATEGORY" VALUES ('Ketika di toilet, ingin tidur', 1, 128);
INSERT INTO "SUB_CATEGORY" VALUES ('ketika mulai mengenal orang lain', 1, 129);
INSERT INTO "SUB_CATEGORY" VALUES ('keuangan, jalan hidup', 1, 130);
INSERT INTO "SUB_CATEGORY" VALUES ('keuntungan', 2, 131);
INSERT INTO "SUB_CATEGORY" VALUES ('Kewajiban', 13, 132);
INSERT INTO "SUB_CATEGORY" VALUES ('Komitmen', 1, 133);
INSERT INTO "SUB_CATEGORY" VALUES ('Kompetensi', 2, 134);
INSERT INTO "SUB_CATEGORY" VALUES ('Komponen Karir', 1, 135);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi', 1, 136);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi finansial', 2, 137);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi fisik', 3, 138);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi pekerjaan', 1, 139);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah', 3, 140);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah akhir', 4, 141);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah Tingkat Akhir', 6, 142);
INSERT INTO "SUB_CATEGORY" VALUES ('Kumpulan Tugas', 2, 143);
INSERT INTO "SUB_CATEGORY" VALUES ('Label', 2, 144);
INSERT INTO "SUB_CATEGORY" VALUES ('Level fresh graduate', 7, 145);
INSERT INTO "SUB_CATEGORY" VALUES ('Level skill', 1, 146);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan ', 6, 147);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan kerja', 11, 148);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Pertemanan', 96, 149);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Pertemanan, keluarga', 1, 150);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Terdekat', 2, 151);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan, pendidikan, kesehatan', 1, 152);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan, pergaulan, orang tua', 1, 153);
INSERT INTO "SUB_CATEGORY" VALUES ('lowongan pekerjaan', 1, 154);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus kuliah', 19, 155);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus pendidikan', 5, 156);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus pendidikan profesi', 1, 157);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SD', 1, 158);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus sekolah', 1, 159);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SMA', 17, 160);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SMP', 2, 161);
INSERT INTO "SUB_CATEGORY" VALUES ('malam hari', 2, 162);
INSERT INTO "SUB_CATEGORY" VALUES ('manfaat sosial', 2, 163);
INSERT INTO "SUB_CATEGORY" VALUES ('Masa depan', 22, 164);
INSERT INTO "SUB_CATEGORY" VALUES ('Mata Pencaharian', 3, 165);
INSERT INTO "SUB_CATEGORY" VALUES ('Memulai pekerjaan', 7, 166);
INSERT INTO "SUB_CATEGORY" VALUES ('mengabdi di masyarakat dukungan', 1, 167);
INSERT INTO "SUB_CATEGORY" VALUES ('Menghasilkan Sesuatu', 1, 168);
INSERT INTO "SUB_CATEGORY" VALUES ('Menghasilkan Seusatu', 17, 169);
INSERT INTO "SUB_CATEGORY" VALUES ('mengubah kehidupan jadi lebih baik', 3, 170);
INSERT INTO "SUB_CATEGORY" VALUES ('menjelang', 3, 171);
INSERT INTO "SUB_CATEGORY" VALUES ('menjelang berkeluarga', 1, 172);
INSERT INTO "SUB_CATEGORY" VALUES ('Menjelang kerja', 1, 173);
INSERT INTO "SUB_CATEGORY" VALUES ('Menjelang kuliah', 2, 174);
INSERT INTO "SUB_CATEGORY" VALUES ('Menunjukkan Kemandirian', 2, 175);
INSERT INTO "SUB_CATEGORY" VALUES ('Meraih kesempatan', 1, 176);
INSERT INTO "SUB_CATEGORY" VALUES ('Mid- Level kerja', 3, 177);
INSERT INTO "SUB_CATEGORY" VALUES ('Minat', 1, 178);
INSERT INTO "SUB_CATEGORY" VALUES ('minat jika sudah menikah', 1, 179);
INSERT INTO "SUB_CATEGORY" VALUES ('minat, bakat, dan/atau hobi', 1, 180);
INSERT INTO "SUB_CATEGORY" VALUES ('Mulai dari sekarang', 1, 181);
INSERT INTO "SUB_CATEGORY" VALUES ('Mulai Pekerjaan', 4, 182);
INSERT INTO "SUB_CATEGORY" VALUES ('nasib ', 1, 183);
INSERT INTO "SUB_CATEGORY" VALUES ('nilai keyakinan', 1, 184);
INSERT INTO "SUB_CATEGORY" VALUES ('nilai sosial', 1, 185);
INSERT INTO "SUB_CATEGORY" VALUES ('orang', 1, 186);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Berpengalaman', 6, 187);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Terdekat', 1, 188);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Tua', 1, 189);
INSERT INTO "SUB_CATEGORY" VALUES ('orang tua dan lingkungan', 1, 190);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang yang sukses berkarir', 2, 191);
INSERT INTO "SUB_CATEGORY" VALUES ('Pada malam hari', 1, 192);
INSERT INTO "SUB_CATEGORY" VALUES ('Pada saat bangun pagi', 2, 193);
INSERT INTO "SUB_CATEGORY" VALUES ('pada saat saya nyaman', 1, 194);
INSERT INTO "SUB_CATEGORY" VALUES ('pagi hari', 1, 195);
INSERT INTO "SUB_CATEGORY" VALUES ('pandangan orang lain', 1, 196);
INSERT INTO "SUB_CATEGORY" VALUES ('pandangan sosial', 1, 197);
INSERT INTO "SUB_CATEGORY" VALUES ('Parameter kesuksesan', 1, 198);
INSERT INTO "SUB_CATEGORY" VALUES ('Pasangan', 18, 199);
INSERT INTO "SUB_CATEGORY" VALUES ('Passion', 12, 200);
INSERT INTO "SUB_CATEGORY" VALUES ('passion and salary', 1, 201);
INSERT INTO "SUB_CATEGORY" VALUES ('passion, lingkungan, pemerintahan, ilmu', 1, 202);
INSERT INTO "SUB_CATEGORY" VALUES ('Pekerjaan', 89, 203);
INSERT INTO "SUB_CATEGORY" VALUES ('pekerjaan yang gampang', 1, 204);
INSERT INTO "SUB_CATEGORY" VALUES ('Pembelajaran kerja', 1, 205);
INSERT INTO "SUB_CATEGORY" VALUES ('Pemenuhan Kebutuhan', 41, 206);
INSERT INTO "SUB_CATEGORY" VALUES ('Pemenuhan Kebutuhan Hidup', 1, 207);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian cita cita', 2, 208);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian diri', 4, 209);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian hidup', 1, 210);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian pekerjaan', 29, 211);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Target', 1, 212);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian tertinggi pekerjaan', 1, 213);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Tujuan', 1, 214);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Tujuan Tertentu', 17, 215);
INSERT INTO "SUB_CATEGORY" VALUES ('pendapatan', 44, 216);
INSERT INTO "SUB_CATEGORY" VALUES ('pendapatan kelak', 1, 217);
INSERT INTO "SUB_CATEGORY" VALUES ('pendidikan', 15, 218);
INSERT INTO "SUB_CATEGORY" VALUES ('Penentu hidup', 2, 219);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengabdian Keluarga', 1, 220);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengalaman', 3, 221);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengalaman kerja', 1, 222);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan diri', 3, 223);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan minat', 1, 224);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan potensi', 1, 225);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan skill', 5, 226);
INSERT INTO "SUB_CATEGORY" VALUES ('penghasilan karir tersebut', 1, 227);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan diri dalam kehidupan', 1, 228);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan kompetensi', 1, 229);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan target', 1, 230);
INSERT INTO "SUB_CATEGORY" VALUES ('Penjurusan SMA', 2, 231);
INSERT INTO "SUB_CATEGORY" VALUES ('Penunjang Karir', 1, 232);
INSERT INTO "SUB_CATEGORY" VALUES ('Penunjang kehidupan', 22, 233);
INSERT INTO "SUB_CATEGORY" VALUES ('Perjalanan hidup', 2, 234);
INSERT INTO "SUB_CATEGORY" VALUES ('Perjalanan pekerjaan', 1, 235);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan diri', 1, 236);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan pekerjaan', 1, 237);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan Profesi', 0, 238);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan', 2, 239);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan Aktivitas', 1, 240);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan hidup', 3, 241);
INSERT INTO "SUB_CATEGORY" VALUES ('pilihan karir ', 1, 242);
INSERT INTO "SUB_CATEGORY" VALUES ('pola kerja', 4, 243);
INSERT INTO "SUB_CATEGORY" VALUES ('Potensi', 1, 244);
INSERT INTO "SUB_CATEGORY" VALUES ('potensi masa depan', 2, 245);
INSERT INTO "SUB_CATEGORY" VALUES ('potensi pengembangan diri', 1, 246);
INSERT INTO "SUB_CATEGORY" VALUES ('Predikat', 1, 247);
INSERT INTO "SUB_CATEGORY" VALUES ('Prestasi', 3, 248);
INSERT INTO "SUB_CATEGORY" VALUES ('prestige', 3, 249);
INSERT INTO "SUB_CATEGORY" VALUES ('Produktif', 4, 250);
INSERT INTO "SUB_CATEGORY" VALUES ('Produktivitas', 1, 251);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesi', 8, 252);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesionalisme', 1, 253);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesionalitas', 1, 254);
INSERT INTO "SUB_CATEGORY" VALUES ('Proses kehidupan', 4, 255);
INSERT INTO "SUB_CATEGORY" VALUES ('Proses perubahan nilai', 1, 256);
INSERT INTO "SUB_CATEGORY" VALUES ('Rasa Senang', 1, 257);
INSERT INTO "SUB_CATEGORY" VALUES ('referensi keluarga', 1, 258);
INSERT INTO "SUB_CATEGORY" VALUES ('Rekan Kerja', 1, 259);
INSERT INTO "SUB_CATEGORY" VALUES ('relasi', 1, 260);
INSERT INTO "SUB_CATEGORY" VALUES ('Remaja', 3, 261);
INSERT INTO "SUB_CATEGORY" VALUES ('reward', 1, 262);
INSERT INTO "SUB_CATEGORY" VALUES ('risiko', 1, 263);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat ini', 1, 264);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat ini dan seterusnya', 3, 265);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat kuliah', 23, 266);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat penjurusan SMA', 1, 267);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat pindah kerja', 1, 268);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat proses mengakhiri pendidikan', 2, 269);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat remaja', 1, 270);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat sekolah', 8, 271);
INSERT INTO "SUB_CATEGORY" VALUES ('saat sudah menguntungkan', 1, 272);
INSERT INTO "SUB_CATEGORY" VALUES ('sahabat', 1, 273);
INSERT INTO "SUB_CATEGORY" VALUES ('sanggup akan tuntutan pekerjaan', 1, 274);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Aktualisasi Diri', 2, 275);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Berkarir', 2, 276);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Berkarya', 2, 277);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Bertahan Hidup', 1, 278);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Implementasi Keahlian', 1, 279);
INSERT INTO "SUB_CATEGORY" VALUES ('sarana kerja', 1, 280);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Mencapai Hidup Layak', 1, 281);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Menimba Ilmu', 1, 282);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Meningkatkan Taraf Hidup', 1, 283);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Meraih Karir', 1, 284);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Pengembangan Diri', 1, 285);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Pengembangan Karir', 1, 286);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Survival', 1, 287);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Unjuk Kompetensi', 1, 288);
INSERT INTO "SUB_CATEGORY" VALUES ('Satu Kesenangan', 1, 289);
INSERT INTO "SUB_CATEGORY" VALUES ('Saudara', 1, 290);
INSERT INTO "SUB_CATEGORY" VALUES ('SD', 5, 291);
INSERT INTO "SUB_CATEGORY" VALUES ('Sebelum menikah', 2, 292);
INSERT INTO "SUB_CATEGORY" VALUES ('Secepatnya', 7, 293);
INSERT INTO "SUB_CATEGORY" VALUES ('Sedini mungkin', 19, 294);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejak kecil', 1, 295);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejak manusia bisa berpikir', 1, 296);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan citra diri', 1, 297);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan hobi', 1, 298);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan keinginan', 1, 299);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan keinginan sukses', 1, 300);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan kemampuan', 8, 301);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kemampuan diri', 3, 302);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan Kemandirian', 1, 303);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kesempatan', 1, 304);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kesiapan diri', 2, 305);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kondisi finansial', 1, 306);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan kontribusi kerja', 1, 307);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan minat', 2, 308);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan passion', 1, 309);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan peluang', 1, 310);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan peluang karir', 1, 311);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pemahaman diri', 1, 312);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pemahaman karir', 1, 313);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan pemenuhan kebutuhan', 1, 314);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pengalaman kerja', 2, 315);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan Perkembangan Bakat', 1, 316);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan perkembangan diri', 1, 317);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan potensi diri', 1, 318);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan tanggungjawab', 1, 319);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan target', 1, 320);
INSERT INTO "SUB_CATEGORY" VALUES ('semangat', 1, 321);
INSERT INTO "SUB_CATEGORY" VALUES ('senang dengan pekerjaan', 1, 322);
INSERT INTO "SUB_CATEGORY" VALUES ('senang nyaman mengerti', 1, 323);
INSERT INTO "SUB_CATEGORY" VALUES ('Senior', 3, 324);
INSERT INTO "SUB_CATEGORY" VALUES ('sesuai dengan passion', 1, 325);
INSERT INTO "SUB_CATEGORY" VALUES ('sesuai dengan profesi dan minat', 2, 326);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah berkeluarga', 2, 327);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah lulus SMA', 24, 328);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah memutuskan akan mengambil jalur', 1, 329);
INSERT INTO "SUB_CATEGORY" VALUES ('setelah menikah', 2, 330);
INSERT INTO "SUB_CATEGORY" VALUES ('situasi dan kondisi', 1, 331);
INSERT INTO "SUB_CATEGORY" VALUES ('situasi kerja', 2, 332);
INSERT INTO "SUB_CATEGORY" VALUES ('Situasional', 6, 333);
INSERT INTO "SUB_CATEGORY" VALUES ('skill', 5, 334);
INSERT INTO "SUB_CATEGORY" VALUES ('SMA Akhir', 3, 336);
INSERT INTO "SUB_CATEGORY" VALUES ('SMP', 8, 337);
INSERT INTO "SUB_CATEGORY" VALUES ('SMP Akhir', 1, 338);
INSERT INTO "SUB_CATEGORY" VALUES ('sosial', 1, 339);
INSERT INTO "SUB_CATEGORY" VALUES ('Status Sosial', 1, 340);
INSERT INTO "SUB_CATEGORY" VALUES ('suami orang tua anak', 1, 341);
INSERT INTO "SUB_CATEGORY" VALUES ('suasana kerja', 1, 342);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Nafkah', 8, 343);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Pendapatan', 1, 344);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber penghasilan', 2, 345);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Riset', 3, 346);
INSERT INTO "SUB_CATEGORY" VALUES ('SWOT saat menganalisis diri', 1, 347);
INSERT INTO "SUB_CATEGORY" VALUES ('Tahap perkembangan hidup', 1, 348);
INSERT INTO "SUB_CATEGORY" VALUES ('Tangga kesuksesan', 1, 349);
INSERT INTO "SUB_CATEGORY" VALUES ('Tanggung jawab', 19, 350);
INSERT INTO "SUB_CATEGORY" VALUES ('Tanggungjawab', 1, 351);
INSERT INTO "SUB_CATEGORY" VALUES ('Target diri', 1, 352);
INSERT INTO "SUB_CATEGORY" VALUES ('Teman', 2, 353);
INSERT INTO "SUB_CATEGORY" VALUES ('Tidak Ada', 2, 354);
INSERT INTO "SUB_CATEGORY" VALUES ('tidak sesuai bidang, gaji kecil', 1, 355);
INSERT INTO "SUB_CATEGORY" VALUES ('tingkat kepercayaan dari bidang', 1, 356);
INSERT INTO "SUB_CATEGORY" VALUES ('Transaksi imbal jasa', 0, 357);
INSERT INTO "SUB_CATEGORY" VALUES ('Tugas', 5, 358);
INSERT INTO "SUB_CATEGORY" VALUES ('Tuhan', 2, 359);
INSERT INTO "SUB_CATEGORY" VALUES ('Tujuan hidup', 2, 360);
INSERT INTO "SUB_CATEGORY" VALUES ('Tuntutan', 1, 361);
INSERT INTO "SUB_CATEGORY" VALUES ('uang', 4, 362);
INSERT INTO "SUB_CATEGORY" VALUES ('Uang Rutinitas', 1, 363);
INSERT INTO "SUB_CATEGORY" VALUES ('Uang, Menghasilkan Sesuatu', 1, 364);
INSERT INTO "SUB_CATEGORY" VALUES ('Usaha', 1, 365);
INSERT INTO "SUB_CATEGORY" VALUES ('Usaha diri', 1, 366);
INSERT INTO "SUB_CATEGORY" VALUES ('usia', 1, 367);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 20-an', 8, 368);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 20an', 6, 369);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 25an', 3, 370);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 30an', 2, 371);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 50an', 1, 372);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia dewasa', 2, 373);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia Lanjut', 1, 374);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia muda', 24, 375);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia produktif', 8, 376);
INSERT INTO "SUB_CATEGORY" VALUES ('Wadah', 10, 377);
INSERT INTO "SUB_CATEGORY" VALUES ('waktu kuliah', 23, 378);
INSERT INTO "SUB_CATEGORY" VALUES ('Uncategorized', 0, 379);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas', 19, 380);
INSERT INTO "SUB_CATEGORY" VALUES ('asdasd', NULL, 381);
INSERT INTO "SUB_CATEGORY" VALUES ('SMA', 56, 335);
INSERT INTO "SUB_CATEGORY" VALUES ('asd', NULL, 382);


--
-- Name: SUB_CATEGORY_Subcategory_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"SUB_CATEGORY_Subcategory_ID_seq"', 382, true);


--
-- Data for Name: TESTIMONY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--



--
-- Data for Name: USER; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "USER" VALUES (1, 'Admin', 'de7804989ad9c5f4d39e0ad1c29c1bff00000000000000000000000000000000', NULL, NULL, 'A', 'lorem@ipsum.dolor', 0, '2015-04-09 16:24:18', '2015-04-09 16:25:20', '1993-02-07', 'lorem ipsum', 'lorem ipsum', 'M', '08123456789', 'SD', 'Admin');
INSERT INTO "USER" VALUES (2, 'anonim', 'f2b0a1c07ccefc2d6763c8815e8a794600000000000000000000000000000000', NULL, NULL, 'M', 'anonim@anon.im', 0, '2015-04-09 16:24:18', '2015-04-09 16:25:20', '2012-09-09', 'unknown', 'unknown', 'F', '08155555555', 'S3', 'NEET');


--
-- Name: USER_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"USER_ID_seq"', 3, true);


--
-- Data for Name: migration; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO migration VALUES ('m000000_000000_base', 1429454811);
INSERT INTO migration VALUES ('m130524_201442_init', 1429454815);


--
-- Data for Name: user; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "user" VALUES (1, 'coba', 'aGVvFQIXurbcvKXfF-J5IlHTBthbpZhN', '$2y$13$6x1GhWB5XnLNHmLJdTa.lOTnk/T77rMDaz9LA23g7JXkH4xCOhkKG', NULL, 'coba@gmail.com', 10, 1432202592, 1432272098, NULL, '', '', 'Pria', '', '', '', 0);
INSERT INTO "user" VALUES (2, 'coba2', 'VFEeojSYt-AHxL5VRwiP7u8Tavzbd1Hm', '$2y$13$33LvzlD72WyXLfYYkV/.AOLn67OzrnrPDC1.kJ1lhQOP81aIe7n2W', NULL, 'coba2@gmail.com', 10, 1432202846, 1432202846, NULL, '', '', 'Pria', '', '', '', 0);
INSERT INTO "user" VALUES (11, 'nitto', 'nec9PChKliUTyZ0AXloA_zOScC6RATbP', '$2y$13$BGAStaj7IXbqFK0JZxmiJO5jws0wcOdYcmjIO3S9G0NucnJIR7Ija', NULL, 'nitto.sahadi@ui.ac.id', 10, 1432277723, 1432277723, '1991-07-02', 'Cilacap', 'n/a', 'Pria', '', 'SMA', 'mahasiswa', 0);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 15, true);


--
-- Name: ACTIVITY_LOG_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ACTIVITY_LOG"
    ADD CONSTRAINT "ACTIVITY_LOG_pkey" PRIMARY KEY ("User_ID", "Timestamp");


--
-- Name: ANSWER_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ANSWER"
    ADD CONSTRAINT "ANSWER_pkey" PRIMARY KEY ("User_ID", "Quiz_ID", "Question_ID", "Timestamp");


--
-- Name: CATEGORIZATION_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CATEGORIZATION"
    ADD CONSTRAINT "CATEGORIZATION_pkey" PRIMARY KEY ("Category_ID", "Subcategory_ID");


--
-- Name: CATEGORY_pkey1; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey1" PRIMARY KEY ("Category_ID");


--
-- Name: EMAIL_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "EMAIL"
    ADD CONSTRAINT "EMAIL_pkey" PRIMARY KEY ("ID");


--
-- Name: HISTORY_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "HISTORY"
    ADD CONSTRAINT "HISTORY_pkey" PRIMARY KEY ("User_ID", "Timestamp");


--
-- Name: QUESTION_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "QUESTION"
    ADD CONSTRAINT "QUESTION_pkey" PRIMARY KEY ("Question_ID");


--
-- Name: QUEST_CATEGORY_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "QUEST_CATEGORY"
    ADD CONSTRAINT "QUEST_CATEGORY_pkey" PRIMARY KEY ("Question_ID", "Category_ID");


--
-- Name: QUIZ_CONTENT_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "QUIZ_CONTENT"
    ADD CONSTRAINT "QUIZ_CONTENT_pkey" PRIMARY KEY ("Quiz_ID", "Question_ID");


--
-- Name: QUIZ_RESULT_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "QUIZ_RESULT"
    ADD CONSTRAINT "QUIZ_RESULT_pkey" PRIMARY KEY ("Result_ID");


--
-- Name: QUIZ_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "QUIZ"
    ADD CONSTRAINT "QUIZ_pkey" PRIMARY KEY ("Quiz_ID");


--
-- Name: SUB_CATEGORY_Subcategory_ID_key; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "SUB_CATEGORY"
    ADD CONSTRAINT "SUB_CATEGORY_Subcategory_ID_key" UNIQUE ("Subcategory_ID");


--
-- Name: SUB_CATEGORY_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "SUB_CATEGORY"
    ADD CONSTRAINT "SUB_CATEGORY_pkey" PRIMARY KEY ("Subcategory_text");


--
-- Name: TESTIMONY_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "TESTIMONY"
    ADD CONSTRAINT "TESTIMONY_pkey" PRIMARY KEY ("User_ID", "Timestamp");


--
-- Name: USER_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "USER"
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY ("ID");


--
-- Name: migration_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: ACTIVITY_LOG_User_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ACTIVITY_LOG"
    ADD CONSTRAINT "ACTIVITY_LOG_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ANSWER_Question_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ANSWER"
    ADD CONSTRAINT "ANSWER_Question_ID_fkey" FOREIGN KEY ("Question_ID") REFERENCES "QUESTION"("Question_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ANSWER_Quiz_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ANSWER"
    ADD CONSTRAINT "ANSWER_Quiz_ID_fkey" FOREIGN KEY ("Quiz_ID") REFERENCES "QUIZ"("Quiz_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ANSWER_Subcategory_text_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ANSWER"
    ADD CONSTRAINT "ANSWER_Subcategory_text_fkey" FOREIGN KEY ("Subcategory_text") REFERENCES "SUB_CATEGORY"("Subcategory_text") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ANSWER_User_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ANSWER"
    ADD CONSTRAINT "ANSWER_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CATEGORIZATION_Category_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORIZATION"
    ADD CONSTRAINT "CATEGORIZATION_Category_ID_fkey" FOREIGN KEY ("Category_ID") REFERENCES "CATEGORY"("Category_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CATEGORIZATION_Subcategory_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORIZATION"
    ADD CONSTRAINT "CATEGORIZATION_Subcategory_ID_fkey" FOREIGN KEY ("Subcategory_ID") REFERENCES "SUB_CATEGORY"("Subcategory_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HISTORY_Quiz_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "HISTORY"
    ADD CONSTRAINT "HISTORY_Quiz_ID_fkey" FOREIGN KEY ("Quiz_ID") REFERENCES "QUIZ"("Quiz_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HISTORY_Result_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "HISTORY"
    ADD CONSTRAINT "HISTORY_Result_ID_fkey" FOREIGN KEY ("Result_ID") REFERENCES "QUIZ_RESULT"("Result_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HISTORY_User_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "HISTORY"
    ADD CONSTRAINT "HISTORY_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QUIZ_CONTENT_Question_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUIZ_CONTENT"
    ADD CONSTRAINT "QUIZ_CONTENT_Question_ID_fkey" FOREIGN KEY ("Question_ID") REFERENCES "QUESTION"("Question_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QUIZ_CONTENT_Quiz_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUIZ_CONTENT"
    ADD CONSTRAINT "QUIZ_CONTENT_Quiz_ID_fkey" FOREIGN KEY ("Quiz_ID") REFERENCES "QUIZ"("Quiz_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QUIZ_RESULT_Quiz_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUIZ_RESULT"
    ADD CONSTRAINT "QUIZ_RESULT_Quiz_ID_fkey" FOREIGN KEY ("Quiz_ID") REFERENCES "QUIZ"("Quiz_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TESTIMONY_User_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "TESTIMONY"
    ADD CONSTRAINT "TESTIMONY_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

