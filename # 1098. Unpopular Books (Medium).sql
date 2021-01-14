# 1098. Unpopular Books (Medium)
SELECT Books.book_id, name
FROM Books LEFT JOIN Orders ON Orders.book_id = Books.book_id
WHERE available_from < '2019-05-23'
GROUP BY Books.book_id
HAVING SUM(CASE WHEN dispatch_date < '2018-06-23' OR dispatch_date IS NULL THEN 0 ELSE quantity END) < 10