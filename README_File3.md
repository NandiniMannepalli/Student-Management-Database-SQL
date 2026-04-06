This SQL script focuses on database security by creating logins, users, and assigning role-based permissions in the `CS631_StudentManagement` database.

---

## Features Included

### 1. Login Creation
The script creates multiple SQL Server logins for different roles:

- DB_Admin_Login
- Registrar_Login
- Instructor_Login
- Student_Login
- Reporting_Login

Each login is assigned a secure password.

---

### 2. User Creation
Each login is mapped to a database user:

- DB_Admin_User
- Registrar_User
- Instructor_User
- Student_User
- Reporting_User

This allows controlled access within the database.

---

### 3. Role-Based Access Control (RBAC)

#### DB Admin
- Assigned to `db_owner` role
- Full control over the database

#### Registrar
- Permissions:
  - SELECT, INSERT, UPDATE on:
    - Student
    - Enrollment
    - Grade

#### Instructor
- Permissions:
  - SELECT on:
    - Student
    - Course
    - Enrollment
  - UPDATE on:
    - Grade

#### Student
- Permissions:
  - SELECT on:
    - Student
    - Course
    - Enrollment
    - Grade

#### Reporting User
- Read-only access (SELECT) on:
  - Student
  - Course
  - Enrollment
  - Grade
  - Instructor
  - Department
  - CourseInstructor

---

### 4. Permission Verification
A query is included to verify assigned permissions using system views:

- `sys.database_permissions`
- `sys.objects`
- `sys.database_principals`

This helps ensure correct access control implementation.

---

## Purpose
This script demonstrates:
- Database security best practices
- User and role management
- Controlled data access
- Permission verification techniques

---

## Notes
- This script should be executed **after File 1** (database setup).
- Ensures proper access control for different user roles.
- Useful for understanding real-world database security implementation.