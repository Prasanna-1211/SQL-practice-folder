-- ===========================================
-- Day 09 - Employee Management
-- Name : Lakshmi Prasanna
-- Date : 09-07-2026
-- ===========================================
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO department VALUES
(1,'HR'),
(2,'Sales'),
(3,'IT'),
(4,'Finance');

CREATE TABLE employee(
    e_id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    joining_date DATE,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee VALUES
(101,'Asha',22,25000,'2022-01-15',1),
(102,'Rahul',25,30000,'2023-03-20',2),
(103,'Sneha',23,28000,'2022-09-18',1),
(104,'Kiran',27,45000,'2021-11-10',3),
(105,'Aishu',19,60000,'2024-01-05',2);

SELECT * FROM department;
SELECT * FROM employee;
-- Display the highest-paid employee in each department.
SELECT e1.name, e1.salary, e1.dept_id
FROM employee e1
WHERE e1.salary =
(
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e2.dept_id = e1.dept_id
);
-- Display employees who earn more than the average salary of their own department.
select Name
from employee e1
where salary>
(
    select AVG(salary) from employee e2
    where e1.dept_id=e2.dept_id
);
-- Find the oldest employee in the company.
select name
from employee 
where age=
(
    select MAX(age) from employee 
);
-- Find the youngest employee in the company.
select name
from employee 
where age=
(
    select MIN(age) from employee 
);
-- Display departments where the total salary expense is greater than ₹50,000.
select dept_name
from employee
right join department
on employee.dept_id = department.dept_id
group by department.dept_id
having SUM(salary)>50000;
-- Display the department having the highest average salary.
SELECT dept_name, AVG(salary) AS avg_salary
FROM employee
JOIN department
ON employee.dept_id = department.dept_id
GROUP BY dept_name
HAVING AVG(salary) =
(
    SELECT MAX(avg_salary)
    FROM
    (
        SELECT AVG(salary) AS avg_salary
        FROM employee
        GROUP BY dept_id
    ) AS temp
);
-- Find employees who joined before the average joining date.
select name
from employee
where joining_date<
(
    select FROM_DAYS(AVG(TO_DAYS(joining_date))) 
    from employee
);
-- Display employees who have the same salary as another employee.
SELECT name, salary
FROM employee
WHERE salary IN
(
    SELECT salary
    FROM employee
    GROUP BY salary
    HAVING COUNT(*) > 1
);
-- "Increase the salary of all HR employees by 10%."
update employee
set salary=salary*1.10
where dept_id=1;
-- "Delete employees who are younger than 20."
select *from employee
where age<20;
delete from employee
where age<20;
-- "Add a new employee."
INSERT into employee values(106,'Ravi',24,35000,'2024-06-15',3);