-- Calculate the percentage contribution of each pizza type to total revenue.

WITH total_revenue AS (
    SELECT 
        SUM(p.price * od.quantity) AS total_revenue
    FROM 
        pizzas p
    JOIN 
        order_details od 
        ON p.pizza_id = od.pizza_id
)

SELECT 
    pt.name AS pizza_type, 
    ROUND(
        (SUM(p.price * od.quantity) * 100 / (SELECT total_revenue FROM total_revenue))::NUMERIC, 3
    ) AS percent_contribution
FROM 
    order_details od
JOIN 
    pizzas p 
    ON p.pizza_id = od.pizza_id
JOIN 
    pizza_types pt 
    ON pt.pizza_type_id = p.pizza_type_id
GROUP BY 
    pt.name
ORDER BY 
    percent_contribution DESC;
