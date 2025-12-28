-- ch06_1a.sql

DECLARE
    v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
        -- increment loop counter by one
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
        
        -- if exit condition yields TRUE exit the loop
        IF v_counter = 5 THEN
            EXIT;
        END IF;
        -- EXIT WHEN v_counter = 5
    END LOOP;
    
    -- control resume here
    DBMS_OUTPUT.PUT_LINE('Done...');
END;

-- ch06_2b.sql

DECLARE
     v_counter NUMBER := 1;
BEGIN
    WHILE v_counter < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
        
        -- decrement the value of v_counter by one
        v_counter := v_counter + 1;
    END LOOP;
END;

-- ch06_3a.sql

DECLARE
     v_counter NUMBER := 1;
BEGIN
    WHILE v_counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
        
        IF v_counter = 2 THEN
            EXIT;
        END IF;
        
        v_counter := v_counter + 1;
    END LOOP;
END;

-- ch06_4a.sql

BEGIN
    FOR v_counter IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;
END;

-- ch06_4c.sql
<<MainBlock>>
DECLARE
    v_counter NUMBER := 7;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before FOR loop...');
    DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    
    FOR v_counter IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
        DBMS_OUTPUT.PUT_LINE('MainBlock.v_counter = '||MainBlock.v_counter);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('After FOR loop...');
    DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
END;

-- ch06_5a.sql

BEGIN
    FOR v_counter IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;

-- ch06_6a.sql

BEGIN
    FOR v_counter IN 1..10 BY 2 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;

-- ch06_6d.sql

BEGIN
    FOR v_counter IN 1..10 WHEN MOD(v_counter, 2) = 0 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;

-- ch06_7a.sql

BEGIN
    FOR v_counter IN 1 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;

-- ch06_7b.sql

BEGIN
    FOR v_counter IN 1, REPEAT v_counter + 3 WHILE v_counter <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;


-- ch06_7c.sql

BEGIN
    FOR v_counter IN 1..5, REVERSE 20..25, v_counter*3..v_counter*3+5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;

-- ch06_8a.sql

BEGIN
    FOR v_counter IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
        EXIT WHEN v_counter = 3;
    END LOOP;  
END;

-- ch06_8b.sql

BEGIN
    FOR v_counter IN 1..5 WHILE v_counter <= 3 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = '||v_counter);
    END LOOP;  
END;