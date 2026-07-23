CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    DateOfBirth DATE
);

INSERT INTO Customers VALUES (101,'Rahul',TO_DATE('15-05-1990','DD-MM-YYYY'));
INSERT INTO Customers VALUES (102,'Priya',TO_DATE('20-08-1985','DD-MM-YYYY'));
INSERT INTO Customers VALUES (103,'Arun',TO_DATE('10-12-2000','DD-MM-YYYY'));

COMMIT;

CREATE OR REPLACE FUNCTION CalculateAge(
    p_DOB DATE
)
RETURN NUMBER
IS
    v_Age NUMBER;
BEGIN
    v_Age := FLOOR(MONTHS_BETWEEN(SYSDATE, p_DOB) / 12);
    RETURN v_Age;
END;
/

SELECT CustomerID,
       CustomerName,
       CalculateAge(DateOfBirth) AS Age
FROM Customers;