# 1174. Immediate Food Delivery II (Medium)
SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*100,2) AS immediate_percentage
FROM
(SELECT *, MIN(order_date) OVER (PARTITION BY customer_id) AS first_order_date 
FROM Delivery) AS T
WHERE order_date = first_order_date