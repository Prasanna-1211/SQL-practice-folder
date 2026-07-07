create database EmployeeManagement;
USE EmployeeManagement;
CREATE TABLE department
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);
CREATE TABLE employee
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    joining_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);