create database subqueries;
create table Employee (
Emp_id int primary key,
Name_ varchar(50),
Department_id  varchar(50),
Salary int);

select * from Employee;

insert into employee (Emp_id, Name_, Department_id, Salary)
values
(101, 'abhishek', 'D01', 62000),
(102, 'shubham', 'D01', 58000),
(103, 'priya', 'D02', 67000),
(104, 'rohit', 'D02', 64000),
(105, 'neha', 'D03', 72000),
(106, 'aman', 'D03', 55000),
(107, 'ravi', 'D04', 60000),
(108, 'sneha', 'D04', 75000),
(109, 'kiran', 'D05', 70000),
(110, 'tanuja', 'D05', 65000);

select * from Employee;

create table Department (
Department_id int,
Department_Name varchar(50),
Location varchar(50));

select * from Department;

ALTER TABLE Department
MODIFY Department_id varchar(50);

INSERT INTO Department (Department_id, Department_Name, Location)
VALUES
('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

select * from Department;

create table Sales (
Sales_id int,
Emp_id int,
Sale_amount int,
Sale_date date);

INSERT INTO Sales (Sales_id, Emp_id, Sale_amount, Sale_date)
VALUES
(201, 101, 4500, '2025-01-05'),
(202, 102, 7800, '2025-01-10'),
(203, 103, 6700, '2025-01-14'),
(204, 104, 12000, '2025-01-20'),
(205, 105, 9800, '2025-02-02'),
(206, 106, 10500, '2025-02-05'),
(207, 107, 3200, '2025-02-09'),
(208, 108, 5100, '2025-02-15'),
(209, 109, 3900, '2025-02-20'),
(210, 110, 7200, '2025-03-01');

Select * from Sales;

## Retrieve the names of employees who earn more than the average salary of all employees.

Select Name_ From Employee
where Salary > (select AVG(salary) from Employee);

## Find the employees who belong to the department with the highest average salary.

Select  Name_, Department_id from Employee
where Department_id in (select Department_id From Employee
Group by Department_id having AVG(Salary) = (select MAX(avg_Sal) from ( select AVG(Salary) AS avg_sal From Employee 
group by Department_id ) as Temp ) );

## List all employees who have made at least one sale. 

select Name_, Emp_id
from Employee e
where exists ( select 1 From Sales s where s .Emp_id = e .Emp_id);

## Find the employee with the highest sale amount.

select Name_, Sale_amount From Employee e
join Sales s on e .Emp_id = s .emp_id
where s .sale_amount = ( select MAX(Sale_amount) from sales );

## Retrieve the names of employees whose salaries are higher than Shubham’s salary.

select Name_, salary from Employee 
where salary > ( select salary from Employee where Name_ = 'shubham');

## Intermediate Level

## Find employees who work in the same department as Abhishek.


select Name_ , department_id from employee
where department_id = (select department_id  from employee
where Name_ = 'abhishek');

## List departments that have at least one employee earning more than ₹60,000


SELECT DISTINCT Department_id
FROM Employee
WHERE Salary > 60000;

## Find the department name of the employee who made the highest sale.

select d.department_name from department d
join employee e on d.department_id = e.department_id
join sales s on e.emp_id = s.emp_id
where s.sale_amount = (select max(sale_amount) from sales);

## Retrieve employees who have made sales greater than the average sale amount.

select e.Name_, s.sale_amount from employee e
join sales s on e.emp_id = s.emp_id
where s.sale_amount > (select AVG(sale_amount)
from sales);

## Find the total sales made by employees who earn more than the average salary.

select e.Name_, sum(s.sale_amount) from employee e
join sales s on e.emp_id = s.emp_id
where e.salary > (SELECT AVG(Salary) from employee)
group by e.Name_;

## Find employees who have not made any sales

SELECT e.Name_, e.Emp_id
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.Emp_id = e.Emp_id
);

## List departments where the average salary is above ₹55,000.

select d.department_name, round(AVG(e.salary),0) as avg_salary from employee e
join department d on e.department_id = d.department_id
group by d.department_name 
having AVG(e.salary)  > '55000';

## Retrieve department names where the total sales exceed ₹10,000.

select d.department_name, sum(s.sale_amount) from sales s
join employee e on s.emp_id = e.emp_id
join department d on e.department_id = d.department_id
group by d.department_name 
having sum(s.sale_amount) > 10000;

## Find the employee who has made the second-highest sale.

select e.Name_, s.sale_amount from employee e 
join sales s on e.emp_id = s.emp_id
order by s.sale_amount desc limit 1 offset 1;

## Retrieve the names of employees whose salary is greater than the highest sale amount recorded.

SELECT Name_, Salary from employee
where salary > (select max(Sale_amount) from Sales);








