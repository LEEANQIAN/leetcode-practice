# 1587. Bank Account Summary II (EASY)
SELECT name, SUM(amount) AS balance FROM
Transactions LEFT JOIN Users ON Transactions.account = Users.account
GROUP BY Transactions.account
HAVING balance > 10000