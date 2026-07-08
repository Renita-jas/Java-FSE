CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2)
);

INSERT INTO Customers VALUES (101,'Rahul',65,15000);
INSERT INTO Customers VALUES (102,'Priya',45,8000);
INSERT INTO Customers VALUES (103,'Arun',70,25000);

COMMIT;

CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_CustomerID NUMBER,
    p_CustomerName VARCHAR2,
    p_Age NUMBER,
    p_Balance NUMBER
)
IS
BEGIN
    INSERT INTO Customers
    VALUES (p_CustomerID, p_CustomerName, p_Age, p_Balance);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Customer added successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID already exists.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    AddNewCustomer(101,'Kiran',30,12000);
END;
/

SELECT * FROM Customers;