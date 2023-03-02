-- Creating the table students
CREATE TABLE students (
    id varchar(225),
    name  varchar(255) NOT NULL,
    date_of_birth DATE
);

--Creating the table grades
CREATE TABLE grades(
    student_id varchar(225),
    subject varchar(255) NOT NULL,
    grade int(10)
);

--1.  Select all columns from the "students" table
SELECT * FROM students;

--2. Alter the "grades" table to add a column "teacher" of data type varchar(50).
ALTER TABLE grades
ADD teacher varchar(50);

--3. Update the "grades" table to set the value of the "teacher" column to "Mr. Smith" for all row
UPDATE grades
SET teacher = 'Mr. Smith';

-4.Delete all rows from the "grades" table where the grade is less than 60.
DELETE FROM grades WHERE grade < 60;

--5. Drop the "grades" table
DROP TABLE grades;

--6.Insert a new row into the "students" table with values for "name" and "date_of_birth".
 INSERT INTO students(name,date_of_birth) VALUES('Anthony','2010-11-21');

 --7 Select all rows from the "students" table where the "name" column contains the string "John".
 SELECT * FROM students WHERE name ='John';

 --8. Select all rows from the "students" table where the "date_of_birth" column is between '2000-01-01' and '2010-12-31', ordered by the "name" column in descending order.
 SELECT * FROM students WHERE date_of_birth BETWEEN '2000-01-01' AND '2010-12-31' ORDER BY students.name DESC;

 --9. Select all rows from the "grades" table where the "subject" column contains the string "Math".
SELECT * FROM grades WHERE subject = 'math';

--10.  Set the "id" column of the "students" table as the primary key.
ALTER TABLE students ADD PRIMARY KEY(id);

--11. Set the "student_id" column of the "grades" table as the foreign key referencing the "id" column of the "students" table.
ALTER TABLE grades 
ADD FOREIGN KEY (student_id) REFERENCES student(id);

--12. Use a join to select the "name" and "subject" columns from the "students" and "grades" tables respectively, where the "grade" column in the "grades" table is greater than or equal to 80, using an equi join.
SELECT students.name, grades.subject
 FROM students JOIN grades ON students.id = grades.student_id 
 WHERE grades.grade >= 80;

--13. Use a join to select the "name" and "subject" columns from the "students" and "grades" tables respectively, where the "grade" column in the "grades" table is less than 60, using a left outer join.
SELECT students.name, grades.subject 
 FROM students LEFT OUTER JOIN grades ON students.id = grades.student_id 
 WHERE grades.grade < 60;

--14. Use a join to select the "name" and "subject" columns from the "students" and "grades" tables respectively, where the "subject" column in the "grades" table contains the string "Science", using a natural join.
SELECT students.name, grades.subject 
 FROM students NATURAL JOIN grades WHERE grades.subject = 'science';

--15. Use a join to select the "name" and "subject" columns from the "students" and "grades" tables respectively, where the "grade" column in the "grades" table is greater than or equal to 80, using a cross join.
SELECT  students.name, grades.subject 
 FROM students CROSS JOIN grades WHERE grades.grade >= 80;

--16. Use a join to select the "name" and "subject" columns from the "students" and "grades" tables respectively, where the "grade" column in the "grades" table is less than 60, using a full outer join. 
SELECT students.name, grades.subject 
 FROM students FULL OUTER JOIN grades ON students.id = grades.student_id 
 WHERE grades.grade < 60;

--17. Use all the above features to retrieve the name, subject, and grade of all students who have a grade of 80 or higher in a subject that contains the string "Math", and whose date of birth is between '2000-01-01' and '2010-12-31', ordered by the "name" column in ascending order.
-- USING equi joins:
SELECT students.name, grades.subject, grades.grade FROM students 
INNER JOIN grades ON students.id = grades.student_id 
WHERE 
grades.grade >= 80
grades.subject LIKE ='%Math%'
date_of_birth BETWEEN '2000-01-01' AND '2010-12-31'
ORDER BY students.name ASC
;


--Using  join
SELECT students.name, grades.subject, grades.grade 
FROM students  JOIN grades ON students.id = grades.student_id 
WHERE
grades.grade >= 80
grades.subject LIKE ='%Math%'
date_of_birth BETWEEN '2000-01-01' AND '2010-12-31'
ORDER BY students.name ASC
;

--using natural join
SELECT students.name, grades.subject, grades.grade 
FROM students NATURAL JOIN grades 
WHERE
grades.grade >= 80
grades.subject LIKE ='Math'
date_of_birth BETWEEN '2000-01-01' AND '2010-12-31'
ORDER BY students.name ASC 
;

--using a cross join 
SELECT  students.name, grades.subject, grades.grade 
FROM students CROSS JOIN grades 
WHERE 
grades.grade >= 80
grades.subject LIKE ='%Math%',
date_of_birth BETWEEN '2000-01-01' AND '2010-12-31',
ORDER BY students.name ASC 
;

--using fill outer join 
SELECT students.name, grades.subject, grades.grade 
FROM students FULL OUTER JOIN grades ON students.id = grades.student_id 
WHERE 
grades.grade >= 80,
grades.subject ='Math',
date_of_birth BETWEEN '2000-01-01' AND '2010-12-31',
ORDER BY students.name ASC 
;
