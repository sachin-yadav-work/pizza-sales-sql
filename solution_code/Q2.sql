-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(
        CAST(SUM(od.quantity * p.price) AS NUMERIC), 2
    ) AS total_revenue
FROM 
    pizzas p
JOIN 
    order_details od 
    ON p.pizza_id = od.pizza_id;