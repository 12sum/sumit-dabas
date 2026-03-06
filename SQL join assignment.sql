use company_db;
## Customers table
create table customers (
customerID int primary key,
customerNAME varchar(50),
city varchar(50));

insert into customers value
(1, 'john smith', 'New yourk'),
(2, 'mary johnson', 'chicago'),
(3, 'peter adams', 'los angeles'),
(4, 'nancy miler', 'houston'),
(5, 'robart white', 'miami');

## table 2 order

create table Order_table (
orderID int primary key,
customerID int,
order_date date,
amount int,
foreign key (customerID) references customers(customerID));

insert into order_table value
(101, '1', '2024-10-01', '250'),
(102, '2', '2024-10-05', '300'),
(103, '1', '2024-10-07', '150'),
(104, '3', '2024-10-10', '450'),
(105, '6', '2024-10-12', '400');

## Payments table (with FK)
CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

insert into payments value
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

## Question 1. Retrieve all customers who have placed at least one order.
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Order_table o
ON c.CustomerID = o.CustomerID;

## Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Order_table o
ON c.CustomerID = o.CustomerID;

## Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Order_table o
ON c.CustomerID = o.CustomerID;

## Question 4. Display all customers and orders, whether matched or not.
SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Order_table o ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM Customers c
RIGHT JOIN Order_table o ON c.CustomerID = o.CustomerID;

## Question 5. Find customers who have not placed any orders.
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Order_table o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

## Question 6. Retrieve customers who made payments but did not place any orders.
SELECT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

## Question 7. Generate a list of all possible combinations between Customers and Orders.
SELECT c.CustomerName, o.OrderID
FROM Customers c
CROSS JOIN Order_table o;

## Question 8. Show all customers along with order and payment amounts in one table.
SELECT c.CustomerName,
       o.Amount AS OrderAmount,
       p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Order_table o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

## Question 9. Retrieve all customers who have both placed orders and made payments.
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Order_table o ON c.CustomerID = o.CustomerID
INNER JOIN Payments p ON c.CustomerID = p.CustomerID;




