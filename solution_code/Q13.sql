-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH cte AS (
    SELECT 
        pt.name, 
        pt.category, 
        ROUND(SUM(od.quantity * p.price)::NUMERIC, 2) AS revenue
    FROM 
        pizza_types pt
    JOIN 
        pizzas p 
        ON p.pizza_type_id = pt.pizza_type_id
    JOIN 
        order_details od 
        ON od.pizza_id = p.pizza_id
    GROUP BY 
        pt.name, pt.category
)

SELECT name, category,revenue
FROM (
    SELECT 
        name, 
        category, 
        revenue, 
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS ranks
    FROM 
        cte
) AS sub
WHERE 
    ranks <= 3;