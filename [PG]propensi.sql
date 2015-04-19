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
    "Timestamp" timestamp without time zone NOT NULL,
    "Answer_text" text NOT NULL,
    "Subcategory_text" character varying(50) NOT NULL
);


ALTER TABLE "ANSWER" OWNER TO postgres;

--
-- Name: CATEGORIZATION; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "CATEGORIZATION" (
    "Category_ID" integer NOT NULL,
    "Subcategory_text" character varying(50) NOT NULL
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
    "Weight" integer DEFAULT 0 NOT NULL,
    "Category_ID" integer NOT NULL
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
-- Name: QUIZ; Type: TABLE; Schema: propensi; Owner: postgres; Tablespace: 
--

CREATE TABLE "QUIZ" (
    "Quiz_ID" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "Description" text NOT NULL,
	"flag" integer DEFAULT 0 NOT NULL
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
    "Counter" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "SUB_CATEGORY" OWNER TO postgres;

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
-- Name: User_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ACTIVITY_LOG" ALTER COLUMN "User_ID" SET DEFAULT nextval('"ACTIVITY_LOG_User_ID_seq"'::regclass);


--
-- Name: Category_ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORY" ALTER COLUMN "Category_ID" SET DEFAULT nextval('"CATEGORY_Category_ID_seq"'::regclass);


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
-- Name: ID; Type: DEFAULT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "USER" ALTER COLUMN "ID" SET DEFAULT nextval('"USER_ID_seq"'::regclass);


--
-- Data for Name: ACTIVITY_LOG; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-04-09 16:40:47', 'Membuat database sambil main coc');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-04-10 05:26:12', 'Memberikan testimoni');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-04-10 05:27:22', 'Membuat subkategori baru');
INSERT INTO "ACTIVITY_LOG" VALUES (1, '2015-04-10 05:27:33', 'Membuat kategori baru');


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


--
-- Data for Name: CATEGORIZATION; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "CATEGORIZATION" VALUES (22, 'Akhir kuliah');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Akhir SMA');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Akhir SMA');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Akhir SMP');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Aktifitas Serius');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Aktivitas');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Aktivitas Berkesinambungan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Aktivitas Bermanfaat');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Aktivitas Ekonomi');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Aktivitas Ekonomi Rutin');
INSERT INTO "CATEGORIZATION" VALUES (10, 'Aktivitas finansial');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Aktivitas Karir');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Aktivitas kehidupan');
INSERT INTO "CATEGORIZATION" VALUES (6, 'Aktivitas masa depan');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Aktivitas menyenangkan');
INSERT INTO "CATEGORIZATION" VALUES (5, 'Aktivitas menyenangkan');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Aktivitas Rutin');
INSERT INTO "CATEGORIZATION" VALUES (11, 'Aktivitas sehari-hari');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Aktivitas sesuai minat');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Aktualisasi diri');
INSERT INTO "CATEGORIZATION" VALUES (13, 'aktvitas Menghasilkan');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Ambisi diri');
INSERT INTO "CATEGORIZATION" VALUES (45, 'Apresiasi kerja');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Awal Karir');
INSERT INTO "CATEGORIZATION" VALUES (44, 'Awal kuliah');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Awal kuliah');
INSERT INTO "CATEGORIZATION" VALUES (26, 'Awal penjurusan SMA');
INSERT INTO "CATEGORIZATION" VALUES (44, 'awal sekolah');
INSERT INTO "CATEGORIZATION" VALUES (44, 'Awal SMA');
INSERT INTO "CATEGORIZATION" VALUES (26, 'Awal SMA');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Bagian Karir');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Bagian penting dalam hidup');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Bagian penting kehidupan');
INSERT INTO "CATEGORIZATION" VALUES (46, 'Beban');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Bidang Karir');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Cara Survival');
INSERT INTO "CATEGORIZATION" VALUES (48, 'Dewasa Awal');
INSERT INTO "CATEGORIZATION" VALUES (38, 'Diri Sendiri');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Ekspresi diri');
INSERT INTO "CATEGORIZATION" VALUES (31, 'Entry-Level');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Entry-Level');
INSERT INTO "CATEGORIZATION" VALUES (39, 'Guru');
INSERT INTO "CATEGORIZATION" VALUES (11, 'Hal biasa');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Hal sulit');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Hal Tak Mudah');
INSERT INTO "CATEGORIZATION" VALUES (5, 'Hobi');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Ibadah ');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Impian');
INSERT INTO "CATEGORIZATION" VALUES (17, 'Jabatan ');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Jalan hidup');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Jalan kesuksesan');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Jalan kesuksesan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Jati diri');
INSERT INTO "CATEGORIZATION" VALUES (17, 'Jenis/Nama Jabatan');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Jenjang jabatan');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Jenjang pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (7, 'keahlian');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Keahlian Menghasilkan');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Keberlangsungan Hidup');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Kebutuhan keluarga');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Kebutuhan setiap orang');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Kegiatan Produktif');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Kegiatan Spesifik');
INSERT INTO "CATEGORIZATION" VALUES (36, 'Keluarga');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Kemajuan pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Kemapanan bekerja');
INSERT INTO "CATEGORIZATION" VALUES (5, 'Kepuasan kerja');
INSERT INTO "CATEGORIZATION" VALUES (35, 'Kerabat ');
INSERT INTO "CATEGORIZATION" VALUES (34, 'kerabat berpengalaman');
INSERT INTO "CATEGORIZATION" VALUES (35, 'Kerabat Pasangan');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Kerja');
INSERT INTO "CATEGORIZATION" VALUES (5, 'Kesenangan');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Kesuksesan');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Kesuksesan hidup');
INSERT INTO "CATEGORIZATION" VALUES (45, 'Kesuksesan pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Ketika di toilet, ingin tidur');
INSERT INTO "CATEGORIZATION" VALUES (24, 'ketika mulai mengenal orang lain');
INSERT INTO "CATEGORIZATION" VALUES (46, 'Kewajiban');
INSERT INTO "CATEGORIZATION" VALUES (12, 'Komitmen');
INSERT INTO "CATEGORIZATION" VALUES (3, 'Kompetensi');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Kompetensi');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Komponen Karir');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Kuliah');
INSERT INTO "CATEGORIZATION" VALUES (29, 'Kuliah');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Kuliah akhir');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Kuliah akhir');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Kuliah Tingkat Akhir');
INSERT INTO "CATEGORIZATION" VALUES (46, 'Kumpulan Tugas');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Label');
INSERT INTO "CATEGORIZATION" VALUES (31, 'Level fresh graduate');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Level fresh graduate');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Level skill');
INSERT INTO "CATEGORIZATION" VALUES (33, 'Lingkungan Pertemanan');
INSERT INTO "CATEGORIZATION" VALUES (33, 'Lingkungan Pertemanan, keluarga');
INSERT INTO "CATEGORIZATION" VALUES (35, 'Lingkungan Terdekat');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus kuliah');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus pendidikan');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus pendidikan profesi');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Lulus SD');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus sekolah');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus SMA');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Lulus SMA');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Lulus SMP');
INSERT INTO "CATEGORIZATION" VALUES (26, 'Lulus SMP');
INSERT INTO "CATEGORIZATION" VALUES (24, 'malam hari');
INSERT INTO "CATEGORIZATION" VALUES (6, 'Masa depan');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Mata Pencaharian');
INSERT INTO "CATEGORIZATION" VALUES (25, 'Memulai pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Menghasilkan Sesuatu');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Menghasilkan Seusatu');
INSERT INTO "CATEGORIZATION" VALUES (44, 'menjelang');
INSERT INTO "CATEGORIZATION" VALUES (52, 'menjelang berkeluarga');
INSERT INTO "CATEGORIZATION" VALUES (25, 'Menjelang kerja');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Menjelang kuliah');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Menunjukkan Kemandirian');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Meraih kesempatan');
INSERT INTO "CATEGORIZATION" VALUES (31, 'Mid- Level kerja');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Minat');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Mulai dari sekarang');
INSERT INTO "CATEGORIZATION" VALUES (31, 'Mulai Pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (34, 'Orang Berpengalaman');
INSERT INTO "CATEGORIZATION" VALUES (35, 'Orang Terdekat');
INSERT INTO "CATEGORIZATION" VALUES (36, 'Orang Tua');
INSERT INTO "CATEGORIZATION" VALUES (34, 'Orang yang sukses berkarir');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Pada malam hari');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Pada saat bangun pagi');
INSERT INTO "CATEGORIZATION" VALUES (51, 'pada saat saya nyaman');
INSERT INTO "CATEGORIZATION" VALUES (24, 'pagi hari');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Parameter kesuksesan');
INSERT INTO "CATEGORIZATION" VALUES (37, 'Pasangan');
INSERT INTO "CATEGORIZATION" VALUES (12, 'Passion');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Passion');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Pembelajaran kerja');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Pemenuhan Kebutuhan ');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Pemenuhan Kebutuhan Hidup');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Pencapaian cita cita');
INSERT INTO "CATEGORIZATION" VALUES (45, 'Pencapaian diri');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Pencapaian hidup');
INSERT INTO "CATEGORIZATION" VALUES (45, 'Pencapaian pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Pencapaian Target');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Pencapaian tertinggi pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Pencapaian Tujuan');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Pencapaian Tujuan Tertentu');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Penentu hidup');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Pengabdian Keluarga');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Pengalaman ');
INSERT INTO "CATEGORIZATION" VALUES (23, 'Pengalaman kerja');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Pengembangan diri');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Pengembangan minat');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Pengembangan potensi');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Pengembangan skill');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Peningkatan diri dalam kehidupan');
INSERT INTO "CATEGORIZATION" VALUES (3, 'Peningkatan kompetensi');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Peningkatan target');
INSERT INTO "CATEGORIZATION" VALUES (26, 'Penjurusan SMA');
INSERT INTO "CATEGORIZATION" VALUES (15, 'Penunjang Karir');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Penunjang kehidupan');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Perjalanan hidup');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Perjalanan pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Perkembangan diri');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Perkembangan pekerjaan');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Perkembangan Profesi');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Pilihan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Pilihan Aktivitas');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Pilihan hidup');
INSERT INTO "CATEGORIZATION" VALUES (38, 'Potensi');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Predikat');
INSERT INTO "CATEGORIZATION" VALUES (45, 'Prestasi');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Produktif');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Produktivitas');
INSERT INTO "CATEGORIZATION" VALUES (2, 'Profesi');
INSERT INTO "CATEGORIZATION" VALUES (3, 'Profesionalisme');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Profesionalisme');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Profesionalitas');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Proses kehidupan');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Proses perubahan nilai');
INSERT INTO "CATEGORIZATION" VALUES (38, 'Rasa Senang');
INSERT INTO "CATEGORIZATION" VALUES (33, 'Rekan Kerja');
INSERT INTO "CATEGORIZATION" VALUES (32, 'Remaja');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Remaja');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Saat ini');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Saat ini dan seterusnya');
INSERT INTO "CATEGORIZATION" VALUES (22, 'Saat kuliah');
INSERT INTO "CATEGORIZATION" VALUES (29, 'Saat kuliah');
INSERT INTO "CATEGORIZATION" VALUES (26, 'Saat penjurusan SMA');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Saat pindah kerja');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Saat proses mengakhiri pendidikan');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Saat remaja');
INSERT INTO "CATEGORIZATION" VALUES (29, 'Saat sekolah');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Saat sekolah');
INSERT INTO "CATEGORIZATION" VALUES (51, 'saat sudah menguntungkan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Aktualisasi Diri');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Berkarir');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Berkarya');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Sarana Bertahan Hidup');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Implementasi Keahlian');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Sarana Mencapai Hidup Layak');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sarana Menimba Ilmu');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Sarana Meningkatkan Taraf Hidup');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Meraih Karir');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sarana Pengembangan Diri');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Pengembangan Karir');
INSERT INTO "CATEGORIZATION" VALUES (47, 'Sarana Survival');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sarana Unjuk Kompetensi');
INSERT INTO "CATEGORIZATION" VALUES (5, 'Satu Kesenangan');
INSERT INTO "CATEGORIZATION" VALUES (36, 'Saudara');
INSERT INTO "CATEGORIZATION" VALUES (30, 'SD');
INSERT INTO "CATEGORIZATION" VALUES (27, 'SD');
INSERT INTO "CATEGORIZATION" VALUES (51, 'Sebelum menikah');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sebelum menikah');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Secepatnya');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Sedini mungkin');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Sejak kecil');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sejak manusia bisa berpikir');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan citra diri');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Sejalan hobi');
INSERT INTO "CATEGORIZATION" VALUES (8, 'sejalan keinginan ');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan keinginan sukses');
INSERT INTO "CATEGORIZATION" VALUES (8, 'sejalan kemampuan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan kemampuan diri');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan Kemandirian');
INSERT INTO "CATEGORIZATION" VALUES (28, 'Sejalan kesempatan');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sejalan kesempatan');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan kesiapan diri');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan kesiapan diri');
INSERT INTO "CATEGORIZATION" VALUES (53, 'Sejalan kondisi finansial');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sejalan kondisi finansial');
INSERT INTO "CATEGORIZATION" VALUES (9, 'sejalan kontribusi kerja');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan minat');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan passion');
INSERT INTO "CATEGORIZATION" VALUES (28, 'sejalan peluang ');
INSERT INTO "CATEGORIZATION" VALUES (28, 'sejalan peluang karir');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sejalan pemahaman diri');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan pemahaman karir');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan pemahaman karir');
INSERT INTO "CATEGORIZATION" VALUES (53, 'sejalan pemenuhan kebutuhan ');
INSERT INTO "CATEGORIZATION" VALUES (23, 'Sejalan pengalaman kerja');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan pengalaman kerja');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan Perkembangan Bakat');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Sejalan perkembangan diri');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Sejalan perkembangan diri');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan potensi diri');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Sejalan tanggungjawab');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Sejalan target');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Sejalan target');
INSERT INTO "CATEGORIZATION" VALUES (40, 'Senior');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Setelah berkeluarga');
INSERT INTO "CATEGORIZATION" VALUES (21, 'Setelah lulus SMA');
INSERT INTO "CATEGORIZATION" VALUES (27, 'Setelah memutuskan akan mengambil jalur');
INSERT INTO "CATEGORIZATION" VALUES (52, 'setelah menikah');
INSERT INTO "CATEGORIZATION" VALUES (51, 'Situasional');
INSERT INTO "CATEGORIZATION" VALUES (24, 'Situasional');
INSERT INTO "CATEGORIZATION" VALUES (30, 'SMA');
INSERT INTO "CATEGORIZATION" VALUES (26, 'SMA');
INSERT INTO "CATEGORIZATION" VALUES (21, 'SMA Akhir');
INSERT INTO "CATEGORIZATION" VALUES (22, 'SMA Akhir');
INSERT INTO "CATEGORIZATION" VALUES (30, 'SMP');
INSERT INTO "CATEGORIZATION" VALUES (26, 'SMP');
INSERT INTO "CATEGORIZATION" VALUES (26, 'SMP Akhir');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Sumber Nafkah');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Sumber Pendapatan');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Sumber penghasilan');
INSERT INTO "CATEGORIZATION" VALUES (10, 'Sumber penghasilan');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Sumber Riset');
INSERT INTO "CATEGORIZATION" VALUES (19, 'Tahap perkembangan hidup');
INSERT INTO "CATEGORIZATION" VALUES (4, 'Tangga kesuksesan');
INSERT INTO "CATEGORIZATION" VALUES (18, 'Tanggung jawab');
INSERT INTO "CATEGORIZATION" VALUES (12, 'Tanggungjawab');
INSERT INTO "CATEGORIZATION" VALUES (9, 'Target diri');
INSERT INTO "CATEGORIZATION" VALUES (33, 'Teman');
INSERT INTO "CATEGORIZATION" VALUES (42, 'Tidak Ada');
INSERT INTO "CATEGORIZATION" VALUES (10, 'Transaksi imbal jasa');
INSERT INTO "CATEGORIZATION" VALUES (46, 'Tugas');
INSERT INTO "CATEGORIZATION" VALUES (43, 'Tuhan');
INSERT INTO "CATEGORIZATION" VALUES (1, 'Tujuan hidup');
INSERT INTO "CATEGORIZATION" VALUES (46, 'Tuntutan');
INSERT INTO "CATEGORIZATION" VALUES (13, 'uang');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Uang Rutinitas');
INSERT INTO "CATEGORIZATION" VALUES (13, 'Uang, Menghasilkan Sesuatu');
INSERT INTO "CATEGORIZATION" VALUES (16, 'Usaha');
INSERT INTO "CATEGORIZATION" VALUES (7, 'Usaha diri');
INSERT INTO "CATEGORIZATION" VALUES (49, 'usia ');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Usia 20-an');
INSERT INTO "CATEGORIZATION" VALUES (48, 'Usia 20an');
INSERT INTO "CATEGORIZATION" VALUES (48, 'Usia 25an');
INSERT INTO "CATEGORIZATION" VALUES (48, 'Usia 30an');
INSERT INTO "CATEGORIZATION" VALUES (50, 'Usia 50an');
INSERT INTO "CATEGORIZATION" VALUES (48, 'Usia dewasa');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Usia dewasa');
INSERT INTO "CATEGORIZATION" VALUES (50, 'Usia Lanjut');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Usia muda');
INSERT INTO "CATEGORIZATION" VALUES (20, 'Usia produktif');
INSERT INTO "CATEGORIZATION" VALUES (49, 'Usia produktif');
INSERT INTO "CATEGORIZATION" VALUES (8, 'Wadah');
INSERT INTO "CATEGORIZATION" VALUES (29, 'waktu kuliah');


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


