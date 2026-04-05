
CREATE DATABASE CS631_nandiniMannepalli;
GO

USE CS631_nandiniMannepalli;
GO


/*Table Creation*/


CREATE TABLE Department (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    OfficeLocation VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE
);

CREATE TABLE Instructor (
    InstructorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Grade (
    GradeID INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT,
    GradeValue CHAR(2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

CREATE TABLE CourseInstructor (
    CourseInstructorID INT IDENTITY(1,1) PRIMARY KEY,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);


/*Data Insertion*/

INSERT INTO Department (DepartmentName, OfficeLocation)
VALUES
('Computer Science','Building A'),
('Mathematics','Building B'),
('Business','Building C'),
('Engineering','Building D'),
('Arts','Building E'),
('Science','Building F'),
('Education','Building G'),
('Health','Building H'),
('Law','Building I'),
('Information Technology','Building J');

INSERT INTO Student (FirstName, LastName, Email, DateOfBirth)
VALUES
('Nandini','Mannepalli','nandini@edu.com','1999-01-10'),
('Virinchi','Billa','virinchi@edu.com','2002-03-15'),
('Yugesh','Akula','yugesh@edu.com','2001-05-20'),
('Sangwha','Lee','sangwha@edu.com','2000-07-11'),
('Sowmya','Pandey','sowmya@edu.com','2004-12-01'),
('Himani','Parmar','himani@edu.com','2003-02-19'),
('Shankari','Thiagarajan','shankari@edu.com','1999-09-23'),
('Vamshi','Maroju','vamshi@edu.com','2001-10-30'),
('Sasirmayee','Modukuri','sasirmayee@edu.com','1998-08-17'),
('Abhishek','Joshi','abhishek@edu.com','2001-06-25');


INSERT INTO Instructor (FirstName, LastName, Email, DepartmentID)
VALUES
('Lisa','Kramer','lisa@edu.com',1),
('Praveen','Devarapogu','praveen@edu.com',1),
('Hassan','Qureshi','hassan@edu.com',3),
('Jesus','Vargas','jesus@edu.com',2),
('Naga','Yerrabothula','naga@edu.com',4),
('Mark','Stone','mark@edu.com',5),
('Chris','Paul','chris@edu.com',6),
('Nancy','Hall','nancy@edu.com',7),
('Robert','King','robert@edu.com',8),
('Susan','Green','susan@edu.com',9);

INSERT INTO Course (CourseName, Credits, DepartmentID)
VALUES
('Database Systems',3,1),
('Operating Systems',3,1),
('Linear Algebra',3,2),
('Business Management',3,3),
('Engineering Basics',4,4),
('Art History',3,5),
('Biology 101',4,6),
('Education Psychology',3,7),
('Health Science',3,8),
('Law Ethics',3,9);


INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate)
VALUES
(1,1,'2024-01-25'),
(2,2,'2024-08-10'),
(3,3,'2025-01-11'),
(4,4,'2025-08-25'),
(5,5,'2025-08-12'),
(6,6,'2026-01-09'),
(7,7,'2026-01-03'),
(8,8,'2026-01-14'),
(9,9,'2026-01-08'),
(10,10,'2026-01-11');


INSERT INTO Grade (EnrollmentID, GradeValue)
VALUES
(1,'A'),(2,'B'),(3,'A'),
(4,'C'),(5,'B'),(6,'A'),
(7,'B'),(8,'A'),(9,'C'),(10,'A');


INSERT INTO CourseInstructor (CourseID, InstructorID)
VALUES
(1,1),(1,2),(2,2),(3,4),(4,3),
(5,5),(6,6),(7,7),(8,8),(9,9);



/* Select and JOIN queries */


SELECT * FROM Student;

SELECT s.FirstName, s.LastName, c.CourseName, e.EnrollmentDate
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID;


SELECT s.FirstName, s.LastName, c.CourseName, g.GradeValue
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
JOIN Grade g ON e.EnrollmentID = g.EnrollmentID;

/*Many-to-Many*/

SELECT c.CourseName, i.FirstName, i.LastName
FROM Course c
JOIN CourseInstructor ci ON c.CourseID = ci.CourseID
JOIN Instructor i ON ci.InstructorID = i.InstructorID;


SELECT d.DepartmentName, c.CourseName
FROM Department d
JOIN Course c ON d.DepartmentID = c.DepartmentID;


/*LEFT JOIN*/

SELECT s.FirstName, s.LastName, e.EnrollmentID
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID;

