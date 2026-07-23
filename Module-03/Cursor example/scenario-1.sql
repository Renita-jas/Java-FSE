CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50)
);

CREATE TABLE BankTransactions (
    TransactionID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    TransactionDate DATE,
    Amount NUMBER(10,2)
);

INSERT INTO Customers VALUES (101,'Rahul');
INSERT INTO Customers VALUES (102,'Priya');
INSERT INTO Customers VALUES (103,'Arun');

INSERT INTO BankTransactions VALUES (1,101,SYSDATE-5,5000);
INSERT INTO BankTransactions VALUES (2,101,SYSDATE-2,2000);
INSERT INTO BankTransactions VALUES (3,102,SYSDATE-10,3500);
INSERT INTO BankTransactions VALUES (4,103,SYSDATE-1,4500);

COMMIT;

DECLARE
    CURSOR GenerateMonthlyStatements IS
        SELECT c.CustomerName,
               b.TransactionID,
               b.TransactionDate,
               b.Amount
        FROM Customers c
        JOIN BankTransactions b
        ON c.CustomerID = b.CustomerID;

    rec GenerateMonthlyStatements%ROWTYPE;
BEGIN
    OPEN GenerateMonthlyStatements;

    LOOP
        FETCH GenerateMonthlyStatements INTO rec;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Customer: ' || rec.CustomerName ||
            ', Transaction ID: ' || rec.TransactionID ||
            ', Date: ' || TO_CHAR(rec.TransactionDate,'DD-MON-YYYY') ||
            ', Amount: ' || rec.Amount
        );
    END LOOP;

    CLOSE GenerateMonthlyStatements;
END;
/