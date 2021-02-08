# 1454. Active Users (Medium)
SELECT DISTINCT Logins.id, name
FROM Logins JOIN Accounts ON Logins.id = Accounts.id
LEFT JOIN Logins AS L ON Logins.id = L.id and 
DATEDIFF(L.login_date, Logins.login_date) BETWEEN 1 and 4
GROUP BY Logins.id,Logins.login_date
HAVING COUNT(DISTINCT L.login_date) = 4
ORDER BY L.id