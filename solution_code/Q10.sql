-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    ROUND(SUM(p.price * od.quantity)::NUMERIC, 2) AS revenue, 
    pt.name AS pizza_type
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
    revenue DESC
LIMIT 3;

