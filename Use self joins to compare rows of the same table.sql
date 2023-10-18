-- SQL request(s)​​​​​​‌​‌​​‌​‌‌‌​‌‌‌​‌‌‌​‌​​‌​​ below
-- Business problem-compare MOM revenue 
WITH monthly_revenue AS
(SELECT date_trunc('month',OrderDate) as month,SUM(revenue) as revenue
FROM Subscriptions
GROUP BY month)
SELECT 
c.month AS current_month, 
p.month AS previous_month,
c.revenue AS current_revenue,
p.revenue AS previous_revenue
FROM monthly_revenue c
JOIN monthly_revenue AS p
ON datediff('month', p.month,c.month) =1
WHERE c.revenue > p.revenue

Correct output
2 rows
--------------------------------------------------------------------------------------
| CURRENT_MONTH         | PREVIOUS_MONTH        | CURRENT_REVENUE | PREVIOUS_REVENUE |
--------------------------------------------------------------------------------------
| 2022-07-01 00:00:00.0 | 2022-06-01 00:00:00.0 | 63000           | 31000            |
| 2022-10-01 00:00:00.0 | 2022-09-01 00:00:00.0 | 27000           | 26000            |
--------------------------------------------------------------------------------------
