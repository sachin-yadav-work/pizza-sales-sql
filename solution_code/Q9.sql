-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    FLOOR(AVG(quantity)) AS avg_pizzas_per_day
FROM (
    SELECT 
        o.date, 
        SUM(od.quantity) AS quantity
    FROM 
        orders o
    JOIN 
        order_details od 
        ON o.order_id = od.order_id
    GROUP BY 
        o.date
    ORDER BY 
        o.date
) AS sub1;

