Select * from EmployeeDetail;

CREATE TABLE ProjectDetail (
  ProjectDetailID INT PRIMARY KEY,
  EmployeeDetailID INT,
  ProjectName VARCHAR(255)
);

INSERT INTO ProjectDetail (ProjectDetailID, EmployeeDetailID, ProjectName)
VALUES
  (1, 1, 'Task Track'),
  (2, 1, 'CLP'),
  (3, 1, 'Survey Management'),
  (4, 2, 'HR Management'),
  (5, 3, 'Task Track'),
  (6, 3, 'GRS'),
  (7, 3, 'DDS'),
  (8, 4, 'HR Management'),
  (9, 6, 'GL Management'),
  (10, 2, 'Testing');

Select * from ProjectDetail;

-- Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail group by Department;

-- Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail group by Department order by TotalSalary asc;

-- Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary.

Select Department, Sum(Salary) as TotalSalary from EmployeeDetail group by Department order by TotalSalary desc;

-- Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.

Select department, count(*) as DepaetmentCount, Sum(Salary) as TotalSalary from EmployeeDetail group by Department;

-- Get department wise average salary from "EmployeeDetail" table order by salary ascending

Select Department, avg(Salary) as AverageSalary from EmployeeDetail group by Department order by AverageSalary asc;

-- Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

Select Department, Max(Salary) as MaxSalary from EmployeeDetail group by Department order by MaxSalary asc;

-- Get department wise minimum salary from "EmployeeDetail" table order by salary ascending

Select Department, Min(Salary) as MinSalary from EmployeeDetail group by Department order by MinSalary desc;

-- Write down the query to fetch Project name assign to more than one Employee

Select ProjectName, count(*) as ProjectCount from ProjectDetail group by ProjectName having ProjectCount>1;

-- SQL JOINS RELATED INTERVIEW QUERIES

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

Select* from EmployeeDetail;
Select * from ProjectDetail;

Select EmployeeId, FirstName, ProjectName from EmployeeDetail as A Inner Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID order by FirstName;

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.

Select FirstName, ProjectName from EmployeeDetail as A Left Outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID order by FirstName;

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned".

Select FirstName, ifnull(ProjectName,'-No Project Assigned') from EmployeeDetail as A Left outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID order by FirstName;

-- Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail".

Select ProjectName, FirstName from ProjectDetail as A Left Outer Join  EmployeeDetail as B on A.EmployeeDetailID = B.EmployeeID order by FirstName;

Select FirstName, ProjectName from EmployeeDetail as A Right Outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID order by FirstName;

-- Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.

Select FirstName, ProjectName from EmployeeDetail as A Left Outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID 
union all
Select FirstName, ProjectName from EmployeeDetail as A Right Outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID order by FirstName;

-- Write a query to find out the employeename who has not assigned any project, and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]).

Select FirstName, ifnull(ProjectName,'-No Project Assigned') from EmployeeDetail as A Left outer Join ProjectDetail as B on A.EmployeeID=B.EmployeeDetailID where B.ProjectName is null;

SELECT ProjectName FROM EmployeeDetail as A RIGHT OUTER JOIN ProjectDetail as B ON A.EmployeeID = B.EmployeeDetailID where FirstName is null;

-- Write down the query to fetch EmployeeName & Project who has assign more than one project.

Select EmployeeId, FirstName, ProjectName from EmployeeDetail as A Inner Join ProjectDetail as B on A.EmployeeID = B.EmployeeDetailID 
where 
EmployeeID in (Select EmployeeDetailID from ProjectDetail group by EmployeeDetailID Having count(*)>1);

Select FirstName, Salary, row_number() over (order by Salary Desc) as Ra from EmployeeDetail;

select * from EmployeeDetail;

Select FirstName, JoiningDate, row_number() over (order by JoiningDate asc) as Ra from EmployeeDetail;

-- Get the FirstName, Department, Salary for every employee and show average salary of every department for each employee

SELECT FirstName, Department, Salary,
       AVG(Salary) OVER (PARTITION BY Department) AS AvgSalaryByDept
FROM EmployeeDetail;

Select Department, avg(Salary) as AverageSalary from EmployeeDetail group by Department;


