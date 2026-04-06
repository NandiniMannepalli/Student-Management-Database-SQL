
USE Student_Database;
GO



--NOT NULL constraints

ALTER TABLE Student
ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Student
ALTER COLUMN LastName VARCHAR(50) NOT NULL;

ALTER TABLE Student
ALTER COLUMN Email VARCHAR(100) NOT NULL;

ALTER TABLE Instructor
ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Instructor
ALTER COLUMN LastName VARCHAR(50) NOT NULL;

--UNIQUE constraints
ALTER TABLE Student
ADD CONSTRAINT UQ_Student_Email UNIQUE (Email);

ALTER TABLE Instructor
ADD CONSTRAINT UQ_Instructor_Email UNIQUE (Email);

--CHECK constraint for Grade

ALTER TABLE Grade
ADD CONSTRAINT CK_Grade_GradeValue
CHECK (GradeValue IN ('A','A+','B','B+','C','D','F'));




--INNER JOIN query

SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName,
    e.EnrollmentDate
FROM Student s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID;

--LEFT JOIN query

SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    e.EnrollmentID,
    c.CourseName
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID;

--RIGHT JOIN query

SELECT 
    c.CourseID,
    c.CourseName,
    s.StudentID,
    s.FirstName,
    s.LastName,
    e.EnrollmentDate
FROM Course c
RIGHT JOIN Enrollment e ON c.CourseID = e.CourseID
RIGHT JOIN Student s ON e.StudentID = s.StudentID;

--FULL OUTER JOIN query

SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate
FROM Student s
FULL OUTER JOIN Enrollment e ON s.StudentID = e.StudentID
FULL OUTER JOIN Course c ON e.CourseID = c.CourseID;

--IF…ELSE query

DECLARE @StudentID INT = 1;
DECLARE @StudentGrade CHAR(2);

SELECT @StudentGrade = g.GradeValue
FROM Enrollment e
JOIN Grade g ON e.EnrollmentID = g.EnrollmentID
WHERE e.StudentID = @StudentID;

IF @StudentGrade IN ('A', 'A+')
    PRINT 'Excellent';
ELSE IF @StudentGrade IN ('B', 'B+')
    PRINT 'Good';
ELSE IF @StudentGrade IN ('C')
    PRINT 'Average';
ELSE
    PRINT 'Needs Improvement';

--CASE statement query

SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName,
    g.GradeValue,
    CASE 
        WHEN g.GradeValue IN ('A','A+') THEN 'Excellent'
        WHEN g.GradeValue IN ('B','B+') THEN 'Good'
        WHEN g.GradeValue = 'C' THEN 'Average'
        ELSE 'Needs Improvement'
    END AS Performance
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Grade g ON e.EnrollmentID = g.EnrollmentID;


 --SUBSTRING() query
 
 SELECT 
    StudentID,
    FirstName,
    LastName,
    SUBSTRING(FirstName, 1, 3) AS FirstName_Prefix
FROM Student;


