# 183. Customers Who Never Order (Easy)
SELECT Name AS Customers FROM Customers LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
WHERE CustomerId IS NULL