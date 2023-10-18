-- Option 1 Solution using CTE

with all_cancelation_reason as(
SELECT SubscriptionID, CancelationReason1 AS cancelationreason
FROM Cancelations
UNION
SELECT SubscriptionID, CancelationReason2 AS cancelationreason
FROM Cancelations
UNION
SELECT SubscriptionID, CancelationReason3 AS cancelationreason
FROM Cancelations)
select 
    cast(count(
        case when cancelationreason = 'Expensive' 
        then subscriptionid end) as float)
    /count(distinct subscriptionid) as percent_expensive
from    
    all_cancelation_reason

--Option 2 Solution using Subquery
SELECT
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Cancelations) AS percent_expensive
FROM Cancelations
WHERE 'Expensive' IN (CANCELATIONREASON1, CANCELATIONREASON2, CANCELATIONREASON3);

--Correct output
--1 row
---------------------
| PERCENT_EXPENSIVE |
---------------------
| 0.5               |
---------------------
