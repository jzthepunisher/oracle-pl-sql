-- ch03_1a.sql
DECLARE
    v_average_cost VARCHAR2(10);
BEGIN
    SELECT TO_CHAR(AVG(cost), '$9,999.99')
      INTO v_average_cost
      FROM course;
    DBMS_OUTPUT.PUT_LINE('Average cost:'||v_average_cost);  
END;

-- ch03_2a.sql
DECLARE
    v_city zipcode.city%TYPE;
BEGIN
    SELECT city
      INTO v_city
      FROM zipcode
     WHERE zip = '43224';
     
    DBMS_OUTPUT.PUT_LINE('City name before UPDATE: '||v_city);
     
    UPDATE zipcode
       SET city = UPPER(city)
     WHERE zip = '43224';
     
    SELECT city
      INTO v_city
      FROM zipcode
     WHERE zip = '43224'; 
     
    DBMS_OUTPUT.PUT_LINE('City name after UPDATE: '||v_city);
END;

-- ch03_3a.sql
DECLARE
    v_zip   zipcode.zip%TYPE   := '30075';
    v_city  zipcode.city%TYPE  := 'Roswell';
    v_state zipcode.state%TYPE := 'GA';
BEGIN
    INSERT INTO zipcode
    (zip, city, state, created_by, created_date, modified_by, modified_date)
    VALUES
    (v_zip, v_city, v_state, user, sysdate, user, sysdate);
    
    UPDATE zipcode
       SET city = 'ROSWELL'
     WHERE zip = '30075';  
     
       DELETE
         FROM zipcode
        WHERE zip = '30075'
    RETURNING city, zip
         INTO v_city, v_zip;
     
     DBMS_OUTPUT.PUT_LINE(v_city||', '||v_zip);
END;


-- ch03_4a.sql

CREATE SEQUENCE test_seq
INCREMENT BY 10

CREATE TABLE test_tab (col1 NUMBER, col2 VARCHAR2(30));

SELECT * FROM test_tab;

DECLARE
    v_seq_value NUMBER;
BEGIN
    --Generate initial sequence number
    v_seq_value := test_seq.NEXTVAL;
    
    DBMS_OUTPUT.PUT_LINE('Initial sequence value: '|| TO_CHAR(v_seq_value));
    
    INSERT INTO test_tab(col1, col2)
    VALUES (v_seq_value, 'Row '||v_seq_value);
    
    -- Update col1 with the next sequence value
    UPDATE test_tab
    SET col1 = test_seq.NEXTVAL;
    
    DBMS_OUTPUT.PUT_LINE('Current sequence value: '|| TO_CHAR(test_seq.CURRVAL));
END;

-- ch03_5a.sql

SELECT *
  FROM TEST_TAB;
  
DECLARE
    v_col1 TEST_TAB.COL1%TYPE;
    v_col2 TEST_TAB.COL2%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Insert: ');
    INSERT INTO TEST_TAB(COL1, COL2)
    VALUES (test_seq.NEXTVAL, 'Row '||test_seq.CURRVAL);
    
    SAVEPOINT A;
    
    UPDATE TEST_TAB
    SET col2 = 'Update1 - '||col2
    WHERE col1 = 11
    RETURNING col1, col2
    INTO v_col1, v_col2;
    
    DBMS_OUTPUT.PUT_LINE('After update: '||v_col1||', '||v_col2);
    
    ROLLBACK TO A;
END;

SELECT *
FROM TEST_TAB;

-- ch03_6a.sql

DECLARE 
    v_col1 TEST_TAB.COL1%TYPE;
    v_col2 TEST_TAB.COL2%TYPE;
BEGIN
    -- Start a new transaction
    INSERT INTO TEST_TAB(col1, col2)
    VALUES(TEST_SEQ.NEXTVAL, 'Row '||TEST_SEQ.CURRVAL);
    
    --End transaction
    COMMIT;
    
    -- Start a second transaction
    UPDATE TEST_TAB
    SET col2 = 'Updated - ' || col2
    WHERE col1 = 11
    RETURNING col1, col2
    INTO v_col1, v_col2;
    
    DBMS_OUTPUT.PUT_LINE('After update: '||v_col1||', '||v_col2);
    
    -- End a second transaction
    COMMIT;
    
    -- Start a third transaction
    INSERT INTO TEST_TAB(col1, col2)
    VALUES(TEST_SEQ.NEXTVAL, 'Row '||TEST_SEQ.CURRVAL);
    
    -- End a third transaction
    ROLLBACK;
END;


-- ch03_6b.sql

DECLARE 
    v_col1 TEST_TAB.COL1%TYPE;
    v_col2 TEST_TAB.COL2%TYPE;
BEGIN
    -- Start a new transaction
    INSERT INTO TEST_TAB(col1, col2)
    VALUES(TEST_SEQ.NEXTVAL, 'Row '||TEST_SEQ.CURRVAL);
    
    -- PL/SQL Block 1
    DECLARE 
        v_col1 TEST_TAB.COL1%TYPE;
        v_col2 TEST_TAB.COL2%TYPE;
    BEGIN
        UPDATE TEST_TAB
        SET col2 = 'Updated - ' || col2
        WHERE col1 = 11
        RETURNING col1, col2
        INTO v_col1, v_col2;
        
        DBMS_OUTPUT.PUT_LINE('After update: '||v_col1||', '||v_col2);
    END;
    
    -- PL/SQL Block 2
    BEGIN
        INSERT INTO TEST_TAB(col1, col2)
        VALUES(TEST_SEQ.NEXTVAL, 'Row '||TEST_SEQ.CURRVAL);
    END;
    
    -- End transaction
    COMMIT;
    
END; 

-- ch03_7a.sql
DECLARE
    v_date DATE;
BEGIN
    -- Start a new READ ONLY transaction
    SET TRANSACTION READ ONLY NAME 'Get date';
    
    SELECT SYSDATE 
    INTO v_date
    FROM DUAL;
    
    DBMS_OUTPUT.PUT_LINE('Today is '||TO_CHAR(v_date, 'MM/DDD/YYYY'));
    
    -- End READ ONLY transaction
    COMMIT;
END;
