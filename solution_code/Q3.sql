-- Identify the highest-priced pizza.

SELECT 
    pt.name, 
    p.price AS max_price
FROM 
    pizzas p
JOIN 
    pizza_types pt 
    ON pt.pizza_type_id = p.pizza_type_id
ORDER BY 
    max_price DESC
LIMIT 1;

