-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name AS pizza_type, 
    SUM(od.quantity) AS total_quantities
FROM 
    order_details od
JOIN 
    pizzas p 
    ON p.pizza_id = od.pizza_id
JOIN 
    pizza_types pt 
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY 
    pt.name
ORDER BY 
    total_quantities DESC
LIMIT 5;
