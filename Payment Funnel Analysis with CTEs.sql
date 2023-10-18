--Business Problem
--Payment Funnel Analysis with CTEs

WITH max AS (
SELECT SubscriptionID,MAX(StatusID) as maxstatus
FROM PaymentStatusLog
GROUP BY SubscriptionID)

SELECT COUNT(s.SUBSCRIPTIONID) AS subscriptions,
case when max.maxstatus = 1 then 'PaymentWidgetOpened'
		when max.maxstatus = 2 then 'PaymentEntered'
		when max.maxstatus = 3 and currentstatus = 0 then 'User Error with Payment Submission'
		when max.maxstatus = 3 and currentstatus != 0 then 'Payment Submitted'
		when max.maxstatus = 4 and currentstatus = 0 then 'Payment Processing Error with Vendor'
		when max.maxstatus = 4 and currentstatus != 0 then 'Payment Success'
		when max.maxstatus = 5 then 'Complete'
		when max.maxstatus is null then 'User did not start payment process'
		end as paymentfunnelstage
FROM Subscriptions s
LEFT JOIN max
ON max.SUBSCRIPTIONID = s.SUBSCRIPTIONID
GROUP BY paymentfunnelstage

--Correct output
--8 rows
--------------------------------------------------------
| SUBSCRIPTIONS | PAYMENTFUNNELSTAGE                   |
--------------------------------------------------------
| 12            | Complete                             |
| 1             | Payment Processing Error with Vendor |
| 1             | Payment Submitted                    |
| 1             | Payment Success                      |
| 2             | PaymentEntered                       |
| 7             | PaymentWidgetOpened                  |
| 1             | User Error with Payment Submission   |
| 3             | User did not start payment process   |
--------------------------------------------------------
