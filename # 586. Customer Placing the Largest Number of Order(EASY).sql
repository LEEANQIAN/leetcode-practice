# 586. Customer Placing the Largest Number of Orders (EASY)
SELECT customer_number FROM orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1