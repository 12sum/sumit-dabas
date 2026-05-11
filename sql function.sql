create database student;
use student;
create table student_performance (
student_id int primary key,
name_ varchar(50),
course varchar(30),
score int,
attendance int,
mentor varchar(50),
join_date date,
city varchar(50) );

insert into  student_performance 
(student_id , name_ , course , score, attendance, mentor, join_date, city)
values
(101, 'aarav mehta', 'data science', 88, 92, 'dr.sharma', '2023-06-12', 'mumbai'),
(102, 'riya singh', 'data science', 76, 85, 'dr.sharma', '2023-07-01', 'delhi'),
(103, 'kabir khanna', 'python', 91, 96, 'ms.nair', '2023-06-20', 'mumbai'),
(104, 'tanvi patel', 'sql', 84, 89, 'mr.iyer', '2023-05-30', 'bengaluru'),
(105, 'ayesha khan', 'python', 67, 81,  'ms.nair', '2023-07-10', 'hyderabad'),
(106, 'dev sharma', 'sql', 73, 78, 'mr.iyer', '2023-05-28', 'pune'),
(107, 'arjun verma', 'tableau', 95, 98, 'ms. kapoor', '2023-06-15', 'delhi'),
(108, 'meera pillai', 'tableau', 82, 87, 'ms. kapoor', '2023-06-18', 'kochi'),
(109, 'nikhil rao', 'data science', 79, 82, 'dr.sharma', '2023-07-05', 'chennai'),
(110, 'priya desai', 'sql', 92, 94, 'mr.iyer', '2023-05-27', 'bengaluru'),
(111, 'siddharth jain', 'python', 85, 90, 'mr.nair', '2023-07-02', 'mumbai'),
(112, 'sneha kulkarni', 'tableau', 74, 83, 'mr. kapoor', '2023-06-10', 'pune'),
(113, 'rohan gupta', 'sql', 89, 91, 'mr.iyer', '2023-05-25', 'delhi'),
(114, 'ishita joshi', 'data science', 93, 97, 'dr.sharma', '2023-06-25', 'bengaluru'),
(115, 'yuvraj rao', 'python', 71, 84, 'ms.nair', '2023-07-12', 'hyderabad');

select * from student_performance;

## Create a ranking of students based on score (highest first).

SELECT 
    student_id,
    name_,
    course,
    score,
    RANK() OVER (ORDER BY score DESC) AS rank_position
FROM student_performance;

##  Show each student's score and the previous student’s score (based on score order).

select name_, score, lag(score) over (order by score desc) as previous_score from student_performance;

## Convert all student names to uppercase and extract the month name from join_date.

select upper(name_) as student_name,
monthname(join_date) as join_month from student_performance;

## Show each student's name and the next student’s attendance (ordered by attendance).

select name_ ,
attendance, lead(attendance) over 
(order by attendance) as Student_attendance from student_performance;

## Assign students into 4 performance groups using NTILE().

SELECT 
    student_id,
    name_,
    course,
    score,
    NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM student_performance;

## For each course, assign a row number based on attendance (highest first)

SELECT 
    course,
    name_,
    attendance,
    ROW_NUMBER() OVER (
        PARTITION BY course 
        ORDER BY attendance DESC
    ) AS row_num
FROM student_performance;

##  Calculate the number of days each student has been enrolled (from join_date to today).

SELECT 
    student_id,
    name_,
    join_date,
    DATEDIFF(CURDATE(), join_date) AS enrolled_days
FROM student_performance;

## Format join_date as “Month Year” (e.g., “June 2023”)

SELECT 
    student_id,
    name_,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM student_performance;

## Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.

SELECT 
    student_id,
    name_,
    REPLACE(city, 'mumbai', 'MUM') AS city_name
FROM student_performance;

## For each course, find the highest score using FIRST_VALUE().

SELECT 
    course,
    name_,
    score,
    FIRST_VALUE(score) OVER (
        PARTITION BY course
        ORDER BY score DESC
    ) AS highest_score
FROM student_performance;