--
-- Name: CATEGORY_Category_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"CATEGORY_Category_ID_seq"', 54, false);


--
-- Data for Name: HISTORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "HISTORY" VALUES (1, '2015-04-09 16:33:36', 1, 1);


--
-- Data for Name: QUESTION; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUESTION" VALUES (1, 'Menurut saya, karir adalah', 0, 1);
INSERT INTO "QUESTION" VALUES (2, 'Menurut saya , pekerjaan adalah', 0, 2);
INSERT INTO "QUESTION" VALUES (3, 'Menurut saya, waktu yang paling tepat untuk mulai memikirkan karir adalah', 0, 3);
INSERT INTO "QUESTION" VALUES (4, ' ', 0, 4);
INSERT INTO "QUESTION" VALUES (5, 'Orang-orang yang saya mintai pendapat/masukan sebelum saya memutuskan pilihan karir saya adalah', 0, 5);


--
-- Name: QUESTION_Question_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUESTION_Question_ID_seq"', 6, false);


--
-- Data for Name: QUIZ; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ" VALUES (1, 'Kuesioner Kesiapan Karir', 'Lorem ipsum dolor sit amet', 0);


--
-- Data for Name: QUIZ_CONTENT; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ_CONTENT" VALUES (1, 1);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 2);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 3);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 4);
INSERT INTO "QUIZ_CONTENT" VALUES (1, 5);


