-- Display all employees using a CTE.
with total_employee as
(
 select*
   from employee
)
select*from total_employee;

-- Create a CTE that stores employees earning more than ₹30,000.Display all columns.
with max_salary as
(
 select*from employee
   where salary>30000
)
select*
from max_salary;

-- Create a CTE that stores employees working in the HR department.Display all HR employees.
with emp_inHr as
(
 select*from employee
   where dept_id=1
)
select*from emp_inHr;

with hr_employee as
(
 select e.*
   from employee e
   join department d
   on e.dept_id=d.dept_id
   where dept_name='HR'
)
select*from hr_employee;

-- Create a CTE that stores the average salary.Display employees earning more than the average salary.
with avg_salary as
(
 select avg(salary) as avg_sal
   from employee
)
select*from employee,avg_salary
where salary>avg_sal;

-- Create a CTE that stores the highest salary.Display the employee having the highest salary.
with Max_salary as
(
 select MAX(salary) as max_sal
   from employee
)
select*from employee,Max_salary
where employee.salary=max_sal;

-- Create a CTE containing employees older than 23.Display their names and ages.
with employee_age as 
(
 select*from employee
   where age>23
)
select name,age 
from employee_age;

-- Create a CTE containing employees from the IT department.Display their names and salaries.
with emp_department as
(
 select e.* from employee e
 join department d
 on e.dept_id=d.dept_id
 where dept_name='IT'
)
select*from emp_department;

-- Create a CTE containing the total salary of every department.
with total_salary as
(
 select dept_name,sum(salary) as total_sal
   from employee e
   join department d
   on e.dept_id=d.dept_id
   group by d.dept_id
)
select*from total_salary;

-- Create a CTE containing the employee count for each department.
with number_employee as
(
 select dept_name,count(*) as total_count
   from employee e
   join department d
   on e.dept_id=d.dept_id
   group by d.dept_id
)
select*from number_employee;

-- Without using a subquery, use a CTE to display the second highest salary.
with salary_rank AS
(
	select name,salary, DENSE_RANK() over(order by salary DESC) As rank_no
  from employee
)
select name,salary from salary_rank
where rank_no=2;