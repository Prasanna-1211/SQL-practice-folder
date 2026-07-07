-- Display departments that have at least one employee. 
select dept_name
from department
where EXISTS
(
	select*from employee
  	where employee.dept_id=department.dept_id
);
-- Display departments that have no employees.
select dept_name
from department
where NOT EXISTS
(
	select*from employee
  	where employee.dept_id=department.dept_id
);
-- Display employees whose department exists in the department table.
select name
from employee
where exists
(
	select*from department
  	where department.dept_id=employee.dept_id
);
-- Display employees whose department does not exist.
select name
from employee
where not exists
(
	select*from department
  	where department.dept_id=employee.dept_id
);
-- Display department names that have more than one employee.
select dept_name
from department
where exists
(
	select dept_id,count(*) 	from employee
  	where employee.dept_id=department.dept_id
  	group by dept_id
  	having count(*)>1
);
-- Display employee names working in departments that exist.
select name 
from employee
where exists
(
	select*from department
  	where department.dept_id=employee.dept_id
);
