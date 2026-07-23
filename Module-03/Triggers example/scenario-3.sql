CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionType VARCHAR2(20),
    Amount NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'Rahul',10000);
INSERT INTO Accounts VALUES (102,'Priya',5000);

COMMIT;

CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_Balance NUMBER;
BEGIN
    IF :NEW.TransactionType = 'Deposit' THEN
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20001,'Deposit amount must be positive.');
        END IF;
    ELSIF :NEW.TransactionType = 'Withdrawal' THEN
        SELECT Balance
        INTO v_Balance
        FROM Accounts
        WHERE AccountID = :NEW.AccountID;

        IF :NEW.Amount > v_Balance THEN
            RAISE_APPLICATION_ERROR(-20002,'Insufficient balance.');
        END IF;
    END IF;
END;
/

INSERT INTO Transactions
VALUES (101,101,'Withdrawal',3000);

SELECT * FROM Transactions;