--devuelve
SELECT tablespace_name
FROM dba_tablespaces
ORDER BY tablespace_name;
     

ALTER SESSION SET "_ORACLE_SCRIPT"=true;
    
CREATE USER student IDENTIFIED by learn
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO student;

select * from dba_ts_quotas;

alter user STUDENT quota 3G on USERS;