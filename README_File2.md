This SQL script enhances the database created in File 1 by adding constraints, advanced queries, and conditional logic.

---

## Features Included

### 1. Constraints
- **NOT NULL Constraints**
  - Applied to important columns in `Student` and `Instructor` tables.
- **UNIQUE Constraints**
  - Ensures unique email addresses for:
    - Student
    - Instructor
- **CHECK Constraint**
  - Applied on `Grade` table to allow only valid grade values:
    - A, A+, B, B+, C, D, F

---

### 2. JOIN Queries
This file demonstrates different types of SQL joins:

- **INNER JOIN**
  - Retrieves matching records from `Student`, `Enrollment`, and `Course`.

- **LEFT JOIN**
  - Returns all students, including those without enrollments.

- **RIGHT JOIN**
  - Retrieves all enrollments and matching student/course data.

- **FULL OUTER JOIN**
  - Combines all records from `Student`, `Enrollment`, and `Course`.

---

### 3. Conditional Logic

#### IF...ELSE
- Evaluates a student's grade and prints performance:
  - Excellent
  - Good
  - Average
  - Needs Improvement

#### CASE Statement
- Categorizes student performance based on grade values.

---

### 4. String Function

- **SUBSTRING()**
  - Extracts a portion of the student's first name.

---

## Purpose
This file demonstrates:
- Data integrity using constraints
- Advanced SQL querying techniques
- Conditional logic implementation
- String manipulation in SQL

---

## Notes
- This script should be executed **after File 1** (database and tables must already exist).
- Ensures improved data quality and query capabilities.