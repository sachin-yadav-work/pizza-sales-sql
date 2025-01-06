-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category AS pizza_category, 
    SUM(od.quantity) AS total_quantity
FROM 
    pizza_types pt
JOIN 
    pizzas p 
    ON p.pizza_type_id = pt.pizza_type_id
JOIN 
    order_details od 
    ON od.pizza_id = p.pizza_id
GROUP BY 
    pt.category
ORDER BY 
    total_quantity DESC;

	