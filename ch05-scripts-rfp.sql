-- ch05_1b.sql

DECLARE    
    v_num       NUMBER := &sv_user_num;
    v_num_flag  NUMBER;
BEGIN
    v_num_flag := MOD(v_num,2);

    -- test if the number provided by the user is even
    CASE v_num_flag
    WHEN 0 THEN 
        DBMS_OUTPUT.PUT_LINE(v_num||' is even number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num||' is odd number');
    END CASE;
    
END;

-- ch05_1c.sql

DECLARE    
    v_num       NUMBER := &sv_user_num;
BEGIN

    -- test if the number provided by the user is even
    CASE 
    WHEN MOD(v_num,2) = 0 THEN 
        DBMS_OUTPUT.PUT_LINE(v_num||' is even number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num||' is odd number');
    END CASE;
    
END;

-- ch05_3a.sql

DECLARE    
    v_final_grade   NUMBER := &sv_final_grade;
    v_letter_grade  CHAR(1);
BEGIN

    -- test if the number provided by the user is even
    CASE 
    WHEN v_final_grade >= 90 THEN 
        v_letter_grade := 'A';
    WHEN v_final_grade >= 80 THEN 
        v_letter_grade := 'B';    
    WHEN v_final_grade >= 70 THEN 
        v_letter_grade := 'C';   
    WHEN v_final_grade >= 60 THEN 
        v_letter_grade := 'D';      
    ELSE
        v_letter_grade := 'F';
    END CASE;
    
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE('Final grade is: '||v_final_grade);
    DBMS_OUTPUT.PUT_LINE('Letter grade is: '||v_letter_grade);
END;

-- ch05_1e.sql

DECLARE  
    v_num       NUMBER := &sv_user_num;
    v_num_flag  NUMBER;
    v_result    VARCHAR2(30);
BEGIN
    v_num_flag := MOD(v_num, 2);
    
    v_result := CASE v_num_flag
                    WHEN 0 THEN
                        v_num||' is even number'
                    ELSE
                        v_num||' is odd number'
                END;
    DBMS_OUTPUT.PUT_LINE(v_result);   
END;

-- ch05_1f.sql

DECLARE 
    v_num       NUMBER := &sv_user_num;
    v_result    VARCHAR2(30);
BEGIN
    v_result := CASE 
                    WHEN MOD(v_num, 2) = 0 THEN
                        v_num||' is even number'
                    ELSE
                        v_num||' is odd number'
                END;
    DBMS_OUTPUT.PUT_LINE(v_result);                
END;

-- ch05_4a.sql

DECLARE
    v_course_no     NUMBER;
    v_description   VARCHAR2(50);
    v_prereq        VARCHAR2(35);
BEGIN
    SELECT course_no,description, CASE WHEN prerequisite IS NULL THEN
                                            'No prerequisite course required'
                                       ELSE
                                            TO_CHAR(prerequisite)
                                  END prerequisite
    INTO v_course_no, v_description, v_prereq                                  
    FROM course
    WHERE course_no = 20;
    
    DBMS_OUTPUT.PUT_LINE('Course:       '||v_course_no);
    DBMS_OUTPUT.PUT_LINE('Description:  '||v_description);
    DBMS_OUTPUT.PUT_LINE('Prerequisite: '||v_prereq);
END;

-- ch05_5a.sql

DECLARE
    v_num       NUMBER := &sv_user_num;
    v_remainder NUMBER;
BEGIN
    v_remainder := NULLIF(MOD(v_num, 2), 0); 
    DBMS_OUTPUT.PUT_LINE('v_remainder: '||v_remainder);
END;

-- ch05_6a.sql

SELECT e.student_id
      ,e.section_id
      ,e.final_grade
      ,g.numeric_grade
      ,COALESCE(e.final_grade, g.numeric_grade, 0) grade
  FROM enrollment e
      ,grade g
 WHERE e.student_id = g.student_id
   AND e.section_id = g.section_id
   AND e.student_id = 102
   AND g.grade_type_code = 'FI';

   