-- SQL request(s)​​​​​​‌​‌​​‌​‌‌‌​‌‌‌​‌​‌‌​‌‌‌‌​ below
-- Using self-joins to pull hierachical relationships
-- Business problem - pulling employee/manager data with a self join

SELECT 
e.employeeid as employeeid, 
e.name as employee_name, 
m.name as manager_name, 
COALESCE(m.email,e.email) AS contact_email 
FROM Employees e 
LEFT JOIN Employees m 
ON e.managerid = m.employeeid 
WHERE e.department = 'Sales'

--Correct output
4 rows
----------------------------------------------------------------------
| EMPLOYEEID | EMPLOYEE_NAME | MANAGER_NAME | CONTACT_EMAIL          |
----------------------------------------------------------------------
| E738       | Joe Burns     | Bonnie Clark | bclark6@bing.com       |
| E429       | Bonnie Clark  | null         | bclark6@bing.com       |
| E192       | Lori Fields   | Bonnie Clark | bclark6@bing.com       |
| E172       | Roy Martin    | null         | rmarting@delicious.com |
----------------------------------------------------------------------
