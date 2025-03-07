use studentmanagementsystem;
SELECT * from student;

ALTER TABLE studentmanagementsystem.student 
ADD COLUMN DOB DATE,
ADD COLUMN Gender ENUM('M', 'F', 'O'),
ADD COLUMN email VARCHAR(50) UNIQUE,
ADD COLUMN phone VARCHAR(10) UNIQUE;

use studentmanagementsystem;
UPDATE student 
SET DOB = '1990-01-01', 
WHERE FirstName = 'Rishika';

UPDATE student 
SET DOB = '1991-11-05', 
    Gender = 'F', 
    email = 'student2@gmail.com' 
WHERE FirstName = 'Vidhi';


UPDATE student 
SET DOB = '1992-05-11', 
    Gender = 'F', 
    email = 'student3@gmail.com' 
WHERE FirstName = 'Palak';

UPDATE student 
SET DOB = '1990-12-16', 
    Gender = 'F', 
    email = 'student4@gmail.com' 
WHERE FirstName = 'Kopal';

use studentmanagementsystem;
ALTER TABLE student MODIFY phone VARCHAR(15);

UPDATE student SET phone = 8945261379 WHERE FirstName = "Rishika";
UPDATE student SET phone = 9945261389 WHERE FirstName = "Vidhi";
UPDATE student SET phone = 7745262279 WHERE FirstName = "Palak";
UPDATE student SET phone = 8565261379 WHERE FirstName = "Kopal";

"""Create a table with name Course with attributes:
● CourseID (Primary Key)
● CourseTitle
● Credits"""

Create table Course (
    CourseID INT PRIMARY KEY,
    CourseTitle VARCHAR(50),
    Credits INT)

"""Create a table with named Instructor with attributes:
● InstructorID (Primary Key)
● FirstName
● LastName
● Email"""

Create table Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(50))

"""Create a table with named Enrollment with attributes:
● EnrollmentID (Primary Key)
● EnrollmentDate
● StudentID(Foreign key)
● CourseID(Foreign Key)
● InstructorID(Foreign key)"""

Create table Enrollment (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentDate DATE NOT NULL,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
)

"""Create a table with named Score with attributes:
● ScoreID (Primary Key)
● CourseID (Foreign key)
● StudentID (Foreign Key)
● DateOfExam
● CreditObtained
"""

Create table Score (
    ScoreID INT PRIMARY KEY,
    CourseID INT,
    StudentID INT,
    DateOfExam DATE,
    CreditObtained INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
    )

"""Create a table with named Feedback with attributes:
● FeedbackID (Primary Key)
● StudentID (Foreign key)
● Date
● InstructorNa"""

Create TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    Date DATE NOT NULL,
    InstructorName CHAR(20), 
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
    )