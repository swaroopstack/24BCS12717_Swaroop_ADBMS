CREATE OR REPLACE TRIGGER trg_salary_hike_limit
BEFORE UPDATE OF salary
ON Salary_Hike
FOR EACH ROW

DECLARE
    e_salary_limit EXCEPTION;
BEGIN
    
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE e_salary_limit;
    END IF;

EXCEPTION
    WHEN e_salary_limit THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary increase cannot exceed 15% of the old salary.'
        );
END;
/
