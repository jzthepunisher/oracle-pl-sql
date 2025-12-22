DECLARE 
    v_name VARCHAR2(30);
    v_dbo  DATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(COALESCE(v_name, 'No Name')||' born on '||COALESCE(v_dbo, SYSDATE));
END;

-- For Example ch02_4a.sql
DECLARE
    v_result1 NUMBER;
    v_result2 NUMBER;
BEGIN
    v_result1 := (3 + 47) / 10;
    v_result2 := (3 + 47 / 10);
    DBMS_OUTPUT.PUT_LINE('v_result1: ' || v_result1);
    DBMS_OUTPUT.PUT_LINE('v_result2: ' || v_result2);
END;  

-- For Example ch02_5a.sql
DECLARE
    v_var1 VARCHAR2(20);
    v_var2 VARCHAR2(6);
    v_var3 NUMBER(5,3);
BEGIN
    v_var1 := 'string literal';
    v_var2 := '12.345';
    v_var3 := 12.345;
    DBMS_OUTPUT.PUT_LINE('v_var1: ' || v_var1);
    DBMS_OUTPUT.PUT_LINE('v_var2: ' || v_var2);
    DBMS_OUTPUT.PUT_LINE('v_var3: ' || v_var3);
END;  

-- ch02_6b.sql
DECLARE 
    v_first_name student.first_name%TYPE := 'Fred';
    v_name       VARCHAR(15) NOT NULL    := 'Some Name';
    v_new_name   v_name%TYPE             := 'Another Name';
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_first_name'||v_first_name);
    DBMS_OUTPUT.PUT_LINE('v_name'||v_name);
    DBMS_OUTPUT.PUT_LINE('v_new_name'||v_new_name);
END;

<<Outer>>
DECLARE
    v_var1 NUMBER;
    v_var2 VARCHAR2(3);
BEGIN
    v_var1 := 10;
    v_var2 := 'ABC';
    
    DBMS_OUTPUT.PUT_LINE('Outer Block');
    DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
    DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
    
    -- Inner Block
    <<Inner>>
    DECLARE
        v_var1 NUMBER;
    BEGIN
        v_var1 := 20;
        
        DBMS_OUTPUT.PUT_LINE('Inner Block');
        DBMS_OUTPUT.PUT_LINE('outer.v_var1: '||outer.v_var1);
        DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
        DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
        
    END;
    
        DBMS_OUTPUT.PUT_LINE('Back in Outer Block');
        DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
        DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
END;

