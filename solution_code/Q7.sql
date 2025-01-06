-- Determine the distribution of orders by hour of the day.

SELECT 
    EXTRACT(HOUR FROM time) AS hour, 
    COUNT(order_id) AS total_orders
FROM 
    orders
GROUP BY 
    EXTRACT(HOUR FROM time)
ORDER BY 
    hour;















