create table department(
	dept_id int primary key,
  	dept_name varchar(20)
);
insert into department values(1,'HR'),
      (2,'sales'),       
      (3,'IT'),
      (4,'Finance');
create table employee(
	emp_id int primary key,
  	name varchar(20),
    age int,
    salary int,
  	dept_id int,
  	foreign key(dept_id) references department(dept_id)
);
INSERT INTO employee VALUES
(101,'Asha',22,25000,1),
(102,'Rahul',25,30000,2),
(103,'Sneha',23,28000,1),
(104,'Kiran',27,45000,3),
(105,'Aishu',19,60000,2)
select*from department;
select*from employee;
-- Display all employees with their department names.
select name,dept_name
from employee
left join department
on employee.dept_id=department.dept_id;
-- Display employee name and salary with department name.
select name,salary,dept_name
from employee 
left join department
on employee.dept_id=department.dept_id;
-- Display only employees working in HR.
select name 
from employee
inner join department
on employee.dept_id=department.dept_id
where department.dept_name='HR';
-- Display employees working in Sales.
select employee.name
from employee
inner join department
on employee.dept_id=department.dept_id
where department.dept_name='Sales';
-- Display all departments along with employee names.
select dept_name,name
from employee
right join department
on employee.dept_id=department.dept_id;
-- Display employee names and department names in alphabetical order of employee names.
select name,dept_name
from employee
inner join department
on employee.dept_id=department.dept_id
order by name ASC;
-- Display employee name, salary, and department name where salary is greater than 30000.
select name,salary,dept_name
from employee
left join department
on employee.dept_id=department.dept_id
where employee.salary>30000;
-- Display all employees even if they don't have a department.
select name
from employee
left join department
on employee.dept_id=department.dept_id;
