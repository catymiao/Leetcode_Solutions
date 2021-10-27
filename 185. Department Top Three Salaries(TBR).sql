/* Write your T-SQL query statement below */

SELECT Department.name AS Department, Employee, Salary FROM (
SELECT Employee, Salary, DepartmentId FROM (
SELECT Employee.Name AS Employee, Salary, DepartmentId, Dense_Rank() OVER
(PARTITION by DepartmentId order by Salary DESC) AS Rank 
 FROM Employee )a
 WHERE Rank<=3)b
 INNER JOIN Department 
 ON b.DepartmentId = Department.Id
 
 
 /* Write your T-SQL query statement below */
Select Department, Employee, Salary from (
Select d.Name AS Department, e.name AS Employee, e.Salary, 
dense_rank() over (partition by d.Name order by Salary desc) as rank            
FROM Department d, Employee e
WHERE e.DepartmentId = d.Id)a 
WHERE rank between 1 and 3 ;
