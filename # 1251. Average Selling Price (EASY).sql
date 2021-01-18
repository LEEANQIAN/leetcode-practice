# 1251. Average Selling Price (EASY)
WITH CTE AS (
    SELECT P.product_id, price*units AS total_price,
    SUM(IFNULL(units,0)) OVER (PARTITION BY P.product_id) AS total_units
    FROM Prices AS P LEFT JOIN UnitsSold AS U ON P.product_id = U.product_id 
    AND purchase_date BETWEEN start_date AND end_date
)

SELECT product_id, 
ROUND(IFNULL(total_price / total_units,0),2) AS average_price
FROM
(SELECT product_id, IFNULL(SUM(total_price),0) AS total_price, total_units
FROM CTE GROUP BY product_id) AS T