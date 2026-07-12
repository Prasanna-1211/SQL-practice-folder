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
-- ===========================================
-- Day 09 - Employee Management
-- Name : Lakshmi Prasanna
-- Date : 12-07-2026
-- ===========================================
select*from employee;
select*from department;

-- Display the employee name, department name, and salary of employees whose salary is greater than the company average salary.
select name,dept_name,salary
from employee
inner join department
on employee.dept_id=department.dept_id
where salary >
(
	select Avg(salary) 
  	from employee
  	
);

-- Display the department name and the total number of employees working in each department.
select dept_name,count(employee.e_id) as Total_employees
from employee
right join department
on employee.dept_id=department.dept_id
group by dept_name;

-- Display the department name having the highest total salary expense.
select dept_name
from employee
inner join department
on employee.dept_id=department.dept_id
group by dept_name
having SUM(salary)=
(
	select max(total_salary)
  	from
  	(
		select SUM(salary) as total_salary
  		from employee
  		group by dept_id
    )AS temp
);

-- Display employees who are older than every employee in the HR department.
select name
from employee
where age>
(
	select max(age)
	from employee
	where dept_id='1'
);  

-- Display employees who joined in the same year as Rahul.
select name from employee
where year(joining_date)=
(
	select year(joining_date)
  	from employee
    where name='Rahul'
);

-- Display employees whose salary is greater than Asha but less than Aishu.
select name
from employee
where salary > 
(
	select salary 
	from employee
  	where name='Asha'
)  
And salary <
(
  	select salary
	from employee
  	where name='Aishu'
);

-- Display Department Name,Highest Salary,Lowest Salary,Average Salary for every department.
select dept_name,MAX(salary),MIN(salary),Avg(salary)
from employee
inner join department
on employee.dept_id=department.dept_id
group by dept_name;

-- Find departments having exactly 2 employees.
select dept_name,count(*)
from employee
inner join department
on employee.dept_id=department.dept_id
group by dept_name
having count(*)=2;

-- Display the second youngest employee.
select age,name 
from employee
where age=
(
	select min(age)
	from employee
	where age>
	(
		select min(age)
		from employee
     ) 
);

-- Display employees earning the second highest salary in their own department.
SELECT e1.name, e1.salary, e1.dept_id
FROM employee e1
WHERE e1.salary =
(
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e2.dept_id = e1.dept_id
      AND e2.salary <
      (
          SELECT MAX(e3.salary)
          FROM employee e3
          WHERE e3.dept_id = e1.dept_id
      )
);

-- Increase the salary of employees who earn less than the company average salary by 5%.
update employee
set salary=salary*1.05
where salary <
    (
		select AVG(salary) 
		from employee
  	);
  
  