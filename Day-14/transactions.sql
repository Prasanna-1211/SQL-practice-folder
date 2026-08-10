-- Start a transaction and increase Asha's salary by ₹2,000.
start transaction;
 update employee
 set salary=salary+2000
 where e_id=101;
 select name,salary from employee
 where e_id =101;

-- Start a transaction and increase Rahul's salary by ₹5,000.
start transaction;
update employee
set salary=salary+5000
where e_id=102;
select name,salary from employee where e_id=102;
 rollback;
select name,salary from employee where e_id=102;

-- Start a transaction and increase Sneha's salary by ₹3,000.
start transaction;
update employee
set salary=salary+3000
where e_id=103;
commit;
select*from employee
where e_id=103;

-- Start a transaction.Increase Asha's salary by ₹1,000.Create a savepoint called sp1.Increase Rahul's salary by ₹2,000.Roll back to sp1.Check both salaries.
start transaction;
update employee
set salary=salary+1000
where e_id=101;
savepoint sp1;
update employee
set salary=salary+2000
where e_id=102;
rollback to sp1;
select name,salary from employee where e_id in (101,102);

-- Start a transaction.Increase Asha's salary by ₹1,000.SAVEPOINT sp1.Increase Rahul's salary by ₹2,000.SAVEPOINT sp2.Increase Kiran's salary by ₹3,000.Roll back to sp1.
start transaction;
update employee
set salary=salary+1000
where e_id=101;
savepoint sp1;
update employee
set salary=salary+2000
where e_id=102;
savepoint sp2;
update employee
set salary=salary+3000
where e_id=104;
rollback to sp1;
select name,salary from employee where e_id in (101,102,104);

-- Start a transaction.Delete the employee whose e_id = 105.Check the table.Then:ROLLBACK;
start transaction;
delete from employee
where e_id=105;
select name,e_id from employee;
rollback;

-- Start a transaction.Increase the salary of all IT employees by 10%.Check the result.Then rollback.
start transaction;
update employee
set salary=salary*1.10
where dept_id=3;
select*from employee;
rollback;

-- Start a transaction.Asha salary +1000,Rahul salary +2000,Sneha salary +3000.Then rollback the entire transaction.
start transaction;
update employee
set salary= salary+1000
where e_id=101;
update employee
set salary=salary+2000
where e_id=102;
update employee
set salary=salary+3000
where e_id=103;
select*from employee where e_id in (101,102,103);
rollback;





