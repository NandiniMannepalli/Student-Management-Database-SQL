

        --Create Logins, Users, and Assign Permissions

-- Create Logins

CREATE LOGIN DB_Admin_Login
WITH PASSWORD = 'Admin@123';


CREATE LOGIN Registrar_Login
WITH PASSWORD = 'Registrar@123';


CREATE LOGIN Instructor_Login
WITH PASSWORD = 'Instructor@123';


CREATE LOGIN Student_Login
WITH PASSWORD = 'Student@123';


CREATE LOGIN Reporting_Login
WITH PASSWORD = 'Reporting@123';


--Create Users


USE Student_Database;
GO


CREATE USER DB_Admin_User
FOR LOGIN DB_Admin_Login;

CREATE USER Registrar_User
FOR LOGIN Registrar_Login;

CREATE USER Instructor_User
FOR LOGIN Instructor_Login;

CREATE USER Student_User
FOR LOGIN Student_Login;

CREATE USER Reporting_User
FOR LOGIN Reporting_Login;


--Assign Permissions to Users 

--db_owner to Admin

ALTER ROLE db_owner ADD MEMBER DB_Admin_User;


--permissions to Registrar_User

GRANT SELECT, INSERT, UPDATE 
ON dbo.Student TO Registrar_User;

GRANT SELECT, INSERT, UPDATE 
ON dbo.Enrollment TO Registrar_User;

GRANT SELECT, INSERT, UPDATE 
ON dbo.Grade TO Registrar_User;


--permissions to Instructor_User

GRANT SELECT 
ON dbo.Student TO Instructor_User;

GRANT SELECT 
ON dbo.Course TO Instructor_User;

GRANT SELECT 
ON dbo.Enrollment TO Instructor_User;

GRANT UPDATE 
ON dbo.Grade TO Instructor_User;


--Permissions to Student_User

GRANT SELECT 
ON dbo.Student TO Student_User;

GRANT SELECT 
ON dbo.Course TO Student_User;

GRANT SELECT 
ON dbo.Enrollment TO Student_User;

GRANT SELECT 
ON dbo.Grade TO Student_User;


--Permissions to Reporting_User

GRANT SELECT 
ON dbo.Student TO Reporting_User;

GRANT SELECT 
ON dbo.Course TO Reporting_User;

GRANT SELECT 
ON dbo.Enrollment TO Reporting_User;

GRANT SELECT 
ON dbo.Grade TO Reporting_User;

GRANT SELECT 
ON dbo.Instructor TO Reporting_User;

GRANT SELECT 
ON dbo.Department TO Reporting_User;

GRANT SELECT 
ON dbo.CourseInstructor TO Reporting_User;




-- Verify Permissions

SELECT 
    dp.name AS UserName,
    o.name AS ObjectName,
    p.permission_name,
    p.state_desc
FROM sys.database_permissions p
JOIN sys.objects o ON p.major_id = o.object_id
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
WHERE dp.name IN ('DB_Admin_User','Registrar_User','Instructor_User','Student_User','Reporting_User')
ORDER BY dp.name, o.name;
