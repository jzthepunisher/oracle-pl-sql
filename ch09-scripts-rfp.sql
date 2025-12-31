-- ch09_1b.sql

<<outer_block>>
DECLARE
    v_student_id NUMBER := &sv_student_id;
    v_name       VARCHAR2(30);
    v_total      NUMBER(1);
BEGIN
    
    SELECT RTRIM(first_name)||' '||RTRIM(last_name)
    INTO v_name
    FROM student
    WHERE student_id = v_student_id;
    
    DBMS_OUTPUT.PUT_LINE('Student name is: '||v_name);
    
    <<inner_block>>
    BEGIN
        SELECT COUNT(student_id)
        INTO v_total
        FROM enrollment
        WHERE student_id = v_student_id;
        
        DBMS_OUTPUT.PUT_LINE('Student is registered for '||v_total||' courses(s)');
    EXCEPTION
        WHEN VALUE_ERROR OR INVALID_NUMBER THEN
            DBMS_OUTPUT.PUT_LINE('An error has ocurred');
    END;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('There is no such student.');
END;

-- ch09_1c.sql

<<outer_block>>
DECLARE
    v_student_id NUMBER := &sv_student_id;
    v_name       VARCHAR2(30);
    v_registered CHAR;
BEGIN
    
    SELECT RTRIM(first_name)||' '||RTRIM(last_name)
    INTO v_name
    FROM student
    WHERE student_id = v_student_id;
    
    DBMS_OUTPUT.PUT_LINE('Student name is: '||v_name);
    
    <<inner_block>>
    BEGIN
        SELECT 'Y'
        INTO v_registered
        FROM enrollment
        WHERE student_id = v_student_id;
        
        DBMS_OUTPUT.PUT_LINE('Student is registered');
    EXCEPTION
        WHEN VALUE_ERROR OR INVALID_NUMBER THEN
            DBMS_OUTPUT.PUT_LINE('An error has ocurred');
    END;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('There is no such student.');
END;


-- ch09_2a.sql

DECLARE
    v_student_id    STUDENT.STUDENT_ID%TYPE := &sv_student_id;
    v_total_courses NUMBER;
    e_invalid_id    EXCEPTION;
BEGIN
    IF v_student_id < 0 THEN
        RAISE e_invalid_id;
    END IF;
    
    SELECT COUNT(*)
    INTO v_total_courses
    FROM enrollment
    WHERE student_id = v_student_id;
    
    DBMS_OUTPUT.PUT_LINE('The student is registered for '||v_total_courses||' courses');
    DBMS_OUTPUT.PUT_LINE('No exception has been raised');
EXCEPTION
    WHEN e_invalid_id THEN
        DBMS_OUTPUT.PUT_LINE('An ID cannot be negative');
END;
    
-- ch09_3a.sql

<<outer_block>>    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer block');
    
    <<inner_block>>
    DECLARE
        e_my_exception EXCEPTION;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Inner block');
    EXCEPTION
        WHEN e_my_exception THEN
            DBMS_OUTPUT.PUT_LINE('An error has ocurred');
    END;
    
    IF 10 < &sv_number THEN
        RAISE e_my_exception;
    END IF;
END;    

-- ch09_4a.sql

DECLARE
    v_test_var CHAR(3) := 'ABCDE';    
BEGIN
    DBMS_OUTPUT.PUT_LINE('This is a test');
EXCEPTION
    WHEN INVALID_NUMBER OR VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocdurred');
END;

-- ch09_4b.sql

<<outer_block>>
BEGIN
    <<inner_block>>
    DECLARE
        v_test_var CHAR(3) := 'ABCDE';    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('This is a test');
    EXCEPTION
        WHEN INVALID_NUMBER OR VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('An error has ocurred in the inner block');
    END;
EXCEPTION
    WHEN INVALID_NUMBER OR VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the program');
END; 

-- ch09_5a.sql

DECLARE
    v_test_var CHAR(3) := 'ABC';
BEGIN

    v_test_var := '1234';    
    DBMS_OUTPUT.PUT_LINE('v_test_var: '||v_test_var);

EXCEPTION
    WHEN INVALID_NUMBER OR VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Before an error has ocurred');
        v_test_var := 'ABCD';
        DBMS_OUTPUT.PUT_LINE('An error has ocurred');
END;

-- ch09_5b.sql

<<outer_block>>
BEGIN
    <<inner_block>>
    DECLARE
        v_test_var CHAR(3) := 'ABC';
    BEGIN
        v_test_var := '1234';
        DBMS_OUTPUT.PUT_LINE('v_test_var: '||v_test_var);
    EXCEPTION
        WHEN INVALID_NUMBER OR VALUE_ERROR THEN
            v_test_var := 'ABCD';
            DBMS_OUTPUT.PUT_LINE('An error has ocurred in the inner block');
    END;
EXCEPTION
    WHEN INVALID_NUMBER OR VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the program');
END;

-- ch09_6a.sql

<<outer_block>>
DECLARE
    e_exception1 EXCEPTION;
    e_exception2 EXCEPTION;
BEGIN
    <<inner_block>>
    BEGIN
        RAISE e_exception1;
    EXCEPTION
        WHEN e_exception1 THEN
            RAISE e_exception2;
        WHEN e_exception2 THEN    
            DBMS_OUTPUT.PUT_LINE('An error has ocurred in the inner block');
    END;
EXCEPTION
    WHEN e_exception2 THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the program');
END; 

-- ch09_7a.sql

<<outer_block>>
DECLARE
    e_exception EXCEPTION;
BEGIN
    <<inner_block>>
    BEGIN
        RAISE e_exception;
    EXCEPTION
        WHEN e_exception THEN
            RAISE;
    END;
EXCEPTION
    WHEN e_exception THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred');
END; 