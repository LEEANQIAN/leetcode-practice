# 1571. Warehouse Manager (EASY)
SELECT name AS warehouse_name, SUM(units*Width*Length*Height) AS volume FROM 
Warehouse LEFT JOIN Products ON Warehouse.product_id = Products.product_id
GROUP BY warehouse_name