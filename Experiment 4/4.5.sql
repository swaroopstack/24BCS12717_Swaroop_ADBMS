-- 1.Employee and Manager Names: Display a list of employee names along with their manager's names. Use the 'employees' table provided.
SELECT
    e.employee_name AS Employee,
    m.employee_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
-- 2.Every Possible Combination: Show every possible combination of 'customer_name' from the 'customers' table and 'product_name' from the 'products' table.
SELECT
    c.customer_name,
    p.product_name
FROM customers c, products p;