-- SQL request(s)​​​​​​‌​‌​​‌​‌‌‌‌‌​​​​​​​​​​‌‌‌ below
SELECT statusmovementid, subscriptionid, statusid, movementdate, 
LEAD(movementdate,1) OVER (ORDER BY movementdate)  AS nextstatusmovementdate, 
LEAD(movementdate,1) OVER (ORDER BY movementdate) - movementdate AS TIMEINSTATUS
FROM paymentstatuslog
WHERE subscriptionid = 38844;

--Correct output
8 rows
---------------------------------------------------------------------------------------------------------------------------------------
| STATUSMOVEMENTID | SUBSCRIPTIONID | STATUSID | MOVEMENTDATE          | NEXTSTATUSMOVEMENTDATE | TIMEINSTATUS                        |
---------------------------------------------------------------------------------------------------------------------------------------
| 39112775         | 38844          | 1        | 2023-12-02 02:33:13.0 | 2023-12-02 02:33:22.0  | INTERVAL '0 00:00:09' DAY TO SECOND |
| 13223956         | 38844          | 2        | 2023-12-02 02:33:22.0 | 2023-12-02 02:33:29.0  | INTERVAL '0 00:00:07' DAY TO SECOND |
| 53176031         | 38844          | 3        | 2023-12-02 02:33:29.0 | 2023-12-02 02:33:31.0  | INTERVAL '0 00:00:02' DAY TO SECOND |
| 1694206          | 38844          | 0        | 2023-12-02 02:33:31.0 | 2023-12-02 02:33:46.0  | INTERVAL '0 00:00:15' DAY TO SECOND |
| 59634923         | 38844          | 2        | 2023-12-02 02:33:46.0 | 2023-12-02 02:33:51.0  | INTERVAL '0 00:00:05' DAY TO SECOND |
| 31401200         | 38844          | 3        | 2023-12-02 02:33:51.0 | 2023-12-02 02:33:53.0  | INTERVAL '0 00:00:02' DAY TO SECOND |
| 94425726         | 38844          | 4        | 2023-12-02 02:33:53.0 | 2023-12-02 02:33:55.0  | INTERVAL '0 00:00:02' DAY TO SECOND |
| 78460513         | 38844          | 5        | 2023-12-02 02:33:55.0 | null                   | null                                |
---------------------------------------------------------------------------------------------------------------------------------------
