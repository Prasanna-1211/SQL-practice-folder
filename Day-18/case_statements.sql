-- Salary category Display:name | salary | category Rules:Salary ≥ 50,000 → High Salary ≥ 30,000 → Medium Otherwise → Low
select name, salary,
case
	when salary>=50000 then 'high'
	when salary>=30000 then 'medium'
    else 'low'
end  as salary_category
from employee;  
-- Age category Display:name | age | age_categoryRules:Age ≥ 25 → Senior Age ≥ 22 → Middle Otherwise → Young
select name ,age,
case
	when age>=25 then 'senior'
    when age>=22 then 'middle'
    else 'young'
end as age_category   
from employee;
-- Salary increase category Display:name | salary | salary_level Rules:Salary ≥ 60,000 → Excellent Salary ≥ 40,000 → Good Salary ≥ 30,000 → Average Otherwise → Low
select name,salary, 
case 
	when salary>=60000 then 'excellent'
    when salary >= 40000 then 'Good'
	when salary >= 30000 then 'Average'
	else 'Low'
end as salary_level
 from employee;
-- Department name using CASE Instead of joining the department table, display:name | department Rules:dept_id = 1 → HR,dept_id = 2 → Sales,dept_id = 3 → IT,dept_id = 4 → Finance
select name,dept_id,
case 
	when dept_id=1 then 'HR'
    when dept_id=2 then 'Sales'
    when dept_id=3 then 'IT'
    else 'Finance'
end as department
from employee;
-- Employee experience Using joining_date, categorize employees:Joined before 2022 → Experienced,Joined during 2022 → Intermediate,Joined after 2022 → Recent
select name,joining_date,
case
	when year(joining_date)<2022 then 'experienced'
    when year(joining_date)=2022 then 'intermediate'
    when year(joining_date) > 2022 then 'recent'
end as experience    
from employee;
-- Salary bonus calculation Display:name | salary | bonus Rules:Salary ≥ 50,000 → bonus = 10% of salary,Salary ≥ 30,000 → bonus = 7%,Otherwise → bonus = 5%
select name,salary,
case
	when salary>=50000 then salary*0.10
    when salary>=30000 then salary*0.07
    else salary*0.05
end as bonus from employee;
-- Employee status Display:name | age | status Rules:Age < 21 → Junior,Age 21–25 → Regular,Age > 25 → Senior
select name,age,
case
	when age<21 then 'junior'
    when age between 21 and 25 then 'regular'
    when age>25 then 'senior'
end as status from employee;
-- CASE with aggregate functions Display each department's:dept_id total_salary salary_status Rules:Total salary > ₹80,000 → High Expense,Total salary > ₹50,000 → Medium Expense,Otherwise → Low Expense
select dept_id,sum(salary),
case
	when sum(salary)>80000 then 'High_Expense'
    when sum(salary)>50000 then 'Medium_Expense'
    else 'Low_Expense'
end as salary_status from employee
group by dept_id;

-- Display:Employee Name,Department Name,Salary,Salary Category,Age Category
select name,dept_name,salary,
case
	when salary>=50000 then 'High'
  	when salary>=30000 then 'medium'
	else 'low'
end as salary_category,
CASE
    WHEN age >= 25 THEN 'Senior'
    WHEN age >= 22 THEN 'Middle'
    ELSE 'Young'
END AS age_category
from employee
join department
on employee.dept_id=department.dept_id;

select name,dept_name,salary,
CASE
    WHEN age >= 25 THEN 'Senior'
    WHEN age >= 22 THEN 'Middle'
    ELSE 'Young'
END AS age_category from employee
join department
on employee.dept_id=department.dept_id;









