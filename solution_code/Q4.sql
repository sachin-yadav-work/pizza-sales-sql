-- Identify the most common pizza size ordered.

SELECT 
    p.size AS pizza_size, 
    SUM(quantity) AS total_quantity
FROM 
    pizzas p
JOIN 
    order_details od 
    ON od.pizza_id = p.pizza_id
GROUP BY 
    p.size
ORDER BY 
    total_quantity DESC;

	