CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    Balance NUMBER(10,2),
    Status VARCHAR2(20)
);

INSERT INTO Accounts VALUES (101,1,10000,'OPEN');
INSERT INTO Accounts VALUES (102,1,5000,'OPEN');
INSERT INTO Accounts VALUES (103,2,15000,'OPEN');

COMMIT;

CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(
        p_AccountID NUMBER,
        p_CustomerID NUMBER,
        p_Balance NUMBER
    );

    PROCEDURE CloseAccount(
        p_AccountID NUMBER
    );

    FUNCTION GetTotalBalance(
        p_CustomerID NUMBER
    ) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(
        p_AccountID NUMBER,
        p_CustomerID NUMBER,
        p_Balance NUMBER
    ) IS
    BEGIN
        INSERT INTO Accounts
        VALUES (p_AccountID,p_CustomerID,p_Balance,'OPEN');
    END;

    PROCEDURE CloseAccount(
        p_AccountID NUMBER
    ) IS
    BEGIN
        UPDATE Accounts
        SET Status = 'CLOSED'
        WHERE AccountID = p_AccountID;
    END;

    FUNCTION GetTotalBalance(
        p_CustomerID NUMBER
    ) RETURN NUMBER IS
        v_Total NUMBER;
    BEGIN
        SELECT SUM(Balance)
        INTO v_Total
        FROM Accounts
        WHERE CustomerID = p_CustomerID
        AND Status = 'OPEN';

        RETURN NVL(v_Total,0);
    END;

END AccountOperations;
/

BEGIN
    AccountOperations.OpenAccount(104,1,8000);
    AccountOperations.CloseAccount(102);
    COMMIT;
END;
/

SELECT AccountOperations.GetTotalBalance(1) AS TotalBalance
FROM DUAL;