# 1327. List the Products Ordered in a Period (EASY)

SELECT product_name, unit
FROM
(SELECT product_name, SUM(unit) AS unit
FROM Orders AS O LEFT JOIN Products AS P ON
O.product_id = P.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY O.product_id) AS T
WHERE unit >= 100
