-- ===========================================
-- DAY 2 - AGGREGATE FUNCTIONS & ORDER BY
-- Topics:
-- ORDER BY
-- DISTINCT
-- MAX()
-- MIN()
-- AVG()
-- SUM()
-- COUNT()
-- AS (Alias)
-- ===========================================

-- Display all employees in ascending order of salary
SELECT *
FROM employee
ORDER BY salary ASC;

-- Display all employees in descending order of age
SELECT *
FROM employee
ORDER BY age DESC;

-- Display unique department IDs
SELECT DISTINCT dept_id
FROM employee;

-- Display employee names in alphabetical order
SELECT name
FROM employee
ORDER BY name ASC;

-- Display employee names in reverse alphabetical order
SELECT name
FROM employee
ORDER BY name DESC;

-- Display the highest salary
SELECT MAX(salary) AS Highest_Salary
FROM employee;

-- Display the lowest salary
SELECT MIN(salary) AS Lowest_Salary
FROM employee;

-- Display the average salary
SELECT AVG(salary) AS Average_Salary
FROM employee;

-- Display the total salary
SELECT SUM(salary) AS Total_Salary
FROM employee;

-- Count total employees
SELECT COUNT(*) AS Total_Employees
FROM employee;

-- Display average age
SELECT AVG(age) AS Average_Age
FROM employee;

-- Count employees in department 2
SELECT COUNT(*) AS Employees_Department_2
FROM employee
WHERE dept_id = 2;

-- Find total salary of employees in department 1
SELECT SUM(salary) AS Department1_TotalSalary
FROM employee
WHERE dept_id = 1;

-- Difference between highest and lowest salary
SELECT MAX(salary) - MIN(salary) AS Salary_Difference
FROM employee;

-- Employees whose salary is greater than average salary
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);

-- Count employees whose salary is greater than 30000
SELECT COUNT(*) AS Employees_Greater_Than_30000
FROM employee
WHERE salary > 30000;

-- Display employee name and salary with aliases
SELECT
    name AS Employee_Name,
    salary AS Employee_Salary
FROM employee;

-- Display employees whose names have exactly 5 characters
SELECT *
FROM employee
WHERE name LIKE '_____';
