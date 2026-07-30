/* Write a query to do the following:
 - JOIN the tables 'student' and 'course' using 'Course_id' to match both the tables and output the joined table.
 - LEFT JOIN the tables 'student' and 'course' using 'Course_id' to match both the tables and output the joined table. */
 
 -- INNER JOIN
SELECT *
FROM student s
JOIN course c
ON s.Course_id = c.Course_id;

-- LEFT JOIN 
 select * from student s LEFT JOIN course c 
on s.Course_id=c.Course_id;