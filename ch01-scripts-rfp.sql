-- *** Chapter Exercises *** --
-- For Example ch01_1a.sql

    
SET VERIFY OFF;

DECLARE 
    v_student_id NUMBER := &sv_student_id;
    v_first_name VARCHAR2(35);
    v_last_name  VARCHAR2(35);
BEGIN
    
    SELECT first_name, last_name
      INTO v_first_name, v_last_name
      FROM student
     WHERE student_id = v_student_id;
     
     DBMS_OUTPUT.PUT_LINE ('Student name: '||v_first_name||' '||v_last_name);
EXCEPTION
    WHEN NO_DATA_FOUND 
    THEN 
        DBMS_OUTPUT.PUT_LINE('There is no student with student id 123');
 END;     
 

BEGIN
    DBMS_OUTPUT.PUT_LINE('Today is '||'&&sv_day');
    DBMS_OUTPUT.PUT_LINE('Tomorrow will be '||'&sv_day');
END;

SET DEFINE &

SET DEFINE ON

SET DEFINE OFF