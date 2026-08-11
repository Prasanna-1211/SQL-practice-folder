-- Create a procedure called:show_employees that displays all employees.Then call it.
DELIMITER //
CREATE PROCEDURE show_employees()
BEGIN 
	select*from employee;
END //
DELIMITER ;    
call show_employees();

-- Create a procedure called:show_hr_employees that displays all employees working in HR.Then call it.
delimiter //
create procedure show_hr_employees()
begin 
	select name from employee
    where dept_id=1;
 END //
 DELIMITER ;
 call show_hr_employees();

-- Create:high_salary_employees that displays employees whose salary is greater than ₹30,000.
DELIMITER // 
create procedure high_salary_employees()
BEGIN
	select*from employee where salary>30000;
END //
DELIMITER ;    
CALL high_salary_employees();

-- Create a procedure:get_employee that displays the employee whose e_id = 101.
delimiter //
create procedure get_employee()
begin 
	select name from employee where e_id=101;
end //
delimiter ;
call get_employee();

-- Create a procedure called:get_employee_by_id that accepts an employee ID.
delimiter //
create procedure get_employee_by_id(in emp_id int)
begin 
	select name from employee where e_id=emp_id;
end //
delimiter ;
call get_employee_by_id(103);

-- Create:get_employees_by_department It should accept a dept_id.
delimiter //
create procedure get_employees_by_department(in d_id int)
begin 
	select name from employee where dept_id=d_id;
end //
delimiter ;
call get_employees_by_department(2);

-- Create:employees_above_salary It should accept a salary amount.
delimiter //
create procedure employees_above_salary(in sal int)
begin
	select name from employee where salary>sal;
end //
delimiter ;    
call employees_above_salary(30000);

-- Create:employees_by_age_salary It should accept:minimum age,minimum salary
delimiter //
create procedure employees_by_age_salary(in min_age int,in min_sal int)
begin
	select name from employee where age>min_age and salary>min_sal;
end //
delimiter ;
call  employees_by_age_salary(23,30000) ;

-- Create one small procedure and then delete it.
delimiter //
create procedure pro_name()
begin 
	select*from employee
    where e_id=101;
end //
delimiter ;   
call pro_name();
drop procedure pro_name;

-- Create a procedure called:department_salary.It should accept a dept_id and display:Department name,Total salary,Average salary,Number of employees
delimiter //
create procedure department_salary(in d_id int)
begin
	select dept_name,sum(salary),avg(salary),count(*) from employee e
    join department d
    on d.dept_id=e.dept_id
    where d.dept_id=d_id
    group by d.dept_id;
end //
delimiter ;
call department_salary(1);
drop procedure department_salary;	
