/*
Navicat PGSQL Data Transfer

Source Server         : pgsql
Source Server Version : 90302
Source Host           : localhost:5432
Source Database       : elpos
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90302
File Encoding         : 65001

Date: 2014-02-15 16:43:11
*/


-- ----------------------------
-- Sequence structure for category_id_seq
-- ----------------------------
DROP SEQUENCE "public"."category_id_seq";
CREATE SEQUENCE "public"."category_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."category_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for dish_id_seq1
-- ----------------------------
DROP SEQUENCE "public"."dish_id_seq1";
CREATE SEQUENCE "public"."dish_id_seq1"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."dish_id_seq1"', 1, true);

-- ----------------------------
-- Sequence structure for joinrights_id_seq
-- ----------------------------
DROP SEQUENCE "public"."joinrights_id_seq";
CREATE SEQUENCE "public"."joinrights_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for menu_id_seq
-- ----------------------------
DROP SEQUENCE "public"."menu_id_seq";
CREATE SEQUENCE "public"."menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."menu_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for rights_id_seq
-- ----------------------------
DROP SEQUENCE "public"."rights_id_seq";
CREATE SEQUENCE "public"."rights_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."rights_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."roles_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for sales_id_seq
-- ----------------------------
DROP SEQUENCE "public"."sales_id_seq";
CREATE SEQUENCE "public"."sales_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for salestotal_id_seq
-- ----------------------------
DROP SEQUENCE "public"."salestotal_id_seq";
CREATE SEQUENCE "public"."salestotal_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for type_id_seq
-- ----------------------------
DROP SEQUENCE "public"."type_id_seq";
CREATE SEQUENCE "public"."type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."type_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."users_id_seq"', 1, true);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
"id" int4 DEFAULT nextval('category_id_seq'::regclass) NOT NULL,
"code" varchar COLLATE "default",
"name" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "public"."category" VALUES ('1', '0', 'Макарики', 'f');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS "public"."dish";
CREATE TABLE "public"."dish" (
"id" int4 DEFAULT nextval('dish_id_seq1'::regclass) NOT NULL,
"menu" int4,
"counts" int4,
"countsp" int4,
"orders" int4,
"users" int4,
"lastupdates" timestamp(6),
"timeleft" timestamp(6),
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO "public"."dish" VALUES ('1', '1', '11', '6', '5', '1', '2014-02-09 03:07:16', '2014-02-09 03:07:12', 'f');

-- ----------------------------
-- Table structure for joinrights
-- ----------------------------
DROP TABLE IF EXISTS "public"."joinrights";
CREATE TABLE "public"."joinrights" (
"id" int4 DEFAULT nextval('joinrights_id_seq'::regclass) NOT NULL,
"roles" int4,
"rights" int4,
"parametr" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of joinrights
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
"id" int4 DEFAULT nextval('menu_id_seq'::regclass) NOT NULL,
"code" varchar COLLATE "default",
"name" varchar COLLATE "default",
"netto" int4,
"percents" int4,
"type" int4,
"category" int4,
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO "public"."menu" VALUES ('1', '0', '2.01 Лапша Удон с курицей с индийским орехом', '1', '0', '1', '1', 'f');

-- ----------------------------
-- Table structure for rights
-- ----------------------------
DROP TABLE IF EXISTS "public"."rights";
CREATE TABLE "public"."rights" (
"id" int4 DEFAULT nextval('rights_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of rights
-- ----------------------------
INSERT INTO "public"."rights" VALUES ('1', 'admin', 'f');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
"id" int4 DEFAULT nextval('roles_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES ('1', 'admin', 'f');
INSERT INTO "public"."roles" VALUES ('2', 'Center', 'f');
INSERT INTO "public"."roles" VALUES ('3', 'Rest', 'f');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."sales";
CREATE TABLE "public"."sales" (
"id" int4 DEFAULT nextval('sales_id_seq'::regclass) NOT NULL,
"dish" int4,
"user" int4,
"menu" int4,
"realdate" date,
"logicdate" date,
"salestime" timestamp(6),
"closed" bool,
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of sales
-- ----------------------------

-- ----------------------------
-- Table structure for salestotal
-- ----------------------------
DROP TABLE IF EXISTS "public"."salestotal";
CREATE TABLE "public"."salestotal" (
"id" int4 DEFAULT nextval('salestotal_id_seq'::regclass) NOT NULL,
"user" int4,
"menu" varchar COLLATE "default",
"salesdate" date,
"salescounts" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of salestotal
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS "public"."type";
CREATE TABLE "public"."type" (
"id" int4 DEFAULT nextval('type_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO "public"."type" VALUES ('1', 'Блюдо', null);
INSERT INTO "public"."type" VALUES ('2', 'Компонент', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
"id" int8 DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
"roles" int4,
"name" varchar COLLATE "default",
"salesdate" date,
"deleted" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('1', '1', 'Admin', '2014-02-09', 'f');

-- ----------------------------
-- View structure for dishcenterView
-- ----------------------------
CREATE OR REPLACE VIEW "public"."dishcenterView" AS 
 SELECT d.id,
    u.name AS users,
    m.name,
    d.counts,
    d.countsp,
    d.lastupdates,
    d.timeleft
   FROM ((dish d
   LEFT JOIN menu m ON ((m.id = d.menu)))
   LEFT JOIN users u ON ((u.id = d.users)))
  WHERE (((d.deleted = false) AND (m.deleted = false)) AND (u.deleted = false))
  ORDER BY d.id, m.name;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."category_id_seq" OWNED BY "category"."id";
ALTER SEQUENCE "public"."dish_id_seq1" OWNED BY "dish"."id";
ALTER SEQUENCE "public"."joinrights_id_seq" OWNED BY "joinrights"."id";
ALTER SEQUENCE "public"."menu_id_seq" OWNED BY "menu"."id";
ALTER SEQUENCE "public"."rights_id_seq" OWNED BY "rights"."id";
ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "roles"."id";
ALTER SEQUENCE "public"."sales_id_seq" OWNED BY "sales"."id";
ALTER SEQUENCE "public"."salestotal_id_seq" OWNED BY "salestotal"."id";
ALTER SEQUENCE "public"."type_id_seq" OWNED BY "type"."id";
ALTER SEQUENCE "public"."users_id_seq" OWNED BY "users"."id";

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dish
-- ----------------------------
ALTER TABLE "public"."dish" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table joinrights
-- ----------------------------
ALTER TABLE "public"."joinrights" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rights
-- ----------------------------
ALTER TABLE "public"."rights" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sales
-- ----------------------------
ALTER TABLE "public"."sales" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table salestotal
-- ----------------------------
ALTER TABLE "public"."salestotal" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table type
-- ----------------------------
ALTER TABLE "public"."type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."dish"
-- ----------------------------
ALTER TABLE "public"."dish" ADD FOREIGN KEY ("users") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."dish" ADD FOREIGN KEY ("menu") REFERENCES "public"."menu" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."joinrights"
-- ----------------------------
ALTER TABLE "public"."joinrights" ADD FOREIGN KEY ("roles") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."joinrights" ADD FOREIGN KEY ("rights") REFERENCES "public"."rights" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."menu"
-- ----------------------------
ALTER TABLE "public"."menu" ADD FOREIGN KEY ("category") REFERENCES "public"."category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."menu" ADD FOREIGN KEY ("type") REFERENCES "public"."type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."users"
-- ----------------------------
ALTER TABLE "public"."users" ADD FOREIGN KEY ("roles") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
