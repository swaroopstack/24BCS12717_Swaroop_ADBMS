-- Easy
SELECT ROUND(
COUNT(DISTINCT CASE WHEN signup_action='Confirmed' THEN e.email_id END)*1.0
/
COUNT(DISTINCT e.email_id),2
) AS confirm_rate
FROM emails e
LEFT JOIN texts t
ON e.email_id=t.email_id;

-- Medium
WITH weeks AS
(
SELECT DISTINCT contact_id,
DATE_TRUNC('week',event_date) AS week_date
FROM marketing_touches
),
streaks AS
(
SELECT contact_id,
week_date,
DATEADD(week,-ROW_NUMBER() OVER(PARTITION BY contact_id ORDER BY week_date),week_date) AS grp
FROM weeks
),
valid_contacts AS
(
SELECT contact_id
FROM streaks
GROUP BY contact_id,grp
HAVING COUNT(*)>=3
)
SELECT c.email
FROM crm_contacts c
WHERE c.contact_id IN
(
SELECT contact_id
FROM valid_contacts
INTERSECT
SELECT contact_id
FROM marketing_touches
WHERE event_type='trial_request'
);

-- Hard
SELECT p.promotion_id,
ROUND(100.0*SUM(CASE WHEN o.date_sold=p.start_date THEN 1 ELSE 0 END)/COUNT(o.promotion_id),2) AS first_day_percentage,
ROUND(100.0*SUM(CASE WHEN o.date_sold=p.end_date THEN 1 ELSE 0 END)/COUNT(o.promotion_id),2) AS last_day_percentage
FROM online_sales_promotions p
JOIN online_orders o
ON p.promotion_id=o.promotion_id
GROUP BY p.promotion_id;