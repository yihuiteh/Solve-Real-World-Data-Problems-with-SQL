-- SQL request(s)​​​​​​‌​‌​​‌​‌‌​‌​​‌​‌​‌‌‌‌‌​‌​ below
WITH clicks_per_user AS (
    SELECT USERID, COUNT(EVENTID) AS num_link_clicks
    FROM FrontendEventLog
    WHERE EVENTID = 5
    GROUP BY USERID
)
SELECT num_link_clicks, COUNT(UserID) AS num_users
FROM clicks_per_user
GROUP BY num_link_clicks

--Correct output
--3 rows
-------------------------------
| NUM_LINK_CLICKS | NUM_USERS |
-------------------------------
| 1               | 3         |
| 2               | 2         |
| 3               | 1         |
-------------------------------
