--------------------------------------------------------
--  文件已创建 - 星期二-一月-05-2021   
--------------------------------------------------------
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
