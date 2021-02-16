# 1511. Customer Order Frequency (EASY)
WITH CTE AS (
    SELECT order_id, Orders.customer_id, name, Orders.product_id, price,
    order_date, quantity, 
    SUM(CASE WHEN order_date BETWEEN '2020-06-01' AND '2020-06-30' THEN price * quantity ELSE 0 END) OVER (PARTITION BY customer_id) AS june,
    SUM(CASE WHEN order_date BETWEEN '2020-07-01' AND '2020-07-31' THEN price * quantity ELSE 0 END) OVER (PARTITION BY customer_id) AS july
    FROM 
    Orders LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id
    LEFT JOIN Product ON Orders.product_id = Product.product_id
)

SELECT DISTINCT customer_id, name FROM CTE
WHERE june >= 100 AND july >= 100