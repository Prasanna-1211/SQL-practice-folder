DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- Create Department Table
CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

-- Insert Departments
INSERT INTO department VALUES
(1,'HR'),
(2,'Sales'),
(3,'IT'),
(4,'Finance');

-- Create Employee Table
CREATE TABLE employee(
    e_id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    joining_date DATE,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

-- Insert Employees
INSERT INTO employee VALUES
(101,'Asha',22,25000,'2022-01-15',1),
(102,'Rahul',25,30000,'2023-03-20',2),
(103,'Sneha',23,28000,'2022-09-18',1),
(104,'Kiran',27,45000,'2021-11-10',3),
-- Create a view containing all employees.Display the view.
create view view_employee as
select*from employee;
select*from view_employee;

-- Create a view containing employees earning more than ₹30,000.Display the view.
create view view_salary as
select*from employee
where salary>30000;
select*from view_salary;

-- Create a view containing HR employees.Display the view.
create view hr_employee as
select name,dept_name
from employee e
join department d
on e.dept_id=d.dept_id
where dept_name='HR';
select*from hr_employee;

-- Create a view showing:Employee Name Department Name (Display the view.)
create view dept_employee as
select name,dept_name
from employee e
join department d
on e.dept_id=d.dept_id;
select*from dept_employee;

-- Create a view showing:Employee Name Salary Department Name
create view deptemployeesal as
select name,dept_name,salary
from employee e
join department d
on e.dept_id=d.dept_id;
select*from deptemployeesal;

-- Create a view containing employees older than 23.Display only:Name,Age
create view emp_name as 
select Name,Age from employee
where age>23;
select*from emp_name;

-- Create a view showing the total salary of every department.Output:Department Name,Total Salary
create view tot_sal as
select dept_name,SUM(salary) as total_salary from employee e
join department d
on e.dept_id=d.dept_id
Group by e.dept_id;
select*from tot_sal;

-- Create a view showing the number of employees in each department.Output:Department Name,Employee Count
create view tot_emp as
select dept_name,count(e_id) as total_employee from employee e
join department d
on e.dept_id=d.dept_id
Group by e.dept_id;
select*from tot_emp;

-- Create a view containing employees who joined after 2022-12-31.Display the view.
create view emp_join as
select name from employee
where joining_date>'2022-12-31';
select*from emp_join;

-- Create a view containing the highest-paid employee from every department.
CREATE VIEW emp_maxsal AS
SELECT name, dept_id, salary
FROM
(
    SELECT name,
           dept_id,
           salary,
           ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_no
    FROM employee
) AS temp
WHERE row_no = 1;

SELECT * FROM emp_maxsal;
(105,'Aishu',19,60000,'2024-01-05',2);