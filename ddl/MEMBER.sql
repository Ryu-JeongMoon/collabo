--------------------------------------------------------
--  File created - Monday-July-05-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "BITCAMP"."MEMBER" 
   (	"UUID" NUMBER, 
	"ID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"AGE" NUMBER, 
	"PHONE" VARCHAR2(13 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"AVAILABLE" VARCHAR2(3 BYTE) DEFAULT 'IN', 
	"LICENSE" VARCHAR2(30 BYTE), 
	"SIGNUP_DATE" TIMESTAMP (6) DEFAULT sysdate, 
	"SIGNOUT_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into BITCAMP.MEMBER
SET DEFINE OFF;
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (2,'yaho','1234','userA',14,null,null,null,'IN',null,to_timestamp('2021/06/27 23:24:39.918679000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (27,'zcxv','1234','yyyy',22,'010232',null,null,'IN',null,to_timestamp('2021/06/27 18:33:45.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (36,'min1','1234','zxcv',32,'01010101011',null,null,'IN',null,to_timestamp('2021/07/01 16:07:39.591275000','RRRR/MM/DD HH24:MI:SSXFF'),null);
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (32,'zxcv','1234','야호',21,'01033392231',null,null,'IN',null,to_timestamp('2021/06/28 23:23:38.421311000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (31,'1233','1234','ya',10,'01',null,null,'IN',null,to_timestamp('2021/06/28 23:09:49.283408000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (26,'zxcv2','1234','2`````',15,'01020201032',null,null,'OUT','15115151',to_timestamp('2021/06/28 03:25:10.010516000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/06/29 00:23:00.021176000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (33,'qwer','1234','1234',15,'31',null,'asdfadsf@adsf.com','IN','123123',to_timestamp('2021/06/28 23:37:37.710495000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (34,'zxcv1','1234','afdf',32,'0202031402','서울시 서대문구 연희동',null,'IN',null,to_timestamp('2021/06/29 00:15:50.128289000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (35,'idid','1234','yahz',20,'01023421234',null,null,'IN',null,to_timestamp('2021/06/29 14:35:38.830234000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2099/12/31 23:59:59.146000000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (37,'min9','1919','yaho',22,'01010101011',null,null,'IN',null,to_timestamp('2021/07/01 16:12:30.637051000','RRRR/MM/DD HH24:MI:SSXFF'),null);
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (38,'asdf','1234','dd',19,'01022314123',null,null,'OUT',null,to_timestamp('2021/07/02 10:02:11.941769000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/07/02 10:03:27.805343000','RRRR/MM/DD HH24:MI:SSXFF'));
Insert into BITCAMP.MEMBER (UUID,ID,PASSWORD,NAME,AGE,PHONE,ADDRESS,EMAIL,AVAILABLE,LICENSE,SIGNUP_DATE,SIGNOUT_DATE) values (39,'sads','44565','fdhdgh',12,'01055675756',null,null,'IN',null,to_timestamp('2021/07/02 10:14:15.544679000','RRRR/MM/DD HH24:MI:SSXFF'),null);
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BITCAMP"."MEMBER_PK" ON "BITCAMP"."MEMBER" ("UUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007016
--------------------------------------------------------

  CREATE UNIQUE INDEX "BITCAMP"."SYS_C007016" ON "BITCAMP"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger MEMBER_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BITCAMP"."MEMBER_TRG" 
BEFORE INSERT ON MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "BITCAMP"."MEMBER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MEMBER_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BITCAMP"."MEMBER_TRG1" 
BEFORE INSERT ON MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.UUID IS NULL THEN
      SELECT MEMBER_UUID_SEQ.NEXTVAL INTO :NEW.UUID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "BITCAMP"."MEMBER_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "BITCAMP"."MEMBER" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BITCAMP"."MEMBER" MODIFY ("SIGNUP_DATE" NOT NULL ENABLE);
  ALTER TABLE "BITCAMP"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("UUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BITCAMP"."MEMBER" MODIFY ("AVAILABLE" NOT NULL ENABLE);
  ALTER TABLE "BITCAMP"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BITCAMP"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "BITCAMP"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);