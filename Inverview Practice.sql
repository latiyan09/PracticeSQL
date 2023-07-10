use sales_schema;

CREATE TABLE EmployeeDetail (
  EmployeeID INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Salary DECIMAL(10,2),
  JoiningDate DATE,
  Department VARCHAR(255),
  Gender VARCHAR(10)
);

Select* from EmployeeDetail;

INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES
  (1, 'Vikas', 'Ahlawat', 5000.00, '2022-01-01', 'Finance', 'Male'),
  (2, 'nikita', 'Jain', 6000.00, '2022-02-15', 'Human Resources', 'Female'),
  (3, 'Michael', 'Johnson', 5500.00, '2022-03-10', 'Marketing', 'Male'),
  (4, 'Emily', 'Brown', 6500.00, '2022-04-05', 'Sales', 'Female'),
  (5, 'Robert', 'Davis', 5200.00, '2022-05-20', 'IT', 'Male'),
  (6, 'Jessica', 'Taylor', 5800.00, '2022-06-12', 'Operations', 'Female'),
  (7, 'Christopher', 'Anderson', 5300.00, '2022-07-18', 'Finance', 'Male'),
  (8, 'Sophia', 'Wilson', 6200.00, '2022-08-25', 'Human Resources', 'Female'),
  (9, 'Daniel', 'Clark', 5400.00, '2022-09-30', 'Marketing', 'Male'),
  (10, 'Olivia', 'Martinez', 6000.00, '2022-10-10', 'Sales', 'Female'),
  (11, 'David', 'Garcia', 5100.00, '2022-11-12', 'IT', 'Male'),
  (12, 'Emma', 'Lopez', 5700.00, '2022-12-18', 'Operations', 'Female'),
  (13, 'James', 'Hernandez', 5600.00, '2023-01-05', 'Finance', 'Male'),
  (14, 'Ava', 'Miller', 5900.00, '2023-02-22', 'Human Resources', 'Female'),
  (15, 'Joseph', 'Young', 6200.00, '2023-03-15', 'Marketing', 'Male'),
  (16, 'Mia', 'Lee', 5300.00, '2023-04-10', 'Sales', 'Female'),
  (17, 'William', 'Gonzalez', 5400.00, '2023-05-01', 'IT', 'Male'),
  (18, 'Charlotte', 'Perez', 5800.00, '2023-06-02', 'Operations', 'Female'),
  (19, 'Benjamin', 'Turner', 5700.00, '2023-06-20', 'Finance', 'Male'),
  (20, 'Amelia', 'King', 6000.00, '2023-07-05', 'Human Resources', 'Female');
  
-- Write a query to get all employee detail from "EmployeeDetail" table  
Select * from EmployeeDetail;

-- Write a query to get only "FirstName" column from "EmployeeDetail" table

Select FirstName from EmployeeDetail;

-- Write a query to get FirstName in upper case as "First Name".

Select Upper(FirstName) as 'First Name' from EmployeeDetail;

-- Write a query to get FirstName in lower case as "First Name".

Select lower(FirstName) as 'First Name' from EmployeeDetail;

-- Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)

Select Concat(FirstName,' ' ,LastName) as 'Name' from EmployeeDetail; 

-- Select employee detail whose name is "Vikas"

Select * from EmployeeDetail where FirstName = 'Vikas';

-- Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'd'.

Select * from EmployeeDetail where FirstName like 'd%';

-- Get all employee details from EmployeeDetail table whose "FirstName" contains 'k'.

Select * from EmployeeDetail Where FirstName like '%k%';

-- Get all employee details from EmployeeDetail table whose "FirstName" end with 'a'.

Select * from EmployeeDetail Where FirstName like '%a';

-- Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-c'

SELECT * FROM EmployeeDetail WHERE FirstName REGEXP '^[a-c]';

-- Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-c'

select * from EmployeeDetail where FirstName regexp '^[d-z]';

SELECT * FROM EmployeeDetail WHERE FirstName NOT REGEXP '^[a-c]';

