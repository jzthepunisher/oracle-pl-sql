-- ch07_1a.sql

DECLARE
     v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
        -- increment loop counter by one
        v_counter := v_counter + 1;
    
    
        DBMS_OUTPUT.PUT_LINE('Before continue condition, v_counter  = '||v_counter);
        
        -- if continue condition yields TRUE pass control to the
        -- first executable statement of the loop
        IF v_counter < 3 THEN
            CONTINUE;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('After continue condition, v_counter  = '||v_counter);
        
        -- if exit condition yields TRUE exit the loop
    
        IF v_counter = 5 THEN
            EXIT;
        END IF;
        
    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE('Done...');
END;


-- ch07_1b.sql

DECLARE
     v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
        -- increment loop counter by one
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE('Before continue condition, v_counter  = '||v_counter);
            
        -- if exit condition yields TRUE exit the loop
    
        IF v_counter = 5 THEN
            EXIT;
        END IF;
        
        -- if continue condition yields TRUE pass control to the
        -- first executable statement of the loop
        CONTINUE WHEN v_counter > 3;

        DBMS_OUTPUT.PUT_LINE('After continue condition, v_counter  = '||v_counter);        
    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE('Done...');
END;

-- ch07_2a.sql

DECLARE
     v_counter1 BINARY_INTEGER := 0;
     v_counter2 BINARY_INTEGER;
BEGIN
    WHILE v_counter1 < 3 LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter1: '||v_counter1);
        v_counter2 := 0;
        
        LOOP
            DBMS_OUTPUT.PUT_LINE('v_counter2: '||v_counter2);
            v_counter2 := v_counter2 + 1;
            EXIT WHEN v_counter2 >= 2;
        END LOOP;
        v_counter1 := v_counter1 +1; 
    END LOOP;
END;

-- ch07_3a.sql

BEGIN
    <<outer_loop>>
    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('i = '||i);
        <<inner_loop>>
        FOR j IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE('j = : '||j);
        END LOOP inner_loop;
    END LOOP outer_loop;
END;

-- ch07_4a.sql

BEGIN
    <<outer>>
    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('i = '||i);
        <<inner>>
        FOR i IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE('outer.i '||outer.i);
            DBMS_OUTPUT.PUT_LINE('inner.i '||inner.i);
        END LOOP inner_loop;
    END LOOP outer_loop;
END;

-- ch07_4b.sql

BEGIN
    <<outer>>
    FOR i IN 1..3 LOOP
        <<inner>>
        DBMS_OUTPUT.PUT_LINE('outer.i '||i);
        FOR i IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE(' outer.i '||i);
            DBMS_OUTPUT.PUT_LINE(' inner.i '||i);
        END LOOP inner;
    END LOOP outer;
END;