-- Display every possible combination of:Employee Name | Department Name 
select e.name,d.dept_name
from employee e
cross join department d;

-- Display the names of employees who are either:working in HR OR earning more than ₹40,000
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='HR'
union
select name
from employee
where salary>40000;

-- UNION ALL
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='HR'
union all
select name
from employee
where salary>40000;

-- Display employees working in:HR,IT
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='HR'
union 
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='IT';

-- Display employee names who work in either:HR OR Sales
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='HR'
union 
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='Sales';

-- Display employees who:earn more than ₹30,000 OR work in HR
select name
from employee
join department
on employee.dept_id=department.dept_id
where dept_name='HR'
union 
select name
from employee
where salary>30000;

-- Display:Department Name,Employee Count,Total Salary,Average Salary
select dept_name,count(*),sum(salary),avg(salary)
from employee
join department
on employee.dept_id=department.dept_id
group by department.dept_id;

-- Display department names where:total salary > 50,000
select d.dept_name
from employee e
join department d
on d.dept_id=e.dept_id
group by d.dept_id
having sum(salary)>50000;

-- Display employees who earn more than the average salary of their department.
select e.name,e.salary,e.dept_id
from employee e
join
(
	select dept_id, Avg(salary) as avg_salary
    from employee
    group by dept_id
)as d
on e.dept_id=d.dept_id
where e.salary>d.avg_salary;

-- Display:Employee Name,Department Name,Salary,Department Average Salary,Difference
select e.name,
       dpt.dept_name,
       e.salary,
       d.avg_salary,
       e.salary - d.avg_salary as difference
from employee e
join
(
    select dept_id, avg(salary) as avg_salary
    from employee
    group by dept_id
) as d
on e.dept_id = d.dept_id
join department dpt
on e.dept_id = dpt.dept_id;