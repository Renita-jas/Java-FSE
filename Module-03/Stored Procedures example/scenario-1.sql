CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'Rahul','Savings',10000);
INSERT INTO Accounts VALUES (102,'Priya','Savings',15000);
INSERT INTO Accounts VALUES (103,'Arun','Current',20000);
INSERT INTO Accounts VALUES (104,'Meena','Savings',12000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly interest processed successfully.');
END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;