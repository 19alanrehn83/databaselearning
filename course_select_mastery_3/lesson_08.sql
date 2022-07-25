/*
Lesson 08 - simplify with subquery
*/

SELECT
company_name,
total_order_value,
num_orders,
average_order_value
FROM (
    SELECT TOP 5
    c.company_name,
    ROUND(SUM(s.order_value * cc.conversion_rate), 2) AS total_order_value,
    COUNT(*) AS num_orders,
    ROUND(AVG(s.order_value * cc.conversion_rate), 2) AS average_order_value
    FROM company c
    INNER JOIN person p ON c.company_id = p.company_id
    INNER JOIN sales_order s ON p.person_id = s.person_id
    INNER JOIN currency_convert cc ON cc.from_currency = 'USD'
    WHERE cc.to_currency = 'GBP'
    GROUP BY c.company_name
) AS sub
ORDER BY total_order_value DESC;
