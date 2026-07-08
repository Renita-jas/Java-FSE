CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(50),
    MonthlySalary NUMBER(10,2)
);

INSERT INTO Employees VALUES (101,'Rahul','IT',50000);
INSERT INTO Employees VALUES (102,'Priya','HR',45000);

COMMIT;

CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(
        p_EmployeeID NUMBER,
        p_EmployeeName VARCHAR2,
        p_Department VARCHAR2,
        p_MonthlySalary NUMBER
    );

    PROCEDURE UpdateEmployee(
        p_EmployeeID NUMBER,
        p_Department VARCHAR2,
        p_MonthlySalary NUMBER
    );

    FUNCTION CalculateAnnualSalary(
        p_EmployeeID NUMBER
    ) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(
        p_EmployeeID NUMBER,
        p_EmployeeName VARCHAR2,
        p_Department VARCHAR2,
        p_MonthlySalary NUMBER
    ) IS
    BEGIN
        INSERT INTO Employees
        VALUES (p_EmployeeID,p_EmployeeName,p_Department,p_MonthlySalary);
    END;

    PROCEDURE UpdateEmployee(
        p_EmployeeID NUMBER,
        p_Department VARCHAR2,
        p_MonthlySalary NUMBER
    ) IS
    BEGIN
        UPDATE Employees
        SET Department = p_Department,
            MonthlySalary = p_MonthlySalary
        WHERE EmployeeID = p_EmployeeID;
    END;

    FUNCTION CalculateAnnualSalary(
        p_EmployeeID NUMBER
    ) RETURN NUMBER IS
        v_Salary NUMBER;
    BEGIN
        SELECT MonthlySalary * 12
        INTO v_Salary
        FROM Employees
        WHERE EmployeeID = p_EmployeeID;

        RETURN v_Salary;
    END;

END EmployeeManagement;
/

BEGIN
    EmployeeManagement.HireEmployee(103,'Arun','Finance',55000);
    EmployeeManagement.UpdateEmployee(101,'IT',60000);
    COMMIT;
END;
/

SELECT EmployeeManagement.CalculateAnnualSalary(101) AS AnnualSalary
FROM DUAL;