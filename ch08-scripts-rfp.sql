-- ch08_1b.sql

DECLARE
    v_num1   INTEGER := &sv_num1;
    v_num2   INTEGER := &sv_num2;
    v_result NUMBER;
BEGIN
    v_result := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE('v_result: '||v_result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('A number cannot be divided by zero.');
END;

-- ch08_2a.sql

DECLARE
    v_student_name VARCHAR2(50);
BEGIN
    SELECT first_name||' '||last_name
    INTO v_student_name
    FROM student
    WHERE student_id = 101;
    
    DBMS_OUTPUT.PUT_LINE('Student name is '||v_student_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('There is no such student');
END;


-- ch08_3a.sql

DECLARE
    v_student_id NUMBER      :=  &sv_student_id;
    v_enrolled   VARCHAR2(3) := 'NO';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Check if the student is enrolled');
    SELECT 'YES'
    INTO v_enrolled
    FROM enrollment
    WHERE student_id = v_student_id;
    
    DBMS_OUTPUT.PUT_LINE('The student is enrolled in one courses');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The student is not enrolled');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('The student is enrolled in multiple courses');    
END;

-- ch08_4a.sql

DECLARE
    v_instructor_id   NUMBER      :=  &sv_instructor_id;
    v_instructor_name VARCHAR2(50);
BEGIN
    
    SELECT first_name||' '||last_name
    INTO v_instructor_name
    FROM instructor
    WHERE instructor_id = v_instructor_id;
    
    DBMS_OUTPUT.PUT_LINE('Instructor name is '||v_instructor_name);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred');  
END;
