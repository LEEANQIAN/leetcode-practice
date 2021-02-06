# 1393. Capital Gain/Loss (Medium)
SELECT stock_name, (sell_total-buy_total) AS capital_gain_loss FROM
(SELECT *, SUM(CASE WHEN operation = 'Buy' THEN price ELSE 0 END) AS buy_total,
SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) AS sell_total
FROM Stocks
GROUP BY stock_name) AS T