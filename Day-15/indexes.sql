-- Create an index on the name column of employee.
create index idx_name
on employee(name);
select*from employee;
-- Create an index on the salary column.
create index idx_sal
on employee(salary);
-- Create an index on the dept_id column of employee.
create index idx_id
on employee(dept_id);
-- Display all indexes on the employee table.
show index from employee;
-- Create an index named idx_joining_date on joining_date.
create index idx_joining_date
on employee(joining_date);
-- Create a unique index on a suitable column.
create unique index idx_salary
on employee(salary);
-- Create a composite index on:dept_id,salary
create index idx_emp
on employee(dept_id,salary);
-- Delete the index you created on name.
drop index idx_name
on employee;

-- Display all indexes on the employee table again and check whether the name index disappeared.
show index from employee;
-- Suppose you frequently run:SELECT *FROM employee WHERE dept_id = 2 AND salary > 30000;What kind of index would you create to help this query?
-- we create composite index

     



