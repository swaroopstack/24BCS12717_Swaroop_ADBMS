-- Easy
SELECT transaction_date,user_id,COUNT(product_id) AS purchase_count
FROM user_transactions
WHERE (user_id,transaction_date) IN
(
SELECT user_id,MAX(transaction_date)
FROM user_transactions
GROUP BY user_id
)
GROUP BY transaction_date,user_id
ORDER BY transaction_date;

-- Medium
SELECT sender_id,COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)=8
AND EXTRACT(YEAR FROM sent_date)=2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

-- Hard
SELECT p.product_family,
COALESCE(SUM(s.units_sold),0) AS total_units_sold,
COALESCE(ROUND(100.0*SUM(CASE WHEN sp.promotion_id IS NOT NULL THEN s.units_sold ELSE 0 END)/NULLIF(SUM(s.units_sold),0),2),0) AS promotion_percentage
FROM facebook_products p
LEFT JOIN facebook_sales s
ON p.product_id=s.product_id
LEFT JOIN facebook_sales_promotions sp
ON s.promotion_id=sp.promotion_id
GROUP BY p.product_family;