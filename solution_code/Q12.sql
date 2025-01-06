-- Analyze the cumulative revenue generated over time.

WITH cte AS (
    SELECT 
        o.date, 
        ROUND(SUM(p.price * od.quantity)::NUMERIC, 2) AS total_rev_per_day
    FROM 
        orders o
    JOIN 
        order_details od 
        ON od.order_id = o.order_id
    JOIN 
        pizzas p 
        ON p.pizza_id = od.pizza_id
    GROUP BY 
        o.date
)

SELECT 
    date, 
    SUM(total_rev_per_day) OVER (ORDER BY date) AS cumulative_revenue
FROM 
    cte;