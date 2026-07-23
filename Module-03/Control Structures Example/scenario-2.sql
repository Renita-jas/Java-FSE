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
    CURSOR c2 IS
        SELECT CustomerID, Balance
        FROM Customers;
BEGIN
    FOR rec IN c2 LOOP
        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = rec.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VIP status updated successfully.');
END;
/

SELECT * FROM Customers;