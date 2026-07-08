CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionType VARCHAR2(20),
    Amount NUMBER(10,2)
);

CREATE TABLE AuditLog (
    LogID NUMBER PRIMARY KEY,
    TransactionID NUMBER,
    Action VARCHAR2(50),
    LogDate DATE
);

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog
    VALUES (
        :NEW.TransactionID,
        :NEW.TransactionID,
        'Transaction Inserted',
        SYSDATE
    );
END;
/

INSERT INTO Transactions
VALUES (101,1001,'Deposit',5000);

SELECT * FROM AuditLog;