--
-- Name: QUIZ_Quiz_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUIZ_Quiz_ID_seq"', 2, false);


--
-- Data for Name: QUIZ_RESULT; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "QUIZ_RESULT" VALUES (1, 1, 'Sukses', 'Selamat! Anda merupakan pengunjung yang pertama');


--
-- Name: QUIZ_RESULT_Result_ID_seq; Type: SEQUENCE SET; Schema: propensi; Owner: postgres
--

SELECT pg_catalog.setval('"QUIZ_RESULT_Result_ID_seq"', 2, false);


--
-- Data for Name: SUB_CATEGORY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "SUB_CATEGORY" VALUES ('Akhir kuliah', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Akhir SMA', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Akhir SMP', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktifitas Serius', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas', 14);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Berkesinambungan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Bermanfaat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Ekonomi', 68);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Ekonomi Rutin', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas finansial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas kehidupan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas masa depan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas menyenangkan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas Rutin', 37);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas sehari-hari', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktivitas sesuai minat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Aktualisasi diri', 12);
INSERT INTO "SUB_CATEGORY" VALUES ('aktvitas Menghasilkan', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('Ambisi diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('anak saya, suami, dan oarang tua', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('apakah karir tersebut dapat memberikan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Apresiasi kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal kuliah', 21);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal penjurusan SMA', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('awal sekolah', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Awal SMA', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian penting dalam hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Bagian penting kehidupan', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('bakat', 15);
INSERT INTO "SUB_CATEGORY" VALUES ('bakat nyaman lingkungan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Beban', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Bermanfaat bagi orang lain', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('berpengalaman', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Bidang Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('bidang pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Cara Survival', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('cita-cita', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('cita-cita saya', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('dana', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Dewasa Awal', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Diri Sendiri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('dosen', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('dukungan keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('dukungan sosial', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('ekonomi keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Ekspresi diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Entry-Level', 7);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor inchi faktor bakat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor kelebihan dalam bidang apa', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor kesehatan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor keyakinan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor lingkungan dan apa yang dibutuhkan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor pekerjaan', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('faktor sosial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('fasilitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('finansial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('gaji', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('gaji fasilitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('gender', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Guru', 45);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal biasa', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal sulit', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Hal Tak Mudah', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('harapan keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('harapan tantangan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Hobi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('hoi bakat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Ibadah ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('ibadan ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('idealisme', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Impian', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('impian tujuan hidup saya', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Implementasi Minat', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('informasi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Jabatan ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Jalan hidup', 16);
INSERT INTO "SUB_CATEGORY" VALUES ('Jalan kesuksesan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Jati diri', 15);
INSERT INTO "SUB_CATEGORY" VALUES ('jenis karir lokasi prospek', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('jenis pekerjaan', 7);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenis/Nama Jabatan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenjang jabatan', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('jenjang karir', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('Jenjang pekerjaan', 79);
INSERT INTO "SUB_CATEGORY" VALUES ('jenjang pendidikan, prestasi,  skill', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('jurusan kuliah', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('karir', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('keahlian', 9);
INSERT INTO "SUB_CATEGORY" VALUES ('keahlian dalam bidang tertentu', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Keahlian Menghasilkan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Keberlangsungan Hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kebutuhan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kebutuhan keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kebutuhan setiap orang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kegiatan Produktif', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kegiatan Spesifik', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('keinginan', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('keinginan diri dari masa depan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kelebihan dan kekurangannya faktor', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Keluarga', 205);
INSERT INTO "SUB_CATEGORY" VALUES ('keluarga, pacar, teman', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Kemajuan pekerjaan', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('kemampuan', 19);
INSERT INTO "SUB_CATEGORY" VALUES ('kemampuan, kelebihan dan kekurangan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kemapanan bekerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kenikamatan dalam pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kenyamanan', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('kepuasan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kepuasan kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerabat ', 31);
INSERT INTO "SUB_CATEGORY" VALUES ('kerabat berpengalaman', 22);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerabat Pasangan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kerja', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('kesempatan', 15);
INSERT INTO "SUB_CATEGORY" VALUES ('kesempatan berkembang', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesenangan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kesesuaian dengan kemampuan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kesesuaian karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kesukaan kemampuan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kesukaan, keseharian, potensi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kesuksesan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('ketertarikan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('ketertarikan dan pemahaman', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Ketika di toilet, ingin tidur', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('ketika mulai mengenal orang lain', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('keuangan, jalan hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('keuntungan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Kewajiban', 13);
INSERT INTO "SUB_CATEGORY" VALUES ('Komitmen', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kompetensi', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Komponen Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi finansial', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi fisik', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('kondisi pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah akhir', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Kuliah Tingkat Akhir', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('Kumpulan Tugas', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Label', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Level fresh graduate', 7);
INSERT INTO "SUB_CATEGORY" VALUES ('Level skill', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan ', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan kerja', 11);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Pertemanan', 96);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Pertemanan, keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Lingkungan Terdekat', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan, pendidikan, kesehatan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('lingkungan, pergaulan, orang tua', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('lowongan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus kuliah', 19);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus pendidikan', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus pendidikan profesi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SD', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus sekolah', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SMA', 17);
INSERT INTO "SUB_CATEGORY" VALUES ('Lulus SMP', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('malam hari', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('manfaat sosial', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Masa depan', 22);
INSERT INTO "SUB_CATEGORY" VALUES ('Mata Pencaharian', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Memulai pekerjaan', 7);
INSERT INTO "SUB_CATEGORY" VALUES ('mengabdi di masyarakat dukungan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Menghasilkan Sesuatu', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Menghasilkan Seusatu', 17);
INSERT INTO "SUB_CATEGORY" VALUES ('mengubah kehidupan jadi lebih baik', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('menjelang', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('menjelang berkeluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Menjelang kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Menjelang kuliah', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Menunjukkan Kemandirian', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Meraih kesempatan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Mid- Level kerja', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Minat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('minat jika sudah menikah', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('minat, bakat, dan/atau hobi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Mulai dari sekarang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Mulai Pekerjaan', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('nasib ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('nilai keyakinan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('nilai sosial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('orang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Berpengalaman', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Terdekat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang Tua', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('orang tua dan lingkungan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Orang yang sukses berkarir', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Pada malam hari', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pada saat bangun pagi', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('pada saat saya nyaman', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('pagi hari', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('pandangan orang lain', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('pandangan sosial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Parameter kesuksesan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pasangan', 18);
INSERT INTO "SUB_CATEGORY" VALUES ('Passion', 12);
INSERT INTO "SUB_CATEGORY" VALUES ('passion and salary', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('passion, lingkungan, pemerintahan, ilmu', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pekerjaan', 89);
INSERT INTO "SUB_CATEGORY" VALUES ('pekerjaan yang gampang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pembelajaran kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pemenuhan Kebutuhan ', 41);
INSERT INTO "SUB_CATEGORY" VALUES ('Pemenuhan Kebutuhan Hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian cita cita', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian diri', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian pekerjaan', 29);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Target', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian tertinggi pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Tujuan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pencapaian Tujuan Tertentu', 17);
INSERT INTO "SUB_CATEGORY" VALUES ('pendapatan', 44);
INSERT INTO "SUB_CATEGORY" VALUES ('pendapatan kelak', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('pendidikan', 15);
INSERT INTO "SUB_CATEGORY" VALUES ('Penentu hidup', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengabdian Keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengalaman ', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengalaman kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan diri', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan minat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan potensi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pengembangan skill', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('penghasilan karir tersebut', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan diri dalam kehidupan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan kompetensi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Peningkatan target', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Penjurusan SMA', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Penunjang Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Penunjang kehidupan', 22);
INSERT INTO "SUB_CATEGORY" VALUES ('Perjalanan hidup', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Perjalanan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Perkembangan Profesi', 0);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan Aktivitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Pilihan hidup', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('pilihan karir ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('pola kerja', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Potensi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('potensi masa depan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('potensi pengembangan diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Predikat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Prestasi', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('prestige', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Produktif', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Produktivitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesi', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesionalisme', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Profesionalitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Proses kehidupan', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Proses perubahan nilai', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Rasa Senang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('referensi keluarga', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Rekan Kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('relasi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Remaja', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('reward', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('risiko', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat ini', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat ini dan seterusnya', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat kuliah', 23);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat penjurusan SMA', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat pindah kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat proses mengakhiri pendidikan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat remaja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saat sekolah', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('saat sudah menguntungkan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sahabat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sanggup akan tuntutan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Aktualisasi Diri', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Berkarir', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Berkarya', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Bertahan Hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Implementasi Keahlian', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sarana kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Mencapai Hidup Layak', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Menimba Ilmu', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Meningkatkan Taraf Hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Meraih Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Pengembangan Diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Pengembangan Karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Survival', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sarana Unjuk Kompetensi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Satu Kesenangan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Saudara', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('SD', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('Sebelum menikah', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Secepatnya', 7);
INSERT INTO "SUB_CATEGORY" VALUES ('Sedini mungkin', 19);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejak kecil', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejak manusia bisa berpikir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan citra diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan hobi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan keinginan ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan keinginan sukses', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan kemampuan', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kemampuan diri', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan Kemandirian', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kesempatan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kesiapan diri', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan kondisi finansial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan kontribusi kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan minat', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan passion', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan peluang ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan peluang karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pemahaman diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pemahaman karir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sejalan pemenuhan kebutuhan ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan pengalaman kerja', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan Perkembangan Bakat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan perkembangan diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan potensi diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan tanggungjawab', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sejalan target', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('semangat', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('senang dengan pekerjaan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('senang nyaman mengerti', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Senior', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('sesuai dengan passion', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sesuai dengan profesi dan minat', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah berkeluarga', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah lulus SMA', 24);
INSERT INTO "SUB_CATEGORY" VALUES ('Setelah memutuskan akan mengambil jalur', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('setelah menikah', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('situasi dan kondisi', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('situasi kerja', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Situasional', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('skill', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('SMA', 54);
INSERT INTO "SUB_CATEGORY" VALUES ('SMA Akhir', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('SMP', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('SMP Akhir', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('sosial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Status Sosial', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('suami orang tua anak', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('suasana kerja', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Nafkah', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Pendapatan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber penghasilan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Sumber Riset', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('SWOT saat menganalisis diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Tahap perkembangan hidup', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Tangga kesuksesan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Tanggung jawab', 19);
INSERT INTO "SUB_CATEGORY" VALUES ('Tanggungjawab', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Target diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Teman', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Tidak Ada', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('tidak sesuai bidang, gaji kecil', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('tingkat kepercayaan dari bidang', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Transaksi imbal jasa', 0);
INSERT INTO "SUB_CATEGORY" VALUES ('Tugas', 5);
INSERT INTO "SUB_CATEGORY" VALUES ('Tuhan', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Tujuan hidup', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Tuntutan', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('uang', 4);
INSERT INTO "SUB_CATEGORY" VALUES ('Uang Rutinitas', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Uang, Menghasilkan Sesuatu', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Usaha', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Usaha diri', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('usia ', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 20-an', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 20an', 6);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 25an', 3);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 30an', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia 50an', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia dewasa', 2);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia Lanjut', 1);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia muda', 24);
INSERT INTO "SUB_CATEGORY" VALUES ('Usia produktif', 8);
INSERT INTO "SUB_CATEGORY" VALUES ('Wadah', 10);
INSERT INTO "SUB_CATEGORY" VALUES ('waktu kuliah', 23);


--
-- Data for Name: TESTIMONY; Type: TABLE DATA; Schema: propensi; Owner: postgres
--

INSERT INTO "TESTIMONY" VALUES (1, '2015-04-09 16:28:12', 'lorem ipsum dolor sit amet');


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
    ADD CONSTRAINT "CATEGORIZATION_pkey" PRIMARY KEY ("Category_ID", "Subcategory_text");


--
-- Name: CATEGORY_pkey1; Type: CONSTRAINT; Schema: propensi; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey1" PRIMARY KEY ("Category_ID");


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
-- Name: ACTIVITY_LOG_User_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "ACTIVITY_LOG"
    ADD CONSTRAINT "ACTIVITY_LOG_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "USER"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


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
    ADD CONSTRAINT "ANSWER_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "USER"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CATEGORIZATION_Category_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORIZATION"
    ADD CONSTRAINT "CATEGORIZATION_Category_ID_fkey" FOREIGN KEY ("Category_ID") REFERENCES "CATEGORY"("Category_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CATEGORIZATION_Subcategory_text_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "CATEGORIZATION"
    ADD CONSTRAINT "CATEGORIZATION_Subcategory_text_fkey" FOREIGN KEY ("Subcategory_text") REFERENCES "SUB_CATEGORY"("Subcategory_text") ON UPDATE CASCADE ON DELETE CASCADE;


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
    ADD CONSTRAINT "HISTORY_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "USER"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QUESTION_Category_ID_fkey; Type: FK CONSTRAINT; Schema: propensi; Owner: postgres
--

ALTER TABLE ONLY "QUESTION"
    ADD CONSTRAINT "QUESTION_Category_ID_fkey" FOREIGN KEY ("Category_ID") REFERENCES "CATEGORY"("Category_ID") ON UPDATE CASCADE ON DELETE CASCADE;


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
    ADD CONSTRAINT "TESTIMONY_User_ID_fkey" FOREIGN KEY ("User_ID") REFERENCES "USER"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


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