-- Get all employee detail from EmployeeDetail table whose "Gender" end with 'le'and contain 4 letters. The Underscore(_) Wildcard Character represents any single character.

Select * from EmployeeDetail where Gender like '__le';

-- Get all employee detail from EmployeeDetail table whose "FirstName" start with 'D' and contain 5 letters.

Select * from EmployeeDetail Where Firstname like 'D____';

-- Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".

Select * from EmployeeDetail where FirstName like '%[%]%';

-- Get all unique "Department" from EmployeeDetail table.

Select distinct(Department) from EmployeeDetail;

-- Get the highest "Salary" from EmployeeDetail table.

Select max(Salary) from EmployeeDetail;

-- Get the lowest "Salary" from EmployeeDetail table.

Select min(Salary) from EmployeeDetail;

-- Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"

Select date_format(JoiningDate, '%d %b %y') from EmployeeDetail;

-- Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

Select date_format(JoiningDate, '%Y/%m/%d') from EmployeeDetail;

-- Show only time part of the "JoiningDate".

Select time(JoiningDate) as JoinTime from EmployeeDetail;

-- Get only Year part of "JoiningDate".

select date_format(JoiningDate, '%Y') from EmployeeDetail;

-- Get only Month part of "JoiningDate".

select date_format(JoiningDate, '%b') from EmployeeDetail;

-- Get system date.

Select curdate();

select current_timestamp();

-- Get the first name, current date, joiningdate and diff between current date and joining date in months.

Select FirstName, curdate() as CurrentDate , JoiningDate, timestampdiff(Month,JoiningDate,curdate()) asTotalMonth from EmployeeDetail;

-- Get the first name, current date, joiningdate and diff between current date and joining date in days.

Select FirstName, curdate() as CurrentDate , JoiningDate, timestampdiff(Day,JoiningDate,curdate()) asTotalMonth from EmployeeDetail;

Select FirstName, curdate() as CurrentDate , JoiningDate, datediff(curdate(),JoiningDate) asTotalMonth from EmployeeDetail;

-- Get all employee details from EmployeeDetail table whose joining year is 2023.

select * from EmployeeDetail where date_format(JoiningDate, '%Y')='2023';

-- Get all employee details from EmployeeDetail table whose joining month is Jan(1).

Select * from EmployeeDetail Where date_format(JoiningDate, '%m') = '01';

-- Get all employee details from EmployeeDetail table whose joining date between "2013-01-01" and "2013-12-01".

Select * from EmployeeDetail where JoiningDate between "2023-01-01" and "2023-06-01";

-- Get how many employee exist in "EmployeeDetail" table.

Select count(*) from EmployeeDetail; 

-- Select only one/top 1 record from "EmployeeDetail" table.

Select * from EmployeeDetail limit 1; 

-- Select all employee detail with First name in/not in "Vikas","Ashish", and "Nikhil".

Select * from EmployeeDetail where FirstName IN ('Vikas','nikita');

Select * from EmployeeDetail where FirstName NOT IN ('Vikas','nikita');

-- Display first name and Gender as M/F.(if male then M, if Female then F)

Select FirstName, Gender from EmployeeDetail;

Select FirstName, 
Case 
When Gender = 'Male' Then 'M'
When Gender = 'Female' Then 'F'
End as Gen
from EmployeeDetail;

-- Select first name from "EmployeeDetail" table prifixed with "Hello "

Select concat('Hello',' ',FirstName) as FisName from EmployeeDetail;

-- Get employee details from "EmployeeDetail" table whose Salary greater than 6000

Select * from EmployeeDetail where Salary > 6000;

-- Get employee details from "EmployeeDetail" table whose Salary less than 5500

Select * from EmployeeDetail Where Salary < 5500;

-- Get employee details from "EmployeeDetail" table whose Salary between 5300 than 6000

Select * from EmployeeDetail Where Salary Between 5300 and 6000;

-- Select second highest salary from "EmployeeDetail" table.

Select Salary from EmployeeDetail order by Salary Desc limit 1,1;

select FirstName, date_format(JoiningDate, '%Y %b') from EmployeeDetail;

