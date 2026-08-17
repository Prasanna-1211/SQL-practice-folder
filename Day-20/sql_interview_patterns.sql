-- Display salaries that are earned by more than one employee.
select salary,count(*)
from employee
group by salary
having count(*)>1;

-- Display the names and salaries of employees whose salary is shared by another employee.
select name,salary 
from employee
where salary in
(
	select salary
    from employee
    group by salary
    having count(*)>1
);

-- Display department names that don't have any employees.
select dept_name
from department
left join employee
on employee.dept_id=department.dept_id
where employee.dept_id is null;

-- Display employees whose dept_id has no matching department.
select employee.name, employee.dept_id
from department
right join employee
on employee.dept_id=department.dept_id
where department.dept_id is null;

-- Top 3 highest-paid employees
select*
from
(
 select name,salary,row_number() over(order by salary  desc) as rownumber
 from employee
)as temp
where rownumber<=3;

-- Display the two highest distinct salaries.
select*
from
(
	select name,salary,dense_rank() over(order by salary desc) as dr
    from employee
)as temp
where dr<=2;

-- Employees earning above their department average
select name
from employee e1
where salary>
(
	select avg(salary)
    from employee e2
    where e1.dept_id=e2.dept_id
);

-- Count high-salary employees per department
select dept_id,
	count(
		case
			when salary>=40000 then 1
        end    
    )as high_salary_count
from employee
group by dept_id;

-- Count employees in different salary categories
select dept_id,
    count(
		case
			when salary>=50000 then 1
		end   
		)as high_sal,
    count(
		case
			when salary>=30000 and  salary<50000 then 1
		end   
		)as med_sal,    
     count(
		case
			when salary<30000 then 1
		end   
		)as low_sal     
from employee
group by dept_id;

-- Display each department:Department Name,Total Employees,High Salary Employees,Average Salary,Highest Salary
select d.dept_name,count(*) as total_employees,
count(
	case
		when salary>=50000 then 1
	end   
)as high_salary_employees,
avg(salary) as average_salary,
max(salary) as maximum_salary
from employee e
join department d
on e.dept_id=d.dept_id
group by d.dept_id









