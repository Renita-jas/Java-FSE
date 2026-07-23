CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    LoanAmount NUMBER(10,2),
    InterestRate NUMBER(5,2),
    DurationYears NUMBER
);

INSERT INTO Loans VALUES (101,'Rahul',500000,10,5);
INSERT INTO Loans VALUES (102,'Priya',300000,8,3);
INSERT INTO Loans VALUES (103,'Arun',200000,12,2);

COMMIT;

CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_LoanAmount NUMBER,
    p_InterestRate NUMBER,
    p_DurationYears NUMBER
)
RETURN NUMBER
IS
    v_MonthlyInstallment NUMBER;
BEGIN
    v_MonthlyInstallment := (p_LoanAmount + (p_LoanAmount * p_InterestRate * p_DurationYears / 100))
                            / (p_DurationYears * 12);

    RETURN v_MonthlyInstallment;
END;
/

SELECT LoanID,
       CustomerName,
       CalculateMonthlyInstallment(LoanAmount, InterestRate, DurationYears) AS MonthlyInstallment
FROM Loans;