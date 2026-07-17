-- Easy
SELECT customer_id,total_purchase_value,rank
FROM
(
SELECT customer_id,total_purchase_value,
DENSE_RANK() OVER(ORDER BY total_purchase_value DESC) AS rank
FROM customer_purchase
) AS temp
WHERE rank<=5;

-- Medium
SELECT user_id,
tweet_date,
ROUND(
AVG(tweet_count) OVER(
PARTITION BY user_id
ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
),2
) AS rolling_avg_3d
FROM tweets;

--Hard
SELECT COUNT(*) AS payment_count
FROM (
SELECT *,
LAG(transaction_timestamp) OVER(PARTITION BY merchant_id,credit_card_id,amount ORDER BY transaction_timestamp) AS prev_time
FROM transactions
) t
WHERE transaction_timestamp<=prev_time+INTERVAL '10 minutes';