-- Business problem
-- Calculating Descriptive Statistics for Monthly Revenue By Product
WITH monthly_revenue_2022 AS (
    SELECT ProductID, date_trunc('month', OrderDate) As month , SUM(revenue) AS total_revenue
    FROM Subscriptions
    WHERE OrderDate BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY ProductID, month)
SELECT p.ProductName, MIN(m.total_revenue) AS MIN_REV , MAX(m.total_revenue) AS MAX_REV, AVG(m.total_revenue) AS AVG_REV ,STDDEV(m.total_revenue) AS STD_DEV_REV
FROM Products p
JOIN monthly_revenue_2022 m
ON p.ProductID = m.ProductID
GROUP BY p.ProductName;


--Correct output
--2 rows
------------------------------------------------------------------
| PRODUCTNAME | MIN_REV | MAX_REV | AVG_REV | STD_DEV_REV        |
------------------------------------------------------------------
| Basic       | 500     | 28000   | 13188   | 8123.763642197237  |
| Expert      | 3000    | 46000   | 18000   | 13796.134724383252 |
-----------------------------------------------------------------
