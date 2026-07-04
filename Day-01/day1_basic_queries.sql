-- ===========================================
-- DAY 1 - BASIC SQL PRACTICE
-- Topics:
-- CREATE TABLE
-- PRIMARY KEY
-- FOREIGN KEY
-- INSERT
-- SELECT
-- WHERE
-- LIKE
-- BETWEEN
-- ===========================================

DROP TABLE employee;
DROP TABLE department;

-- Create Department Table
CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

-- Insert Department Data
INSERT INTO department VALUES
(1,'HR'),
(2,'Sales'),
(3,'IT'),
(4,'Finance');

-- Create Employee Table
CREATE TABLE employee(
    e_id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT NOT NULL,
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Insert Employee Data
INSERT INTO employee VALUES
(101,'Asha',22,25000,1),
(102,'Rahul',25,30000,2),
(103,'Sneha',23,28000,1),
(104,'Kiran',27,45000,3),
(105,'Aishu',19,60000,2);

-- Display all employees
SELECT * FROM employee;

-- Display employee names
SELECT name
FROM employee;

-- Display employee name and salary
SELECT name, salary
FROM employee;

-- Employees with salary greater than 30000
SELECT *
FROM employee
WHERE salary > 30000;

-- Employees with age less than 25
SELECT *
FROM employee
WHERE age < 25;

-- Employees working in department 2
SELECT *
FROM employee
WHERE dept_id = 2;

-- Employees with salary between 25000 and 45000
SELECT *
FROM employee
WHERE salary BETWEEN 25000 AND 45000;

-- Employees whose name starts with 'A'
SELECT *
FROM employee
WHERE name LIKE 'A%';

-- Employees whose name ends with 'a'
SELECT *
FROM employee
WHERE name LIKE '%a';

-- Employees whose name contains 'h'
SELECT *
FROM employee
WHERE name LIKE '%h%';

-- Employees whose salary is 25000 or 60000
SELECT *
FROM employee
WHERE salary IN (25000, 60000);
