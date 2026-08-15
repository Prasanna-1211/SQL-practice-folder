-- BEFORE INSERT
delimiter //
create trigger check_salary_before_insert
before insert
on employee
for each row 
begin
	if new.salary<0 then
		signal sqlstate '45000'
        set message_text='salary cannot be negativ';
    end if;
end //
delimiter ;    
insert into employee values(106, 'Ravi', 24, -50000, '2024-06-15', 3);

-- AFTER INSERT
create table employee_log(
	log_id int auto_increment primary key,
    e_id int,
    action varchar(20),
    log_time datetime
); 
delimiter //
create trigger insert_into_employee_log
after insert
on employee
for each row
begin
	 insert into employee_log (e_id, action, log_time) values(new.e_id,'insert',now());
end //	
insert into employee values(107, 'Ramya', 25, 80000, '2026-08-14', 1);
select*from employee_log;    
describe employee;
SHOW CREATE TABLE employee;	
DESCRIBE employee_log;
DROP TRIGGER insert_into_employee_log;
drop table employee_log;

-- AFTER UPDATE
create table salary_history(
	history_id int auto_increment primary key,
	emp_id int,
    old_sal int,
    new_sal int,
    curr_dt datetime
);
delimiter //
create trigger salary_update_history
after update
on employee
for each row
begin
	insert into salary_history(emp_id, old_sal, new_sal, curr_dt) values(old.e_id, old.salary, new.salary, now());
end //
delimiter ;    
UPDATE employee
SET salary = salary + 1000
WHERE e_id = 101;
select*from salary_history;

-- BEFORE DELETE
create table deleted_employees(
	delete_history int auto_increment primary key,
	emp_id int,
    emp_name varchar(20),
    sal int,
    del_time datetime
);
delimiter //
create trigger emp_delete_history
before delete
on employee
for each row
begin
	insert into deleted_employees(emp_id,emp_name,sal,del_time) values (old.e_id,old.name,old.salary, now());
end //
delimiter ;
delete from employee where e_id = 102;
select*from deleted_employees;

-- AFTER UPDATE
create table department_changes(
	dept_chng int auto_increment primary key,
    emp_id int,
    old_deptid int,
    new_deptid int,
    change_time datetime
);
delimiter //
create trigger emp_department_changes
after update
on employee
for each row
begin
	insert into department_changes (emp_id,old_deptid,new_deptid,change_time) values (old.e_id,old.dept_id,new.dept_id,now());
end //
delimiter ;
UPDATE employee
SET dept_id = 2
WHERE e_id = 101;
select*from department_changes;

-- Create a trigger that prevents an employee's salary from being decreased.
delimiter //
create trigger reject_table
before update
on employee
for each row
begin
	if new.salary<old.salary then
		signal sqlstate '45000'
		set message_text='salary cannot update';
	end if;
end //
delimiter ;
update employee
set salary=20000
where _id=101;
SHOW CREATE TRIGGER reject_table;