-- ch04_1a.sql

DECLARE
    v_num1 NUMBER := 5;
    v_num2 NUMBER := 3;
    v_temp NUMBER;
BEGIN
    -- if v_num1 is greater than v_num2 rearrange their values
    IF v_num1 > v_num2 THEN
        v_temp := v_num1;
        v_num1 := v_num2;
        v_num2 := v_temp;
    END IF;
    
    -- dsplay the values of v_nnum1 and v_num2
    DBMS_OUTPUT.PUT_LINE('v_num1 = '||v_num1);
    DBMS_OUTPUT.PUT_LINE('v_num2 = '||v_num2);
END;

-- ch04_1b.sql

DECLARE
    v_num NUMBER := &sv_user_name;
BEGIN
    -- test if the number provided by the user is even
    IF MOD(v_num,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num||' is even number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num||' is odd number');
    END IF;
END;

-- ch04_2a.sql
    
DECLARE
    v_num1 NUMBER := 0;
    v_num2 NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before IF statement...');

    IF v_num1 = v_num2 THEN
        DBMS_OUTPUT.PUT_LINE(' v_num1 = v_num2 ');
    ELSE
        DBMS_OUTPUT.PUT_LINE(' v_num1 != v_num2 ');
    END IF;    

    DBMS_OUTPUT.PUT_LINE(' After IF statement...');
END;
    
-- ch04_3a.sql

DECLARE
    v_num NUMBER := &sv_num;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before IF statement...');

    IF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num||' is a negative number');
    ELSIF v_num = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num||' is equal to zero');
    ELSE    
        DBMS_OUTPUT.PUT_LINE(v_num||' is a positive number');
    END IF;    

    DBMS_OUTPUT.PUT_LINE(' After IF statement...');
END;

-- ch04_4a.sql

DECLARE    
    v_num1 NUMBER := &sv_num1;
    v_num2 NUMBER := &sv_num2;
    v_total NUMBER;
BEGIN
    IF v_num1 > v_num2 THEN
        DBMS_OUTPUT.PUT_LINE(' IF part of the outer IF');
        v_total := v_num1 - v_num2;
    ELSE
        DBMS_OUTPUT.PUT_LINE(' ELSE part of the outer IF');
        v_total := v_num1 + v_num2;
        
        IF v_total < 0 THEN
            DBMS_OUTPUT.PUT_LINE(' Inner IF');
            v_total := v_total * (-1);
        END IF; 
    END IF;
    DBMS_OUTPUT.PUT_LINE(' v_total = '||v_total);
END;