CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'Rahul',10000);
INSERT INTO Accounts VALUES (102,'Priya',15000);
INSERT INTO Accounts VALUES (103,'Arun',8000);

COMMIT;

DECLARE
    CURSOR ApplyAnnualFee IS
        SELECT AccountID
        FROM Accounts;

    rec ApplyAnnualFee%ROWTYPE;
BEGIN
    OPEN ApplyAnnualFee;

    LOOP
        FETCH ApplyAnnualFee INTO rec;
        EXIT WHEN ApplyAnnualFee%NOTFOUND;

        UPDATE Accounts
        SET Balance = Balance - 500
        WHERE AccountID = rec.AccountID;
    END LOOP;

    CLOSE ApplyAnnualFee;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Annual maintenance fee applied successfully.');
END;
/

SELECT * FROM Accounts;