/*
 Navicat Premium Data Transfer

 Source Server         : parking
 Source Server Type    : PostgreSQL
 Source Server Version : 90305
 Source Host           : localhost:5432
 Source Catalog        : parking1
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90305
 File Encoding         : 65001

 Date: 02/07/2018 13:16:54
*/


-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS "public"."coupon";
CREATE TABLE "public"."coupon" (
  "couponid" uuid NOT NULL,
  "approvalsysuserid" uuid,
  "createsysuserid" uuid,
  "couponcode" varchar(40) COLLATE "pg_catalog"."default",
  "coupontype" varchar(2) COLLATE "pg_catalog"."default",
  "ratio" float8,
  "cost" float8,
  "validbegindate" date,
  "validenddate" date,
  "state" varchar(2) COLLATE "pg_catalog"."default",
  "createtime" date,
  "totalnum" int4,
  "residuenum" int4
)
;

-- ----------------------------
-- Table structure for freetimetmp
-- ----------------------------
DROP TABLE IF EXISTS "public"."freetimetmp";
CREATE TABLE "public"."freetimetmp" (
  "freetimetmpid" uuid NOT NULL,
  "orduserid" uuid,
  "name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "isvalid" varchar(2) COLLATE "pg_catalog"."default" NOT NULL,
  "note" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for freetimetmprule
-- ----------------------------
DROP TABLE IF EXISTS "public"."freetimetmprule";
CREATE TABLE "public"."freetimetmprule" (
  "freetimetmpruleid" uuid NOT NULL,
  "freetimetmpid" uuid,
  "freetimebucketbegin" timestamp(6) NOT NULL,
  "freetimebucketend" timestamp(6) NOT NULL,
  "ruletype" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "unitprice" float8,
  "unittimelong" float4,
  "startprice" float8,
  "starttimelong" float4,
  "punishunitprice" float8,
  "punishunittimelong" float4,
  "punishtype" char(1) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for orduser
-- ----------------------------
DROP TABLE IF EXISTS "public"."orduser";
CREATE TABLE "public"."orduser" (
  "orduserid" uuid NOT NULL,
  "loginname" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "loginpwd" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "nickname" varchar(40) COLLATE "pg_catalog"."default",
  "realname" varchar(20) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(40) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "sex" varchar(2) COLLATE "pg_catalog"."default",
  "registertime" date,
  "notes" varchar(200) COLLATE "pg_catalog"."default",
  "state" varchar(2) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '1'::character varying,
  "identitynum" varchar(20) COLLATE "pg_catalog"."default",
  "identitypic" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of orduser
-- ----------------------------
INSERT INTO "public"."orduser" VALUES ('1dad42f1-3d53-498e-96e5-f3feea3845c2', 'liyuan', '123456', NULL, '李源', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for parkinglot
-- ----------------------------
DROP TABLE IF EXISTS "public"."parkinglot";
CREATE TABLE "public"."parkinglot" (
  "parkinglotid" uuid NOT NULL,
  "propertycompanyid" uuid,
  "parkinglotname" varchar(40) COLLATE "pg_catalog"."default",
  "parkinglotaddress" varchar(100) COLLATE "pg_catalog"."default",
  "parkingplacenum" int4 DEFAULT 0,
  "freeparkingplacenum" int4 DEFAULT 0,
  "note" varchar(200) COLLATE "pg_catalog"."default",
  "state" varchar(2) COLLATE "pg_catalog"."default",
  "longitude" numeric(14,10),
  "latitude" numeric(14,10),
  "ingressmap" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of parkinglot
-- ----------------------------
INSERT INTO "public"."parkinglot" VALUES ('335f92c4-56b1-436a-81f1-2cc662c0e075', NULL, '西安电子科技大学', '西安电子科技大学', 0, 1, 'f', '1', 108.9187570000, 34.2342990000, '');
INSERT INTO "public"."parkinglot" VALUES ('f90485be-ea51-4f5a-b252-11c6f63d07cd', NULL, '西安交通大学', '西安交大南门', 22, 2, '暂无公告', '1', 108.9816500000, 34.2449780000, NULL);
INSERT INTO "public"."parkinglot" VALUES ('79465cea-1e48-4057-bc0a-004c051f1c90', NULL, '乐居场小区', '乐居场小区', 57, 2, '', '1', 108.9789460000, 34.2435590000, 'fa201a04027d4922b91045c136970bda.gif');
INSERT INTO "public"."parkinglot" VALUES ('7aee0ae1-0a4e-412f-b91a-884017817ba2', NULL, '新兴名园地下停车场', '友谊东路6号', 37, 2, '暂无公告', '1', 108.9850190000, 34.2410940000, NULL);

-- ----------------------------
-- Table structure for parkinglotslice
-- ----------------------------
DROP TABLE IF EXISTS "public"."parkinglotslice";
CREATE TABLE "public"."parkinglotslice" (
  "parkinglotsliceid" uuid NOT NULL,
  "parkinglotid" uuid,
  "slicename" varchar(20) COLLATE "pg_catalog"."default",
  "slicemap" varchar(100) COLLATE "pg_catalog"."default",
  "note" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of parkinglotslice
-- ----------------------------
INSERT INTO "public"."parkinglotslice" VALUES ('1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', '7aee0ae1-0a4e-412f-b91a-884017817ba2', '地下一层', '5aa513af4c1946d7baa9981865391e16.svg', '无');
INSERT INTO "public"."parkinglotslice" VALUES ('ef239a55-f4ab-48fc-a1e9-58f40ccb4513', '7aee0ae1-0a4e-412f-b91a-884017817ba2', '地下二层', '815a79884934447d978ed4c39ef0d12a.svg', '无');
INSERT INTO "public"."parkinglotslice" VALUES ('96242615-03b6-4b44-9e9a-2d5a6bd7a130', 'f90485be-ea51-4f5a-b252-11c6f63d07cd', '西区地面', '73bc9f977ea04ac9bbfe2d5a76d34c8d.svg', '无');
INSERT INTO "public"."parkinglotslice" VALUES ('d7511c0c-83ff-499b-90ee-95e888d96e45', 'f90485be-ea51-4f5a-b252-11c6f63d07cd', '南区地面', 'f901abea7aa94fc5a282e0f9dd7317dc.svg', '无');
INSERT INTO "public"."parkinglotslice" VALUES ('b26eb2a4-b149-4019-b170-fecdf361a2b6', '7aee0ae1-0a4e-412f-b91a-884017817ba2', '3424', '3db9163166bb4254b9b829937c78c94c.gif', '暂无公告');
INSERT INTO "public"."parkinglotslice" VALUES ('05e5e931-4483-4f17-983e-640a7e3449da', '79465cea-1e48-4057-bc0a-004c051f1c90', '地面', '6a333e3077a7465abafe11aae24b5855.svg', '');

-- ----------------------------
-- Table structure for parkingplace
-- ----------------------------
DROP TABLE IF EXISTS "public"."parkingplace";
CREATE TABLE "public"."parkingplace" (
  "parkingplaceid" uuid NOT NULL,
  "orduserid" uuid,
  "parkinglotsliceid" uuid,
  "regtime" date,
  "usestate" varchar(2) COLLATE "pg_catalog"."default",
  "positionofmap" varchar(400) COLLATE "pg_catalog"."default",
  "parkingplaceno" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of parkingplace
-- ----------------------------
INSERT INTO "public"."parkingplace" VALUES ('914da100-7826-47c6-b277-6cb8463a5b9d', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-1');
INSERT INTO "public"."parkingplace" VALUES ('59c8d9c6-e861-4d19-b39c-61de4518bb03', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-2');
INSERT INTO "public"."parkingplace" VALUES ('1dad42f1-3d53-498e-96e5-f3feea384552', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-3');
INSERT INTO "public"."parkingplace" VALUES ('a7eb5d1e-f6b7-45d2-bc06-5fe8bb3201be', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-4');
INSERT INTO "public"."parkingplace" VALUES ('9bc292df-5257-45a4-bcd0-63d262cdf850', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-5');
INSERT INTO "public"."parkingplace" VALUES ('14271e95-4f1d-4818-90ba-54e2348da2a0', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-6');
INSERT INTO "public"."parkingplace" VALUES ('e236fb2a-8e2d-4ad8-ac38-047b13f7cd9b', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-7');
INSERT INTO "public"."parkingplace" VALUES ('8c4c9d9a-48ac-4c4f-87d3-3e2270afb013', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-8');
INSERT INTO "public"."parkingplace" VALUES ('f792fbbb-1794-4d2f-8625-ebcb74debf82', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-10');
INSERT INTO "public"."parkingplace" VALUES ('f3607428-1f97-40a0-abc2-68dbffeeabef', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-14');
INSERT INTO "public"."parkingplace" VALUES ('0b0bf369-8e83-4dcd-8df1-3bbef2fc11ce', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-15');
INSERT INTO "public"."parkingplace" VALUES ('50af77eb-9c5a-49c7-b114-acd4acb4de2a', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-16');
INSERT INTO "public"."parkingplace" VALUES ('f21a268d-35fb-48c0-a544-38cfe098b7f7', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-17');
INSERT INTO "public"."parkingplace" VALUES ('88f3f854-34b9-4fe6-8bd2-8f06ea7133e7', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', '', 'xx-18');
INSERT INTO "public"."parkingplace" VALUES ('628eff3d-eac8-480b-a801-bc2e648e7d8a', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-1');
INSERT INTO "public"."parkingplace" VALUES ('67170c08-fc5b-4cc7-82f5-df6f07b0e491', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-2');
INSERT INTO "public"."parkingplace" VALUES ('b0d9fa7c-8e44-41d2-af04-ca7e6894f1dd', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-4');
INSERT INTO "public"."parkingplace" VALUES ('dc96e818-150e-4ca4-ab9b-5e483a3a2e12', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-5');
INSERT INTO "public"."parkingplace" VALUES ('8ba449e0-5312-4ed8-9dd3-3da734363358', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-6');
INSERT INTO "public"."parkingplace" VALUES ('a4d2b5fe-1d3b-49e3-a4fc-efdf67eb3265', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-7');
INSERT INTO "public"."parkingplace" VALUES ('e32e3ab6-27bf-40df-a51e-4391b55773d1', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-10');
INSERT INTO "public"."parkingplace" VALUES ('d8a3ee86-f835-4262-a00d-dbf7f84ebdb8', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-11');
INSERT INTO "public"."parkingplace" VALUES ('d306ed5a-b7f0-436b-9ac8-11d9c9fdfaf6', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-12');
INSERT INTO "public"."parkingplace" VALUES ('da57abf3-fe92-45f1-9130-bcbb2887ecea', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-13');
INSERT INTO "public"."parkingplace" VALUES ('276062d7-45ff-466c-bebf-024bf3443338', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-14');
INSERT INTO "public"."parkingplace" VALUES ('59953ec2-6435-4b15-9a45-24832b030e50', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-15');
INSERT INTO "public"."parkingplace" VALUES ('ed360cd2-c2cd-45df-bd77-bb1e3908fab7', NULL, '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-16');
INSERT INTO "public"."parkingplace" VALUES ('fbf57a7c-2a41-4940-9de9-3979388e85e5', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-17');
INSERT INTO "public"."parkingplace" VALUES ('93e60ea3-c555-4c65-b502-848a37d509f0', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-18');
INSERT INTO "public"."parkingplace" VALUES ('b9d4b4f8-88ea-45cf-9448-8a49e6f41aa5', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-20');
INSERT INTO "public"."parkingplace" VALUES ('2e63a711-77fb-47ce-9cc7-aca9da370fb6', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-21');
INSERT INTO "public"."parkingplace" VALUES ('7a5295c9-1abb-4045-97e0-0f296dcd9d8c', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-22');
INSERT INTO "public"."parkingplace" VALUES ('be02d351-094b-4726-b316-80fe16a5aafb', NULL, 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-24');
INSERT INTO "public"."parkingplace" VALUES ('fdbf9315-21e5-4439-9e81-902d72c4fcb6', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-19');
INSERT INTO "public"."parkingplace" VALUES ('24499d49-61b6-4594-b9a9-edc8e617e5a0', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-20');
INSERT INTO "public"."parkingplace" VALUES ('2ab1d502-cb29-43b4-b84c-740679e9e47f', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-21');
INSERT INTO "public"."parkingplace" VALUES ('5518486c-68a9-4889-805f-33ca3d7c58a2', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-22');
INSERT INTO "public"."parkingplace" VALUES ('a6cf0eb4-e026-4aee-9eae-3ad1cdaf21fc', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-23');
INSERT INTO "public"."parkingplace" VALUES ('830bfd59-67be-45af-ab59-8f14c7d977f3', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-24');
INSERT INTO "public"."parkingplace" VALUES ('d45814df-e556-4ceb-bfe6-c0f283d08196', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-25');
INSERT INTO "public"."parkingplace" VALUES ('3ffac2fc-98a7-48f0-990f-f34794d76ab7', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-26');
INSERT INTO "public"."parkingplace" VALUES ('6937b290-8d1f-4698-a428-5d6f45f1bffb', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-27');
INSERT INTO "public"."parkingplace" VALUES ('d115c03f-95af-42c3-8ab2-f123f7da4502', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-28');
INSERT INTO "public"."parkingplace" VALUES ('dcc0d329-003b-457a-9bda-14a880d830c2', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-29');
INSERT INTO "public"."parkingplace" VALUES ('ae857d3a-2eb2-49f9-993e-67061e6ec53f', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-30');
INSERT INTO "public"."parkingplace" VALUES ('52000fda-c022-4d5d-80e8-8ba4149b3eda', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-31');
INSERT INTO "public"."parkingplace" VALUES ('d40cf71d-7fc7-4cc0-a736-1f7354a3ee25', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-32');
INSERT INTO "public"."parkingplace" VALUES ('6f931834-8bdb-473c-82fe-05509389bc1f', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-33');
INSERT INTO "public"."parkingplace" VALUES ('e4ca9e2b-583c-432f-9347-a5f06baa40fb', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-34');
INSERT INTO "public"."parkingplace" VALUES ('fa91d0b7-94d4-41b0-9e73-b9534ba0b163', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-35');
INSERT INTO "public"."parkingplace" VALUES ('cc9fb77b-8d9c-41af-94b4-ed82bb7c52fb', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-36');
INSERT INTO "public"."parkingplace" VALUES ('970a0822-dba3-4f1c-a554-2a0483977fb4', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-37');
INSERT INTO "public"."parkingplace" VALUES ('a83b4930-380e-4351-98d4-3a3bbf73c371', NULL, 'ef239a55-f4ab-48fc-a1e9-58f40ccb4513', NULL, '1', '', 'xx-38');
INSERT INTO "public"."parkingplace" VALUES ('f0a49ac7-4f56-4f4c-8466-9aeafca9c4c5', NULL, '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '1', 'dfsadf', 'xx-9');
INSERT INTO "public"."parkingplace" VALUES ('e22790b5-a44f-4ae0-862d-d44c56f2438f', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '2', '', 'xx-13');
INSERT INTO "public"."parkingplace" VALUES ('7bf1f012-81ff-467c-b67b-7f5377dffe8b', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '2', '', 'xjt-3');
INSERT INTO "public"."parkingplace" VALUES ('f63c7bce-9d24-4c3e-a4c5-e6edf35cfd6a', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '1cd792ef-fc8f-4a5e-a2c3-9f2c76cb88d1', NULL, '2', '', 'xx-12');
INSERT INTO "public"."parkingplace" VALUES ('39b074ac-45b0-4b38-880e-298d300980a8', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '96242615-03b6-4b44-9e9a-2d5a6bd7a130', NULL, '1', '', 'xjt-9');
INSERT INTO "public"."parkingplace" VALUES ('e3a07a4e-bfbe-474e-b6df-4f5beb11df89', '1dad42f1-3d53-498e-96e5-f3feea3845c2', 'd7511c0c-83ff-499b-90ee-95e888d96e45', NULL, '1', '', 'xjt-23');
INSERT INTO "public"."parkingplace" VALUES ('b6c04e7d-c739-4560-b855-71586bb4e8ec', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-1');
INSERT INTO "public"."parkingplace" VALUES ('2edbfbde-dd44-4c32-9be1-844e713cf834', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-2');
INSERT INTO "public"."parkingplace" VALUES ('4753d490-95e8-40ba-a345-d65c922c4dc6', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-3');
INSERT INTO "public"."parkingplace" VALUES ('de7a63d7-abdf-4f08-be51-59a927f913d0', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-4');
INSERT INTO "public"."parkingplace" VALUES ('dd12bdc9-9ead-4683-b555-322f5c101fa3', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-5');
INSERT INTO "public"."parkingplace" VALUES ('f2db9b91-2fbe-416f-9bb4-012b6dffc43d', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-6');
INSERT INTO "public"."parkingplace" VALUES ('86a311a2-adca-46c1-b96f-d358acfdfc17', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-8');
INSERT INTO "public"."parkingplace" VALUES ('a6c6c195-46bc-42d6-b490-5813495bb34f', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-10');
INSERT INTO "public"."parkingplace" VALUES ('eb01c9c2-860b-444e-8cb7-ce75162185a1', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-12');
INSERT INTO "public"."parkingplace" VALUES ('c0416485-c4ec-4deb-8ab4-9daf9d884b71', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-14');
INSERT INTO "public"."parkingplace" VALUES ('6779f20f-1b37-4911-bcbf-c7d654b25a36', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-15');
INSERT INTO "public"."parkingplace" VALUES ('60314664-05bf-479c-bf89-8ff1f752f043', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-16');
INSERT INTO "public"."parkingplace" VALUES ('4c417f79-6733-4840-9b2f-117305fdf1a0', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-17');
INSERT INTO "public"."parkingplace" VALUES ('c3f93f01-a54f-4bd1-9c1e-5ad1846d371c', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-18');
INSERT INTO "public"."parkingplace" VALUES ('58f6c5e7-9205-457c-8562-d21f8e49a6ff', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-19');
INSERT INTO "public"."parkingplace" VALUES ('527eea74-92bc-4b44-9fe6-14ef2fadd929', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-20');
INSERT INTO "public"."parkingplace" VALUES ('b438edf4-3ea3-4b74-b9d9-0395e54e4530', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-21');
INSERT INTO "public"."parkingplace" VALUES ('620ae7cc-91c2-4307-bea0-6f43765713ed', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-22');
INSERT INTO "public"."parkingplace" VALUES ('c2a0ba08-2198-401a-81d1-5b534587c4ee', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-23');
INSERT INTO "public"."parkingplace" VALUES ('bf1c1219-1407-4050-a205-243e62640cc1', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-24');
INSERT INTO "public"."parkingplace" VALUES ('69e4efd0-eb64-4eb8-9739-bc35741d7e1f', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-25');
INSERT INTO "public"."parkingplace" VALUES ('b901d55f-07a3-456c-9124-18e8fc039906', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-27');
INSERT INTO "public"."parkingplace" VALUES ('51712da8-a9c6-4a43-80ab-d6c2df0b3efb', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-28');
INSERT INTO "public"."parkingplace" VALUES ('23160df7-7e6a-46ba-b4fd-e5caeee8dc3f', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-29');
INSERT INTO "public"."parkingplace" VALUES ('363999e8-dfa2-452e-9716-0edf495e45b5', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-30');
INSERT INTO "public"."parkingplace" VALUES ('f67cec5b-01e2-4b40-b552-a23b168aa000', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-31');
INSERT INTO "public"."parkingplace" VALUES ('1d83eaf8-e558-452a-8809-573d80292981', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-33');
INSERT INTO "public"."parkingplace" VALUES ('e3066cfb-c196-4a59-ac16-769d298c9de8', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-34');
INSERT INTO "public"."parkingplace" VALUES ('b180f2bc-71f9-4dcc-83c2-d217cfe38e06', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-35');
INSERT INTO "public"."parkingplace" VALUES ('3f0e903c-6742-4ae4-916d-102ca3ed6ba6', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-36');
INSERT INTO "public"."parkingplace" VALUES ('1db5741f-8ded-44b1-ba87-a4731a398e35', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-37');
INSERT INTO "public"."parkingplace" VALUES ('71ed2b87-bd0c-4d9f-ae22-e0c1449c35e3', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-38');
INSERT INTO "public"."parkingplace" VALUES ('f89ed92f-12e7-47b9-a41b-5b8f2e41adf8', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-39');
INSERT INTO "public"."parkingplace" VALUES ('65d85a22-ed1d-47b7-977a-305a02cb3fa5', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-40');
INSERT INTO "public"."parkingplace" VALUES ('ae891fef-c348-491b-b86a-4ad0285c2ea5', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-41');
INSERT INTO "public"."parkingplace" VALUES ('90cb3614-2c66-48b8-af53-daf3f6219927', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-42');
INSERT INTO "public"."parkingplace" VALUES ('ff95eaec-3c96-4e69-bbf8-029625adf4eb', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-43');
INSERT INTO "public"."parkingplace" VALUES ('c49c8b2d-fb84-48f7-9de1-d5648b63ee0d', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-44');
INSERT INTO "public"."parkingplace" VALUES ('0d5b0fc0-96c0-4942-a2b9-10c1361f9a65', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-26');
INSERT INTO "public"."parkingplace" VALUES ('d4446c12-8c18-4f64-8df1-966c763a9b29', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-45');
INSERT INTO "public"."parkingplace" VALUES ('648c55c6-fa7f-49e3-9916-c3e449f6a41c', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-46');
INSERT INTO "public"."parkingplace" VALUES ('d338cac0-c231-4767-8277-b65ea8fc8695', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-47');
INSERT INTO "public"."parkingplace" VALUES ('efff9489-ce19-4575-a23c-daa6783cac06', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-48');
INSERT INTO "public"."parkingplace" VALUES ('04d4eeeb-85c7-40b7-b4e1-c902d22c30d9', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-49');
INSERT INTO "public"."parkingplace" VALUES ('aaac4388-cbaa-4c7b-bdb7-0f5362889061', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-50');
INSERT INTO "public"."parkingplace" VALUES ('2cb26063-8ecf-49fd-a702-8768f851e06c', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-51');
INSERT INTO "public"."parkingplace" VALUES ('780d9610-7c80-4574-bb13-708411785903', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-52');
INSERT INTO "public"."parkingplace" VALUES ('8ce0dedc-c4ef-4b0b-b6a8-4bc78cdce43d', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-53');
INSERT INTO "public"."parkingplace" VALUES ('f90a8724-5127-4310-8f6f-74a71e2e7477', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-54');
INSERT INTO "public"."parkingplace" VALUES ('7ee76c2b-87b9-4e38-9048-bb55c38e4ffd', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-55');
INSERT INTO "public"."parkingplace" VALUES ('42a38994-5277-4c76-8120-45795fa957ce', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-56');
INSERT INTO "public"."parkingplace" VALUES ('c814285a-fc32-4e17-bdf9-fabde83f41d0', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-57');
INSERT INTO "public"."parkingplace" VALUES ('469acac0-8393-43a6-9a42-f358f4303ac3', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-58');
INSERT INTO "public"."parkingplace" VALUES ('4ee7351f-9742-47db-9e61-0ca8f618337b', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-59');
INSERT INTO "public"."parkingplace" VALUES ('332c448b-47ad-4953-a0be-ae96a285ac9e', NULL, '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-60');
INSERT INTO "public"."parkingplace" VALUES ('1203d5f3-384b-481e-a40b-504090c004cb', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-7');
INSERT INTO "public"."parkingplace" VALUES ('0cbe90ea-132b-4145-859e-fc0507deb24d', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '05e5e931-4483-4f17-983e-640a7e3449da', NULL, '1', '', 'ljc-13');

-- ----------------------------
-- Table structure for parkingplaceapproval
-- ----------------------------
DROP TABLE IF EXISTS "public"."parkingplaceapproval";
CREATE TABLE "public"."parkingplaceapproval" (
  "parkingplaceapprovalid" uuid NOT NULL,
  "parkingplaceid" uuid,
  "orduserid" uuid,
  "propertyuserid" uuid,
  "sysuserid" uuid,
  "approvalstate" varchar(2) COLLATE "pg_catalog"."default",
  "reason" varchar(200) COLLATE "pg_catalog"."default",
  "applytime" timestamp(6),
  "approvaltime" timestamp(6),
  "note" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of parkingplaceapproval
-- ----------------------------
INSERT INTO "public"."parkingplaceapproval" VALUES ('04da1f65-e9b6-4160-ae6a-41e914bc76b2', 'e3a07a4e-bfbe-474e-b6df-4f5beb11df89', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '3', NULL, '2015-06-25 17:09:20.373', '2016-04-21 17:25:11.39', NULL);
INSERT INTO "public"."parkingplaceapproval" VALUES ('13472e1c-6514-440f-abce-8e9ea2179b8b', 'dc96e818-150e-4ca4-ab9b-5e483a3a2e12', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '3', NULL, '2015-08-17 15:56:47.232', '2016-04-21 16:59:13.531', NULL);
INSERT INTO "public"."parkingplaceapproval" VALUES ('5e72a71f-2a37-49d3-94a1-5ca2eb7ce3e0', '39b074ac-45b0-4b38-880e-298d300980a8', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '2', NULL, '2015-07-28 17:57:44.358', '2015-07-28 18:10:50.661', NULL);
INSERT INTO "public"."parkingplaceapproval" VALUES ('04da1f65-e9b6-4160-ae6a-41e914bc76b3', '04d4eeeb-85c7-40b7-b4e1-c902d22c30d9', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '3', NULL, '2015-06-25 17:09:20.373', '2016-04-21 17:25:11.39', NULL);
INSERT INTO "public"."parkingplaceapproval" VALUES ('04da1f65-e9b6-4160-ae6a-41e914bc76b5', '1db5741f-8ded-44b1-ba87-a4731a398e35', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '3', NULL, '2015-06-25 17:09:20.373', '2016-04-21 17:25:11.39', NULL);
INSERT INTO "public"."parkingplaceapproval" VALUES ('04da1f65-e9b6-4160-ae6a-41e914bc76b4', '0b0bf369-8e83-4dcd-8df1-3bbef2fc11ce', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '057967a5-bb83-48bb-a007-44da9b82024d', '04da1f65-e9b6-4160-ae6a-41e914bc76b3', '3', NULL, '2015-06-25 17:09:20.373', '2016-05-09 20:32:39.026', NULL);

-- ----------------------------
-- Table structure for parkingplacefreetime
-- ----------------------------
DROP TABLE IF EXISTS "public"."parkingplacefreetime";
CREATE TABLE "public"."parkingplacefreetime" (
  "parkingplacefreetimeid" uuid NOT NULL,
  "parkingplaceid" uuid,
  "orduserid" uuid,
  "freetimebucketbegin" timestamp(6) NOT NULL,
  "freetimebucketend" timestamp(6) NOT NULL,
  "ruletype" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "unitprice" float8,
  "unittimelong" float4,
  "startprice" float8,
  "starttimelong" float4,
  "punishunitprice" float8,
  "punishunittimelong" float4,
  "punishtype" char(1) COLLATE "pg_catalog"."default",
  "usestate" char(1) COLLATE "pg_catalog"."default",
  "isappointment" char(1) COLLATE "pg_catalog"."default",
  "isvalid" char(1) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of parkingplacefreetime
-- ----------------------------
INSERT INTO "public"."parkingplacefreetime" VALUES ('ce017745-2e01-4477-84dc-dbb34c6292d8', '7bf1f012-81ff-467c-b67b-7f5377dffe8b', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-10 06:00:00', '2016-05-10 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('b815d754-4b4f-465f-8bb5-9dd899de0256', '7bf1f012-81ff-467c-b67b-7f5377dffe8b', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-11 06:00:00', '2016-05-11 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('df3cfa72-97ff-4e77-9b61-623c85bd9e85', '7bf1f012-81ff-467c-b67b-7f5377dffe8b', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-12 06:00:00', '2016-05-12 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('52d4a98f-a4a7-40b6-bbdb-24a6d447a165', '0cbe90ea-132b-4145-859e-fc0507deb24d', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-10 07:00:00', '2016-05-10 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('c8b82d3d-9b00-42cd-afbd-c1bff9a423a5', '0cbe90ea-132b-4145-859e-fc0507deb24d', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-11 07:00:00', '2016-05-11 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('9533e849-ec42-418e-8e96-98d67a73051b', '0cbe90ea-132b-4145-859e-fc0507deb24d', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-12 07:00:00', '2016-05-12 19:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('21c1dced-0035-4114-8bed-0bf7045e14d0', '0d5b0fc0-96c0-4942-a2b9-10c1361f9a65', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-10 06:00:00', '2016-05-10 18:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('ccaa5b8c-de8c-4e73-937d-851084b0f3dc', '0d5b0fc0-96c0-4942-a2b9-10c1361f9a65', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-11 06:00:00', '2016-05-11 18:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('cf6b004e-f59d-4a3e-95a2-e8b466658645', '0d5b0fc0-96c0-4942-a2b9-10c1361f9a65', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-12 06:00:00', '2016-05-12 18:00:00', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('10968a6d-effb-4ee8-85ba-3c827a633010', 'e22790b5-a44f-4ae0-862d-d44c56f2438f', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-09 00:00:00', '2016-05-09 23:59:59', '1', 3, 0, 0, 0, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('6b419216-c48b-40df-9b04-a999fd3b05f0', 'e22790b5-a44f-4ae0-862d-d44c56f2438f', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-10 00:00:00', '2016-05-10 23:59:59', '1', 3, 0, 0, 0, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('62171a87-409c-45c0-8462-39880f706ad9', 'e3a07a4e-bfbe-474e-b6df-4f5beb11df89', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-05 00:00:00', '2016-05-05 23:59:59', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO "public"."parkingplacefreetime" VALUES ('cf81b726-574f-40bc-97a0-b4373e70d348', 'e3a07a4e-bfbe-474e-b6df-4f5beb11df89', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '2016-05-06 00:00:00', '2016-05-06 23:59:59', '1', 3, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for propertycompany
-- ----------------------------
DROP TABLE IF EXISTS "public"."propertycompany";
CREATE TABLE "public"."propertycompany" (
  "propertycompanyid" uuid NOT NULL,
  "pcompanyname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "commerlicens" varchar(100) COLLATE "pg_catalog"."default",
  "legalname" varchar(20) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "note" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of propertycompany
-- ----------------------------
INSERT INTO "public"."propertycompany" VALUES ('057967a5-bb83-48bb-a007-44da9b82353b', '交通物业', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for propertyuser
-- ----------------------------
DROP TABLE IF EXISTS "public"."propertyuser";
CREATE TABLE "public"."propertyuser" (
  "propertyuserid" uuid NOT NULL,
  "propertycompanyid" uuid,
  "propertyusername" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "note" varchar(200) COLLATE "pg_catalog"."default",
  "loginname" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "loginpwd" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(2) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of propertyuser
-- ----------------------------
INSERT INTO "public"."propertyuser" VALUES ('057967a5-bb83-48bb-a007-44da9b82024d', '057967a5-bb83-48bb-a007-44da9b82353b', '小明', '13892896687', NULL, NULL, 'xiaoming', '123415', '1');

-- ----------------------------
-- Table structure for rentrecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."rentrecord";
CREATE TABLE "public"."rentrecord" (
  "rentrecordid" uuid NOT NULL,
  "parkingplacefreetimeid" uuid,
  "usercarid" uuid,
  "usercouponid" uuid,
  "appointmenttime" timestamp(6),
  "appointmentbegintime" timestamp(6),
  "appointmentendtime" timestamp(6),
  "factbegintime" timestamp(6),
  "factendtime" timestamp(6),
  "appointmentcost" float8,
  "freetimecost" float8,
  "omittimecostscale" float8,
  "omittimecost" float8,
  "exceedtimecostscale" float8,
  "exceedtimecost" float8,
  "punishtimecostscale" float8,
  "punishcost" float8,
  "preferentialratio" float8,
  "preferentialcost" float8,
  "payablecost" float8,
  "paidcost" float8,
  "paymethod" varchar(2) COLLATE "pg_catalog"."default",
  "ispay" varchar(2) COLLATE "pg_catalog"."default" DEFAULT 0,
  "acpaystate" varchar(2) COLLATE "pg_catalog"."default" DEFAULT 0,
  "parkingplaceid" uuid
)
;

-- ----------------------------
-- Records of rentrecord
-- ----------------------------
INSERT INTO "public"."rentrecord" VALUES ('714dde63-2146-4bde-a347-6040a3672733', NULL, NULL, NULL, '2016-04-29 17:12:51.42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL);

-- ----------------------------
-- Table structure for sysparameter
-- ----------------------------
DROP TABLE IF EXISTS "public"."sysparameter";
CREATE TABLE "public"."sysparameter" (
  "sysparameterid" uuid NOT NULL,
  "sysparameterenname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sysparametercnname" varchar(100) COLLATE "pg_catalog"."default",
  "sysparametervalue" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "note" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS "public"."sysuser";
CREATE TABLE "public"."sysuser" (
  "sysuserid" uuid NOT NULL,
  "loginname" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "loginpwd" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "nickname" varchar(40) COLLATE "pg_catalog"."default",
  "realname" varchar(20) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(40) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "sex" varchar(2) COLLATE "pg_catalog"."default",
  "registertime" date,
  "notes" varchar(200) COLLATE "pg_catalog"."default",
  "state" varchar(2) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '1'::character varying
)
;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO "public"."sysuser" VALUES ('04da1f65-e9b6-4160-ae6a-41e914bc76b3', 'zhangsan', '123', 'hello', 'wangyulong', '13689255657', '925368468@qq.com', '陕西省西安市', 'M', '2016-04-20', NULL, '0');

-- ----------------------------
-- Table structure for usercar
-- ----------------------------
DROP TABLE IF EXISTS "public"."usercar";
CREATE TABLE "public"."usercar" (
  "usercarid" uuid NOT NULL,
  "orduserid" uuid,
  "carnumber" varchar(12) COLLATE "pg_catalog"."default",
  "cartype" varchar(40) COLLATE "pg_catalog"."default",
  "carmodels" varchar(40) COLLATE "pg_catalog"."default",
  "licensepic" varchar(100) COLLATE "pg_catalog"."default",
  "regtime" timestamp(6),
  "state" varchar(2) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of usercar
-- ----------------------------
INSERT INTO "public"."usercar" VALUES ('308920be-45aa-4d69-83f9-b1f8a060689c', '1dad42f1-3d53-498e-96e5-f3feea3845c2', '陕A88888', 'GTS', '卡宴', '', '2015-06-19 17:18:25.785', '');

-- ----------------------------
-- Table structure for usercoupon
-- ----------------------------
DROP TABLE IF EXISTS "public"."usercoupon";
CREATE TABLE "public"."usercoupon" (
  "usercouponid" uuid NOT NULL,
  "couponid" uuid,
  "orduserid" uuid,
  "havenum" int4,
  "residuenum" int4,
  "isvalide" varchar(2) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for verifier
-- ----------------------------
DROP TABLE IF EXISTS "public"."verifier";
CREATE TABLE "public"."verifier" (
  "verifierid" uuid NOT NULL,
  "parkinglotid" uuid,
  "verifiercode" varchar(20) COLLATE "pg_catalog"."default",
  "entrancetype" varchar(2) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Function structure for addfreeparkingnum
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."addfreeparkingnum"();
CREATE OR REPLACE FUNCTION "public"."addfreeparkingnum"()
  RETURNS "pg_catalog"."trigger" AS $BODY$DECLARE
       tmp integer := 0;

    BEGIN

      
	
	 select into tmp count(*) from parkingplacefreetime where parkingplaceid=NEW.parkingplaceid;
	if tmp =0 then 
	update parkinglot set freeparkingplacenum=freeparkingplacenum+1  where parkinglot.parkinglotid in (select ps.parkinglotid from parkinglotslice ps,parkingplace pp 
		where ps.parkinglotsliceid=pp.parkinglotsliceid and pp.parkingplaceid=NEW.parkingplaceid);
	end if;
       RETURN NEW;

      
    END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for addparkingnum
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."addparkingnum"();
CREATE OR REPLACE FUNCTION "public"."addparkingnum"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
    BEGIN

      
	
	
	update parkinglot set parkingplacenum=parkingplacenum+1  where parkinglot.parkinglotid in (select ps.parkinglotid from parkinglotslice ps,parkingplace pp 
		where ps.parkinglotsliceid=pp.parkinglotsliceid and pp.parkingplaceid=NEW.parkingplaceid);
	
       RETURN NEW;

      
    END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for deletefreeparkingnum
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."deletefreeparkingnum"();
CREATE OR REPLACE FUNCTION "public"."deletefreeparkingnum"()
  RETURNS "pg_catalog"."trigger" AS $BODY$DECLARE
       
       tempc integer;
begin
	SELECT INTO tempc count(*) FROM parkingplacefreetime where parkingplaceid=OLD.parkingplaceid;
	IF tempc =0 then	
	update parkinglot set freeparkingplacenum=freeparkingplacenum-1  where parkinglot.parkinglotid in (select ps.parkinglotid from parkinglotslice ps,parkingplace pp where ps.parkinglotsliceid=pp.parkinglotsliceid and pp.parkingplaceid=OLD.parkingplaceid);
	end if;
	RETURN OLD;
end
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for deleteparkingnum
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."deleteparkingnum"();
CREATE OR REPLACE FUNCTION "public"."deleteparkingnum"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
begin
	
	update parkinglot set parkingplacenum=parkingplacenum-1  where parkinglot.parkinglotid in (select ps.parkinglotid from parkinglotslice ps where ps.parkinglotsliceid=OLD.parkinglotsliceid);
	
	RETURN OLD;
end
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Primary Key structure for table coupon
-- ----------------------------
ALTER TABLE "public"."coupon" ADD CONSTRAINT "pk_coupon" PRIMARY KEY ("couponid");

-- ----------------------------
-- Primary Key structure for table freetimetmp
-- ----------------------------
ALTER TABLE "public"."freetimetmp" ADD CONSTRAINT "pk_freetimetmp" PRIMARY KEY ("freetimetmpid");

-- ----------------------------
-- Primary Key structure for table freetimetmprule
-- ----------------------------
ALTER TABLE "public"."freetimetmprule" ADD CONSTRAINT "pk_freetimetmprule" PRIMARY KEY ("freetimetmpruleid");

-- ----------------------------
-- Primary Key structure for table orduser
-- ----------------------------
ALTER TABLE "public"."orduser" ADD CONSTRAINT "pk_orduser" PRIMARY KEY ("orduserid");

-- ----------------------------
-- Primary Key structure for table parkinglot
-- ----------------------------
ALTER TABLE "public"."parkinglot" ADD CONSTRAINT "pk_parkinglot" PRIMARY KEY ("parkinglotid");

-- ----------------------------
-- Primary Key structure for table parkinglotslice
-- ----------------------------
ALTER TABLE "public"."parkinglotslice" ADD CONSTRAINT "pk_parkinglotslice" PRIMARY KEY ("parkinglotsliceid");

-- ----------------------------
-- Triggers structure for table parkingplace
-- ----------------------------
CREATE TRIGGER "add" AFTER INSERT ON "public"."parkingplace"
FOR EACH ROW
EXECUTE PROCEDURE "public"."addparkingnum"();
CREATE TRIGGER "delete" AFTER DELETE ON "public"."parkingplace"
FOR EACH ROW
EXECUTE PROCEDURE "public"."deleteparkingnum"();

-- ----------------------------
-- Primary Key structure for table parkingplace
-- ----------------------------
ALTER TABLE "public"."parkingplace" ADD CONSTRAINT "pk_parkingplace" PRIMARY KEY ("parkingplaceid");

-- ----------------------------
-- Primary Key structure for table parkingplaceapproval
-- ----------------------------
ALTER TABLE "public"."parkingplaceapproval" ADD CONSTRAINT "pk_parkingplaceapproval" PRIMARY KEY ("parkingplaceapprovalid");

-- ----------------------------
-- Triggers structure for table parkingplacefreetime
-- ----------------------------
CREATE TRIGGER "add" BEFORE INSERT ON "public"."parkingplacefreetime"
FOR EACH ROW
EXECUTE PROCEDURE "public"."addfreeparkingnum"();
CREATE TRIGGER "delete" AFTER DELETE ON "public"."parkingplacefreetime"
FOR EACH ROW
EXECUTE PROCEDURE "public"."deletefreeparkingnum"();

-- ----------------------------
-- Primary Key structure for table parkingplacefreetime
-- ----------------------------
ALTER TABLE "public"."parkingplacefreetime" ADD CONSTRAINT "pk_parkingplacefreetime" PRIMARY KEY ("parkingplacefreetimeid");

-- ----------------------------
-- Primary Key structure for table propertycompany
-- ----------------------------
ALTER TABLE "public"."propertycompany" ADD CONSTRAINT "pk_propertycompany" PRIMARY KEY ("propertycompanyid");

-- ----------------------------
-- Primary Key structure for table propertyuser
-- ----------------------------
ALTER TABLE "public"."propertyuser" ADD CONSTRAINT "pk_propertyuser" PRIMARY KEY ("propertyuserid");

-- ----------------------------
-- Primary Key structure for table rentrecord
-- ----------------------------
ALTER TABLE "public"."rentrecord" ADD CONSTRAINT "pk_rentrecord" PRIMARY KEY ("rentrecordid");

-- ----------------------------
-- Primary Key structure for table sysparameter
-- ----------------------------
ALTER TABLE "public"."sysparameter" ADD CONSTRAINT "pk_sysparameter" PRIMARY KEY ("sysparameterid");

-- ----------------------------
-- Primary Key structure for table sysuser
-- ----------------------------
ALTER TABLE "public"."sysuser" ADD CONSTRAINT "pk_sysuser" PRIMARY KEY ("sysuserid");

-- ----------------------------
-- Primary Key structure for table usercar
-- ----------------------------
ALTER TABLE "public"."usercar" ADD CONSTRAINT "pk_usercar" PRIMARY KEY ("usercarid");

-- ----------------------------
-- Primary Key structure for table usercoupon
-- ----------------------------
ALTER TABLE "public"."usercoupon" ADD CONSTRAINT "pk_usercoupon" PRIMARY KEY ("usercouponid");

-- ----------------------------
-- Primary Key structure for table verifier
-- ----------------------------
ALTER TABLE "public"."verifier" ADD CONSTRAINT "pk_verifier" PRIMARY KEY ("verifierid");

-- ----------------------------
-- Foreign Keys structure for table coupon
-- ----------------------------
ALTER TABLE "public"."coupon" ADD CONSTRAINT "fk_coupon_reference_sysuser_1" FOREIGN KEY ("approvalsysuserid") REFERENCES "sysuser" ("sysuserid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."coupon" ADD CONSTRAINT "fk_coupon_reference_sysuser_2" FOREIGN KEY ("createsysuserid") REFERENCES "sysuser" ("sysuserid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table freetimetmp
-- ----------------------------
ALTER TABLE "public"."freetimetmp" ADD CONSTRAINT "fk_freetime_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table freetimetmprule
-- ----------------------------
ALTER TABLE "public"."freetimetmprule" ADD CONSTRAINT "fk_freetime_reference_freetime" FOREIGN KEY ("freetimetmpid") REFERENCES "freetimetmp" ("freetimetmpid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table parkinglot
-- ----------------------------
ALTER TABLE "public"."parkinglot" ADD CONSTRAINT "fk_parkingl_reference_property" FOREIGN KEY ("propertycompanyid") REFERENCES "propertycompany" ("propertycompanyid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table parkinglotslice
-- ----------------------------
ALTER TABLE "public"."parkinglotslice" ADD CONSTRAINT "fk_parkingl_reference_parkingl" FOREIGN KEY ("parkinglotid") REFERENCES "parkinglot" ("parkinglotid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table parkingplace
-- ----------------------------
ALTER TABLE "public"."parkingplace" ADD CONSTRAINT "fk_parkingp_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."parkingplace" ADD CONSTRAINT "fk_parkingp_reference_parkingl" FOREIGN KEY ("parkinglotsliceid") REFERENCES "parkinglotslice" ("parkinglotsliceid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table parkingplaceapproval
-- ----------------------------
ALTER TABLE "public"."parkingplaceapproval" ADD CONSTRAINT "fk_parkingp_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."parkingplaceapproval" ADD CONSTRAINT "fk_parkingp_reference_parkingp" FOREIGN KEY ("parkingplaceid") REFERENCES "parkingplace" ("parkingplaceid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."parkingplaceapproval" ADD CONSTRAINT "fk_parkingp_reference_property" FOREIGN KEY ("propertyuserid") REFERENCES "propertyuser" ("propertyuserid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."parkingplaceapproval" ADD CONSTRAINT "fk_parkingp_reference_sysuser" FOREIGN KEY ("sysuserid") REFERENCES "sysuser" ("sysuserid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table parkingplacefreetime
-- ----------------------------
ALTER TABLE "public"."parkingplacefreetime" ADD CONSTRAINT "fk_parkingp_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."parkingplacefreetime" ADD CONSTRAINT "fk_parkingp_reference_parkingp" FOREIGN KEY ("parkingplaceid") REFERENCES "parkingplace" ("parkingplaceid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table propertyuser
-- ----------------------------
ALTER TABLE "public"."propertyuser" ADD CONSTRAINT "fk_property_reference_property" FOREIGN KEY ("propertycompanyid") REFERENCES "propertycompany" ("propertycompanyid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table rentrecord
-- ----------------------------
ALTER TABLE "public"."rentrecord" ADD CONSTRAINT "fk_rentreco_reference_parkingp" FOREIGN KEY ("parkingplacefreetimeid") REFERENCES "parkingplacefreetime" ("parkingplacefreetimeid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."rentrecord" ADD CONSTRAINT "fk_rentreco_reference_usercar" FOREIGN KEY ("usercarid") REFERENCES "usercar" ("usercarid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."rentrecord" ADD CONSTRAINT "fk_rentreco_reference_usercoup" FOREIGN KEY ("usercouponid") REFERENCES "usercoupon" ("usercouponid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table usercar
-- ----------------------------
ALTER TABLE "public"."usercar" ADD CONSTRAINT "fk_usercar_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table usercoupon
-- ----------------------------
ALTER TABLE "public"."usercoupon" ADD CONSTRAINT "fk_usercoup_reference_coupon" FOREIGN KEY ("couponid") REFERENCES "coupon" ("couponid") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "public"."usercoupon" ADD CONSTRAINT "fk_usercoup_reference_orduser" FOREIGN KEY ("orduserid") REFERENCES "orduser" ("orduserid") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table verifier
-- ----------------------------
ALTER TABLE "public"."verifier" ADD CONSTRAINT "fk_verifier_reference_parkingl" FOREIGN KEY ("parkinglotid") REFERENCES "parkinglot" ("parkinglotid") ON DELETE RESTRICT ON UPDATE RESTRICT;
