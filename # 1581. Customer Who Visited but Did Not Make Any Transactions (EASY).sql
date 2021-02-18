# 1581. Customer Who Visited but Did Not Make Any Transactions (EASY)
SELECT customer_id, 
SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS count_no_trans
FROM 
Visits LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
GROUP BY customer_id
HAVING count_no_trans > 0