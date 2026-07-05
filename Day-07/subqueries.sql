-- Display employees whose salary is greater than the average salary.
select name
from employee
where salary>
(
	select AVG(salary)
	from employee
);
-- Display employees having the highest salary.
select name 
from employee
where salary=
(
	select MAX(salary)
	from employee 
);
-- Display employees having the lowest salary.
select name
from employee
where salary=
(
	select MIN(salary)
  	from employee
);
-- Display employees whose salary is less than the average salary.
select*from employee
where salary<
(
	select AVG(salary)
	from employee
);
-- Display employees older than the average age.
select*from employee
where age>
(
	select AVG(age)
	from employee
);
-- Display employees younger than the average age.
select*from employee
where age<
(
	select AVG(age)
    from employee
);
-- Display employees working in the same department as Asha.
select name
from employee
where dept_id=
(
	select dept_id
	from employee
	where name='Asha'
);
-- Display employees earning more than Rahul.
select name 
from employee
where salary>
(
	select salary
	from employee
	where name='Rahul'
);
-- Display the second highest salary.
select MAX(salary)
from employee
where salary<
(
select MAX(salary)
from employee
);
