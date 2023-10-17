-- SQL request(s)​​​​​​‌​‌​​‌​‌‌​‌​​‌‌‌​‌‌‌‌‌​‌‌ below
--Business Problme: Flagging upsell opportunities for the sales team
SELECT CustomerID, COUNT(ProductID) AS num_products, SUM(NumberOfUsers) AS total_users,
CASE WHEN (SUM(NumberOfUsers) >= 5000 OR COUNT(ProductID) = 1) THEN 1 ELSE 0 END AS upsell_opportunity
FROM Subscriptions
GROUP BY CustomerID
-- Customer with only one product subscription and customers with at least 5000 total users
-- Cannot use the column aliases directly in the CASE statement within the same SELECT clause. This is because the logical processing order of SQL does not allow you to reference the column aliases in the same SELECT clause.
--Correct output
15 rows
----------------------------------------------------------------
| CUSTOMERID | NUM_PRODUCTS | TOTAL_USERS | UPSELL_OPPORTUNITY |
----------------------------------------------------------------
| 11627      | 2            | 1300        | 0                  |
| 18226      | 2            | 2000        | 0                  |
| 23561      | 2            | 1700        | 0                  |
| 28333      | 2            | 1050        | 0                  |
| 29335      | 1            | 50          | 1                  |
| 33222      | 2            | 325         | 0                  |
| 33663      | 2            | 1750        | 0                  |
| 33667      | 2            | 1600        | 0                  |
| 38822      | 2            | 1000        | 0                  |
| 44538      | 2            | 3000        | 0                  |
| 55533      | 2            | 17000       | 1                  |
| 76338      | 2            | 1700        | 0                  |
| 82772      | 2            | 5300        | 1                  |
| 93888      | 1            | 5000        | 1                  |
| 99402      | 2            | 2000        | 0                  |
----------------------------------------------------------------
