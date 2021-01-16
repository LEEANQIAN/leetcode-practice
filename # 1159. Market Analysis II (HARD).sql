# 1159. Market Analysis II (HARD)
WITH CTE AS(
    SELECT Orders.order_id, order_date, Orders.item_id, item_brand, seller_id,
    favorite_brand, 
    ROW_NUMBER() OVER (PARTITION BY seller_id ORDER BY order_date) AS rnk
    FROM Orders LEFT JOIN Users ON Orders.seller_id = Users.user_id
    LEFT JOIN Items ON Orders.item_id = Items.item_id
)

SELECT user_id AS seller_id, CASE WHEN SUM(2nd_item_fav_brand_num) = 1 THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand FROM
(SELECT user_id, CASE WHEN rnk = 2 AND item_brand = CTE.favorite_brand THEN 1 ELSE 0 END AS 2nd_item_fav_brand_num
FROM Users LEFT JOIN CTE ON Users.user_id = CTE.seller_id) AS T
GROUP BY user_id