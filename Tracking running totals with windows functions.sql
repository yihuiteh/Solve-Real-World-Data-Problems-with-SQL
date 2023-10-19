-- SQL request(s)​​​​​​‌​‌​​‌​‌‌‌​‌‌‌‌‌​‌​​‌​​‌‌ below
-- Tracking sales progress quote over time

SELECT salesemployeeid, 
saledate, 
saleamount, 
SUM(SALEAMOUNT) OVER 
(PARTITION BY salesemployeeid ORDER BY saledate) AS running_total,
CAST(SUM(SALEAMOUNT) OVER 
(PARTITION BY salesemployeeid ORDER BY saledate) AS float)/quota AS percent_quota
FROM Sales 
JOIN Employees 
ON Sales.SalesEmployeeID = Employees.EmployeeID 
ORDER BY salesemployeeid, saledate

--
--
Correct output
16 rows
-----------------------------------------------------------------------------------
| SALESEMPLOYEEID | SALEDATE   | SALEAMOUNT | RUNNING_TOTAL | PERCENT_QUOTA       |
-----------------------------------------------------------------------------------
| E172            | 2023-03-11 | 9000       | 9000          | 0.18                |
| E172            | 2023-06-11 | 11000      | 20000         | 0.4                 |
| E172            | 2023-06-15 | 15000      | 35000         | 0.7                 |
| E172            | 2023-07-17 | 3000       | 38000         | 0.76                |
| E192            | 2023-02-09 | 14000      | 14000         | 0.23333333333333334 |
| E192            | 2023-03-14 | 9000       | 23000         | 0.38333333333333336 |
| E192            | 2023-05-16 | 16000      | 39000         | 0.65                |
| E429            | 2023-01-30 | 4000       | 4000          | 0.05                |
| E429            | 2023-04-03 | 7000       | 11000         | 0.1375              |
| E429            | 2023-07-13 | 10000      | 21000         | 0.2625              |
| E738            | 2023-01-04 | 18000      | 18000         | 0.36                |
| E738            | 2023-03-18 | 10000      | 28000         | 0.56                |
| E738            | 2023-03-26 | 5000       | 33000         | 0.66                |
| E738            | 2023-04-16 | 1000       | 34000         | 0.68                |
| E738            | 2023-07-16 | 12000      | 46000         | 0.92                |
| E738            | 2023-07-28 | 11000      | 57000         | 1.14                |
-----------------------------------------------------------------------------------
