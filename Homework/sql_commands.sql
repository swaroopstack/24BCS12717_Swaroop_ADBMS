-- Easy
SELECT age_bucket,
ROUND(100.0*SUM(CASE WHEN activity_type='send' THEN time_spent ELSE 0 END)/SUM(CASE WHEN activity_type IN('send','open') THEN time_spent ELSE 0 END),2) AS send_perc,
ROUND(100.0*SUM(CASE WHEN activity_type='open' THEN time_spent ELSE 0 END)/SUM(CASE WHEN activity_type IN('send','open') THEN time_spent ELSE 0 END),2) AS open_perc
FROM activities
JOIN age_breakdown
ON activities.user_id=age_breakdown.user_id
GROUP BY age_bucket;


-- Hard
SELECT e.department,
e.id,
e.salary,
m.salary AS manager_salary,
ROUND(AVG(CASE WHEN e2.id<>e2.manager_id THEN e2.salary END)) AS avg_salary
FROM employee_o e
JOIN employee_o m
ON e.manager_id=m.id
JOIN employee_o e2
ON e.department=e2.department
GROUP BY e.department,e.id,e.salary,m.salary
ORDER BY e.department,e.salary DESC;