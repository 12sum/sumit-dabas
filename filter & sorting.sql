create database pwskill_2;
use pwskill_2;
create table employees
( Emp_id varchar(50),
Emp_name varchar(50),
Department varchar(20),
city varchar(50),
salary int,
hire_date date);
select * from employees;

insert into employees (Emp_id, Emp_name, Department, city, salary, hire_date)
values 
(101, 'rahul mehta', 'sales', 'delhi', '55000', '2020-04-12');

select * from employees;

insert into employees (Emp_id, Emp_name, Department, city, salary, hire_date)
values 
(102, 'priya sharma', 'hr', 'mumbai', '62000', '2019-09-25'),
(103, 'aman singh', 'it', 'bengaluru', '7200', '2021-03-10'),
(104, 'neha patel', 'sales', 'delhi', '48000', '2022-01-14'),
(105, 'karan joshi', 'marketing', 'pune', '45000', '2018-07-22'),
(106, 'divya nair', 'it', 'chennai', '81000', '2019-12-11'),
(107, 'raj kumar', 'hr', 'delhi', '60000', '2020-05-28'),
(108, 'simran kaur', 'finance', 'mumbai', '58000', '2021-08-03'),
(109, 'arjun reddy', 'it', 'heydrabad', '70000', '2022-02-18'),
(110, 'anjali das', 'sales', 'kolkata', '51000', '2023-01-15');

## question 1 Show employees working in either the ‘IT’ or ‘HR’ departments

select * from employees
where department = 'it'
or department = 'hr';

## question 2 Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.

select * from employees
where department in ('sales', 'it', 'finance');

## question 3 Display employees whose salary is between ₹50,000 and ₹70,000.

select * from employees
where salary between 50000 and 70000;

## question 4  List employees whose names start with the letter ‘A’.

select * from employees
where Emp_name like 'A%';

## question 5 Find employees whose names contain the substring ‘an’.

select *from employees
where Emp_name like'%AN%';

## question 6  Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000

select * from employees
where city in ('delhi', 'mumbai')
and salary > 55000;

## question 7 Display all employees except those from the ‘HR’ department.

select * from employees
where not department = 'hr';

## question 8 Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).

select * from employees
where hire_date between '2019-01-01' and '2022-12-31'
order by hire_date asc;
