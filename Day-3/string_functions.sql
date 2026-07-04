select*from department;
select*from employee;
-- Display all employee names in UPPERCASE.
select UPPER(name)
from employee;
-- Display all employee names in lowercase.
select lower(name) from employee;
-- Display employee names along with the length of each name.
select name,LENGTH(name) from employee;
-- Display the first 3 letters of every employee's name.
select SUBSTRING(name,1,3) from employee;
-- Display the last 2 letters of every employee's name.
select SUBSTRING(name,length(name)-1,2) from employee;
-- Display employee names by adding the word "Employee" after each name.
select concat(name,' ','employee') from employee;
-- Replace Asha with Ananya in the output.
select REPLACE(name,'Asha','ammu') from employee;
-- Display only the first letter of every employee's name.
select substring(name,1,1) from employee;
-- Display only the last letter of every employee's name.
select substring(name,LENGTH(name),1) from employee;
-- Remove spaces from
select TRIM(' '*'	sql practice	'*'');
-- Display employees whose names start with A.
select *from employee
where name like 'A%';
-- Display employees whose names end with a.
select*from employee
where name like '%a';
-- Display employees whose names contain h.
select*from employee
where name like '%i%';
-- Display employees whose names have exactly 5 letters.
select*from employee
where LENGTH(name)=5;
-- Display employees whose second letter is i.
select*from employee
where name like '_i%';
