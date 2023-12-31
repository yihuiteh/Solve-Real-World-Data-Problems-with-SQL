-- SQL request(s)​​​​​​‌​‌​​‌​‌‌‌​​‌‌‌​‌‌​​‌‌​​​ below
-- Pivoting rows into aggregated columns with CASE
-- Business problem : Tracking user activity with FrontEnd events
SELECT USERID, SUM(CASE WHEN FrontEndEventLog.EVENTID =1 THEN 1 ELSE 0 END) AS ViewedHelpCenterPage,
SUM(CASE WHEN FrontEndEventLog.EVENTID =2 THEN 1 ELSE 0 END) AS ClickedFAQs,
SUM(CASE WHEN FrontEndEventLog.EVENTID =3 THEN 1 ELSE 0 END) ClickedContactSupport,
SUM(CASE WHEN FrontEndEventLog.EVENTID =4 THEN 1 ELSE 0 END) SubmittedTicket
From FrontEndEventLog
JOIN FrontendEventdefinitions
ON FrontEndEventLog.EventID = FrontendEventdefinitions.EventID
WHERE FrontendEventdefinitions.EVENTTYPE = 'Customer Support'
GROUP BY USERID

--Correct output
--2 rows
-----------------------------------------------------------------------------------------
| USERID | VIEWEDHELPCENTERPAGE | CLICKEDFAQS | CLICKEDCONTACTSUPPORT | SUBMITTEDTICKET |
-----------------------------------------------------------------------------------------
| U172   | 1                    | 0           | 1                     | 1               |
| U837   | 4                    | 1           | 2                     | 2               |
-----------------------------------------------------------------------------------------
