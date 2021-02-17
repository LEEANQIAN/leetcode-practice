# 1532. The Most Recent Three Orders (Medium)
WITH CTE AS (
    SELECT name AS customer_name, Orders.customer_id, order_id, order_date,
    RANK() OVER 
    (PARTITION BY Orders.customer_id ORDER BY order_date DESC) AS order_rank
    FROM Orders LEFT JOIN Customers
    ON Orders.customer_id = Customers.customer_id
)
SELECT customer_name, customer_id, order_id, order_date FROM CTE
WHERE order_rank <= 3
ORDER BY customer_name, customer_id, order_date DESC