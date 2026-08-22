-- Highest paid employee in each department
select*from
(	
    select name,salary,dept_id, 
		row_number() over(partition by dept_id
						  ORDER BY SALARY DESC) as rn 
     from employee                  
)as temp
where rn=1;

-- Lowest-paid employee in each department
select*from
(	
    select name,salary,dept_id,row_number()over(partition by dept_id 
												order by salary asc) as rn
	from employee
)as temp    
where rn=1;    

-- Top 2 highest-paid employees in each department
select*from
(
	select name,salary,dept_id,row_number() over(partition by dept_id
												 order by salary desc)as rn
     from employee                                            
)as temp
where rn<=2;

-- Second-highest salary in each department
select*from	
    (
    select dept_id,name,dense_rank() over(partition by dept_id
										  order by salary desc) as dr
	from employee
    )as temp
where dr=2;    

-- Highest salary and lowest salary difference
select dept_id,
	max(salary) as highest_salary,
	min(salary) as lowest_sal,
    max(salary)-min(salary) as difference
from employee
group by dept_id;

-- Employees earning the maximum salary in their department
select*from	
    (
    select dept_id,name,dense_rank() over(partition by dept_id
										  order by salary desc) as dr
	from employee
    )as temp
where dr=1;

-- Employees earning above their department average
select name,salary,dept_id
from employee e1
where e1.salary>
(
		select avg(salary) as average_salary
        from employee e2
        where e1.dept_id=e2.dept_id
);

-- Department with the highest average salary
select d.dept_name,temp.avg_salary
from department d
join
(
		select dept_id,avg(salary) as avg_salary
        from employee
        group by dept_id
)as temp
on d.dept_id=temp.dept_id
where temp.avg_salary=
(
	select max(avg_salary)
    FROM
    (
        SELECT dept_id, AVG(salary) AS avg_salary
        from employee
        group by dept_id
    ) AS x
);

-- Department with the highest total salary
select d.dept_name,temp.total_salary
from department d
join
(
	select dept_id,sum(salary) as total_salary
    from employee
    group by dept_id
)as temp
on d.dept_id=temp.dept_id
where temp.total_salary=
(
	select max(total_salary)
    from
    (
		select dept_id,sum(salary) as total_salary
		from employee
		group by dept_id
    )as x
);

-- Display the top-paid employee from every department, including:Employee Name,Department Name,Salary,Department Average Salary,Difference from Department Average
SELECT 
    temp.name,
    d.dept_name,
    temp.salary,
    avg_temp.avg_salary,
    temp.salary - avg_temp.avg_salary AS difference
FROM
(
    SELECT 
        name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM employee
) AS temp
JOIN
(
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
) AS avg_temp
ON temp.dept_id = avg_temp.dept_id
JOIN department d
ON temp.dept_id = d.dept_id
WHERE temp.rn = 1;
