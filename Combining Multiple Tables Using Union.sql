-- Combining Multiple Tables Using Union

With all_subscriptions as (
SELECT *
FROM SubscriptionsProduct2
WHERE Active = 1
UNION 
SELECT *
FROM SubscriptionsProduct1
WHERE Active = 1
)
select
    date_trunc('year', expirationdate) as exp_year, 
    count(*) as subscriptions
from 
    all_subscriptions
group by 
    date_trunc('year', expirationdate);

--Correct output
--2 rows
-----------------------------------------
| EXP_YEAR              | SUBSCRIPTIONS |
-----------------------------------------
| 2023-01-01 00:00:00.0 | 5             |
| 2024-01-01 00:00:00.0 | 2             |
-----------------------------------------
