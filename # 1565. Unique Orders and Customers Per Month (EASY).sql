# 1565. Unique Orders and Customers Per Month (EASY)
SELECT month, COUNT(DISTINCT order_id) AS order_count, 
COUNT(DISTINCT customer_id) AS customer_count 
FROM
(SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, order_id, customer_id
FROM Orders WHERE invoice > 20) AS T
GROUP BY month