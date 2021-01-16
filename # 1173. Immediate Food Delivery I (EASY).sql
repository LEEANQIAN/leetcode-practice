# 1173. Immediate Food Delivery I (EASY)
SELECT ROUND(AVG(immediate)*100,2) AS immediate_percentage FROM
(SELECT *, 
CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END AS immediate
FROM Delivery) AS T