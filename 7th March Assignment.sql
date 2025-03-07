-- Creating database named school
create database school;
use school;

-- Creating table named student
create table student (
    rollno varchar(10),
    name varchar(5),
    class VARCHAR(5)
    );

-- Altering table student to change name varchar size to 25 and make rollno as a primary key
ALTER TABLE student modify name VARCHAR(25);
ALTER TABLE student ADD PRIMARY KEY (rollno);

--Write a SQL query to add a new column age (integer) to the student table.
alter table student add Age int;

-- Modify the class column in the student table to have a size of 10 characters.
ALTER TABLE student modify class VARCHAR(10);

-- Remove the primary key constraint from the student table.
alter table student Drop PRIMARY KEY;

-- Change the data type of rollno to INT and set it as an AUTO_INCREMENT primary key.
alter table student modify rollno int AUTO_INCREMENT PRIMARY KEY;

-- Drop the column age from the student table.
alter TABLE student Drop COLUMN age;

-- Adding values to table
insert into student (rollno, name, class) values 
    ('1', 'Rahul', '5A'),
    ('2', 'Rohan', '5B'),
    ('3', 'Vivek', '6A'),
    ('4', 'Amit', '7A'),
    ('5', 'Sumit', '8A'),
    ('6', 'Rahul', '10A'),
    ('7', 'Rohit', '5B'),
    ('8', 'Vini', '6A'),
    ('9', 'Aman', '7A'),
    ('10', 'Sunny', '8B'),
    ('11', 'Ravi', '4A');

-- Showing table
SELECT * FROM student;

INSERT INTO student (name, class, marks)
VALUES (
    "Priya",
    "5C",
    100
  );

INSERT INTO student ( name, class, marks)
VALUES (
    "Riya",
    "6A",
    99
  );

INSERT INTO student (name, class, marks) 
VALUES (
    "Ridhi",
    "10A",
    null
);

-- Retrieve all students whose names start with the letter 'A'.
SELECT * from student where LOWER(name) like "a%";

-- Display all students who belong to class '10A'.
SELECT * FROM student WHERE class = '10A'

-- Fetch the total number of students in each class.
SELECT class, COUNT(*) as total FROM student GROUP BY class;

-- Select students whose roll number contains '1' anywhere in it.
SELECT * FROM student WHERE rollno LIKE '%1%';

-- Retrieve distinct class names from the student table.
select distinct class from student;

-- Adding a column named Marks with default value as 0
alter table student add marks int default 0;

-- Updating marks to students
update student set marks = 45 where rollno = 1;
update student set marks = 78 where rollno = 2;
update student set marks = 90 where rollno = 3;
update student set marks = 67 where rollno = 4;
update student set marks = 89 where rollno = 5;
update student set marks = 98 where rollno = 6;
update student set marks = 76 where rollno = 7;
update student set marks = 45 where rollno = 8;
update student set marks = 67 where rollno = 9;
update student set marks = 89 where rollno = 10;
update student set marks = 98 where rollno = 11;

-- Retrieve the highest marks obtained by any student.
SELECT name, marks AS Highest_Marks 
FROM student 
ORDER BY marks DESC 
LIMIT 1;

-- List the students who scored more than 80 marks.
select name, marks from student where marks > 80;

-- Find the average marks of students in each class.
select AVG(marks) as "Average Score of Class" from student;

-- drop the default of marks
ALTER TABLE student ALTER COLUMN marks DROP DEFAULT;

-- Retrieve the details of students who do not have marks recorded in the marks table.
SELECT * FROM student WHERE marks IS NULL;

-- SUBQUERIES & ORDER BY:
-- Find the students who have the second-highest marks.Find the students who have the second-highest marks.
select name, marks from student
ORDER BY marks desc
LIMIT 1 offset 1; 

-- Retrieve the top 5 students based on their marks.
select name, marks from student
order by marks desc
LIMIT 5;

-- Display students sorted by their name in ascending order and class in descending order.
SELECT name, class FROM student
ORDER BY name ASC, class DESC;