CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER(10,2),
    InterestRate NUMBER(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (101,'Rahul',65,15000,'FALSE');
INSERT INTO Customers VALUES (102,'Priya',45,8000,'FALSE');
INSERT INTO Customers VALUES (103,'Arun',70,25000,'FALSE');
INSERT INTO Customers VALUES (104,'Meena',35,12000,'FALSE');
INSERT INTO Customers VALUES (105,'Kiran',62,9000,'FALSE');

INSERT INTO Loans VALUES (201,101,500000,10,SYSDATE+15);
INSERT INTO Loans VALUES (202,102,200000,12,SYSDATE+45);
INSERT INTO Loans VALUES (203,103,300000,11,SYSDATE+20);
INSERT INTO Loans VALUES (204,104,150000,9,SYSDATE+10);
INSERT INTO Loans VALUES (205,105,250000,13,SYSDATE+25);

COMMIT;

DECLARE
    CURSOR c1 IS
        SELECT c.CustomerID, c.Age, l.LoanID
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID;
BEGIN
    FOR rec IN c1 LOOP
        IF rec.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = rec.LoanID;
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully.');
END;
/

SELECT * FROM Loans;