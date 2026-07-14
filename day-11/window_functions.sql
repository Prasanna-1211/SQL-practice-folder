-- Display employee names with their row number based on salary (highest salary first).
select name,salary,row_number()
over(Order by salary desc) AS row_num
from employee;

-- Display employee names with their salary rank.
select name,salary,rank() over(order by salary desc) AS rank_no
from employee;

-- Display employee names with
select name,salary,dense_rank() 
over(order by salary desc) as dense_no
from employee;

-- Display salary ranking inside each department.
select name,salary,dept_id, row_number()
over(partition by dept_id order by salary desc) as row_no
from employee;

-- Display the highest-paid employee from every department.
select*from 
(
  	select name,salary,dept_id,
	row_number() 
	over(partition by dept_id order by salary desc) as row_no
  	from employee
)AS temp
where row_no=1;

-- Display the top 2 highest-paid employees from every department.
select*from
(
	select name,salary,dept_id,row_number()
  	over(partition by dept_id order by salary desc) as row_no
  	from employee  
)AS temp
where row_no<=2;

-- Display employees whose salary rank is 3.
select*from 
(
	select name,salary,rank() 
  	over(order by salary desc) as rank_no
 	 from employee
)as temp
where rank_no=3;

-- Display the youngest employee from each department.
select*from 
(
	select name,age,dept_id,row_number()
  	over(partition by dept_id order by age ASC) as row_no
  	from employee	
)as temp
where row_no=1;

-- Display the oldest employee from each department.
select*from 
(
	select name,age,dept_id,row_number()
  	over(partition by dept_id order by age desc) as row_no
  	from employee	
)as temp
where row_no=1;

-- Display employees who joined first in each department.
select*from
(
	select name,joining_date,dept_id,row_number()
  	over(partition by dept_id order by joining_date ASC) as row_no
  	from employee
)as temp
where row_no=1;





