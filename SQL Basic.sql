## Question 1 Create a New Database and  Table for Employees

create database Company_db;
use Company_db;
create table Employees
( Employee_id int primary key,
first_name  varchar(50),
last_name  varchar(50),
department varchar(50),
salary  int,
hire_date  date);
select * from employees;

## question 2 Insert Data into Employees Table

insert into Employees
(employee_id, first_name, last_name, department, salary, hire_date)
values
('101', 'amit', 'sharma', 'hr', '50000', '2020-01-15'),
('102', 'riya', 'kapoor', 'sales', '75000', '2019-03-22'),
('103', 'raj', 'mehta', 'it', '90000', '2018-07-11'),
('104', 'neha', 'verma', 'it', '85000', '2021-09-01'),
('105', 'arjun', 'singh', 'finance', '85000', '2022-02-20');

select * from employees;

## question 3 Display All Employee Records Sorted by Salary (Lowest to Highest)

select * from employees
order by salary asc;

## question 4 Show Employees Sorted by Department (A–Z) and Salary (High → Low)

select * from employees
order by department asc, salary desc;

## question 5  List All Employees in the IT Department, Ordered by Hire Date (Newest First)

select * from employees
where department = 'it'
order by hire_date desc;

## question 6 Create and Populate a Sales Table

create table sales
( sales_id int,
customer_name varchar(50),
amount int,
sales_date date);

insert into sales
(sales_id, customer_name, amount, sales_date)
values
(1, 'aditi', '1500', '2024-08-01'),
(2, 'rohan', '2200', '2024-08-03'),
(3, 'aditi', '3500', '204-09-05'),
(4, 'meena', '2700', '2024-09-15'),
(9, 'rohan', '4500', '2024-09-25');

select * from sales;

## question 7 Display All Sales Records Sorted by Amount (Highest → Lowest)

select * from sales
order by amount desc;

## question 8  Show All Sales Made by Customer “Aditi”

select * from sales;

select * from sales
where customer_name = 'aditi';

/*
Q.9. What is the difference between a Primary key and foreign key ?
Ans : 
A (Primary Key is used to uniquely identify each record in a table. 
It does not allow duplicate or NULL values and ensures entity integrity.
Each table can have only one primary key 
Where A Foreign Key is used to establish a relationship between two tables. 
It refers to the primary key of another table and helps maintain referential integrity. 
Foreign key valus can be duplicated and may contain NULL value)
/*
 /*
Q10. What Are Constraints in SQL and Why Are They Used?
*/
-- Constraints are rules applied on table columns to maintain data accuracy and integrity.
-- Examples: PRIMARY KEY, UNIQUE, NOT NULL, CHECK, FOREIGN KEY.  
/* Constraints are used in SQL to control the data that can be inserted, updated, or deleted in a table. 
They help maintain data accuracy, consistency, and integrity in a database
/*
