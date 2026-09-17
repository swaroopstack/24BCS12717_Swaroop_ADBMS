CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary NUMERIC,
    department VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE add_employee(
    p_emp_id INT,
    p_emp_name VARCHAR,
    p_emp_salary NUMERIC,
    p_department VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN

	IF p_emp_id % 2 = 0 THEN
		RAISE EXCEPTION 'EVEN not allowed';
	ELSE
		INSERT INTO employee 
		VALUES (p_emp_id, p_emp_name ,p_emp_salary , p_department );
	END IF;
END;
$$;

CALL add_employee(102, 'Rahul', 60000, 'HR');
CALL add_employee(101, 'Rahul', 60000, 'HR');

select * from employee;
