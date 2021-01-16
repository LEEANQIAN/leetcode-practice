# 1205. Monthly Transactions II (Medium)
WITH CTE AS (
    SELECT C.trans_id, country, "chargeback" AS state, T.amount, C.trans_date
    FROM 
    Chargebacks AS C INNER JOIN Transactions T ON T.id = C.trans_id
    UNION (SELECT * FROM Transactions)
)

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount,
SUM(CASE WHEN state = "chargeback" THEN 1 ELSE 0 END) AS chargeback_count, SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM CTE
GROUP BY month,country
HAVING approved_count <> 0 OR chargeback_count <> 0