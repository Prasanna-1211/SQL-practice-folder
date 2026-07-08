DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO department VALUES
(1,'HR'),
(2,'Sales'),
(3,'IT'),
(4,'Finance');

CREATE TABLE employee(
    e_id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    joining_date DATE,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee VALUES
(101,'Asha',22,25000,'2022-01-15',1),
(102,'Rahul',25,30000,'2023-03-20',2),
(103,'Sneha',23,28000,'2022-09-18',1),
(104,'Kiran',27,45000,'2021-11-10',3),
(105,'Aishu',19,60000,'2024-01-05',2);

SELECT * FROM department;
SELECT * FROM employee;