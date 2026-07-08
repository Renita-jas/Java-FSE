CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO Customers VALUES (101,'Rahul',10000);
INSERT INTO Customers VALUES (102,'Priya',15000);

COMMIT;

CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(
        p_CustomerID NUMBER,
        p_CustomerName VARCHAR2,
        p_Balance NUMBER
    );

    PROCEDURE UpdateCustomer(
        p_CustomerID NUMBER,
        p_Balance NUMBER
    );

    FUNCTION GetCustomerBalance(
        p_CustomerID NUMBER
    ) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(
        p_CustomerID NUMBER,
        p_CustomerName VARCHAR2,
        p_Balance NUMBER
    ) IS
    BEGIN
        INSERT INTO Customers
        VALUES (p_CustomerID,p_CustomerName,p_Balance);
    END;

    PROCEDURE UpdateCustomer(
        p_CustomerID NUMBER,
        p_Balance NUMBER
    ) IS
    BEGIN
        UPDATE Customers
        SET Balance = p_Balance
        WHERE CustomerID = p_CustomerID;
    END;

    FUNCTION GetCustomerBalance(
        p_CustomerID NUMBER
    ) RETURN NUMBER IS
        v_Balance NUMBER;
    BEGIN
        SELECT Balance
        INTO v_Balance
        FROM Customers
        WHERE CustomerID = p_CustomerID;

        RETURN v_Balance;
    END;

END CustomerManagement;
/

BEGIN
    CustomerManagement.AddCustomer(103,'Arun',12000);
    CustomerManagement.UpdateCustomer(101,18000);
    COMMIT;
END;
/

SELECT CustomerManagement.GetCustomerBalance(101) AS Balance
FROM DUAL;