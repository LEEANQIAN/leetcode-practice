# 1322. Ads Performance (EASY)
WITH CTE AS (
    SELECT DISTINCT ad_id, 
    SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) 
    OVER (PARTITION BY ad_id) AS click,
    SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) 
    OVER (PARTITION BY ad_id) AS view
    FROM Ads
)

SELECT ad_id, ROUND(IFNULL(click / (click + view),0)*100,2) AS ctr
FROM CTE
ORDER BY ctr DESC, ad_id