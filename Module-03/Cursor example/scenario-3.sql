CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    InterestRate NUMBER(5,2)
);

INSERT INTO Loans VALUES (101,'Rahul',10);
INSERT INTO Loans VALUES (102,'Priya',12);
INSERT INTO Loans VALUES (103,'Arun',11);

COMMIT;

DECLARE
    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID
        FROM Loans;

    rec UpdateLoanInterestRates%ROWTYPE;
BEGIN
    OPEN UpdateLoanInterestRates;

    LOOP
        FETCH UpdateLoanInterestRates INTO rec;
        EXIT WHEN UpdateLoanInterestRates%NOTFOUND;

        UPDATE Loans
        SET InterestRate = InterestRate + 0.5
        WHERE LoanID = rec.LoanID;
    END LOOP;

    CLOSE UpdateLoanInterestRates;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Loan interest rates updated successfully.');
END;
/

SELECT * FROM Loans;