-- Display the number of employees in each department.
select count(name),dept_id
from employee
group by dept_id;
-- Display the total salary of each department.
select SUM(salary),dept_id
from employee
group by dept_id;
-- Display the average salary of each department.
select AVG(salary),dept_id
from employee
group by dept_id;
-- Display the highest salary in each department.
select MAX(salary),dept_id
from employee
group by dept_id;
-- Display the lowest salary in each department.
select MIN(salary),dept_id
from employee
group by dept_id;
-- Display departments having more than 1 employee.
select count(name),dept_id
from employee
group by dept_id
having count(name)>1;
-- Display departments whose total salary is greater than 50000.
select SUM(salary),dept_id
from employee
group by dept_id
having SUM(salary)>50000;
-- Display departments whose average salary is greater than 30000.
select AVG(salary),dept_id
from employee
group by dept_id
having AVG(salary)>30000;
-- Display the department name and number of employees in each department.
select count(name),dept_name
from employee
right join department
on employee.dept_id=department.dept_id
group by dept_name;
-- Display the department name and average salary of each department.
select AVG(salary),dept_name
from employee
right join department
on employee.dept_id=department.dept_id
group by dept_name;
