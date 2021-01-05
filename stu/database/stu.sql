--------------------------------------------------------
--  文件已创建 - 星期二-一月-05-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COURSE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COURSE" 
   (	"CID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"TID" VARCHAR2(20 BYTE), 
	"CREDIT" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SC
--------------------------------------------------------

  CREATE TABLE "SCOTT"."SC" 
   (	"SCID" VARCHAR2(20 BYTE), 
	"STID" VARCHAR2(20 BYTE), 
	"CID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."STUDENT" 
   (	"STID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SEX" VARCHAR2(20 BYTE), 
	"AGE" NUMBER(10,0), 
	"PWDS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.COURSE
SET DEFINE OFF;
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('201','C','1',5);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('202','JAVA','2',5);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('203','PYTHON','3',5);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('204','WEB','4',4);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('205','DATASTRUC','5',4);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('206','PHP','6',3);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('207','ENGLISH','7',2);
Insert into SCOTT.COURSE (CID,NAME,TID,CREDIT) values ('208','MUSIC','8',1);
REM INSERTING into SCOTT.SC
SET DEFINE OFF;
Insert into SCOTT.SC (SCID,STID,CID) values ('1','101','201');
Insert into SCOTT.SC (SCID,STID,CID) values ('8','101','205');
Insert into SCOTT.SC (SCID,STID,CID) values ('3','101','202');
Insert into SCOTT.SC (SCID,STID,CID) values ('4','101','203');
REM INSERTING into SCOTT.STUDENT
SET DEFINE OFF;
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('101','LIHUA','MAN',19,'123456');
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('102','LIFEI','WOMAN',18,'123456');
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('103','CHENHE','MAN',20,'123456');
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('104','LUFEI','WOMAN',19,'123456');
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('105','ZHENGKAI','MAN',20,'123456');
Insert into SCOTT.STUDENT (STID,NAME,SEX,AGE,PWDS) values ('106','ZHAOWEI','WOMAN',18,'123456');
--------------------------------------------------------
--  DDL for Index COURSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."COURSE_PK" ON "SCOTT"."COURSE" ("CID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CURRICULA_VARIABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CURRICULA_VARIABLE_PK" ON "SCOTT"."SC" ("SCID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."STUDENT_PK" ON "SCOTT"."STUDENT" ("STID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table COURSE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COURSE" ADD CONSTRAINT "COURSE_PK" PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."COURSE" MODIFY ("CID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SC
--------------------------------------------------------

  ALTER TABLE "SCOTT"."SC" ADD CONSTRAINT "CURRICULA_VARIABLE_PK" PRIMARY KEY ("SCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."SC" MODIFY ("SCID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("STID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."STUDENT" MODIFY ("STID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SC
--------------------------------------------------------

  ALTER TABLE "SCOTT"."SC" ADD CONSTRAINT "CURRICULA_VARIABLE_COURSE_FK1" FOREIGN KEY ("CID")
	  REFERENCES "SCOTT"."COURSE" ("CID") ENABLE;
  ALTER TABLE "SCOTT"."SC" ADD CONSTRAINT "CURRICULA_VARIABLE_STUDEN_FK1" FOREIGN KEY ("STID")
	  REFERENCES "SCOTT"."STUDENT" ("STID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERT_SV_TUTOINC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SCOTT"."INSERT_SV_TUTOINC" 
before insert on "SC"
for each row
begin
select CV_autoinc.nextval into :NEW.SCID from dual;
end insert_CV_autoinc;
/
ALTER TRIGGER "SCOTT"."INSERT_SV_TUTOINC" ENABLE;
