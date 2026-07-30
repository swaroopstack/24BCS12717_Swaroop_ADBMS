-- FULL OUTER JOIN the 'student' and 'course' tables using 'Course_id' to match the tables. Output the joined table.

select * from student s full OUTER JOIN course c 
on s.Course_id=c.Course_id;