CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2),
    LastModified DATE
);

INSERT INTO Customers VALUES (101,'Rahul',10000,SYSDATE);
INSERT INTO Customers VALUES (102,'Priya',15000,SYSDATE);

COMMIT;

CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

UPDATE Customers
SET Balance = 12000
WHERE CustomerID = 101;

SELECT * FROM Customers;