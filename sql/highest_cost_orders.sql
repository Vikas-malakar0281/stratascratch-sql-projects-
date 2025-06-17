-- Problem: Highest Cost Orders (StrataScratch)
-- Goal: Find the customer with the highest total daily order cost between 2019-02-01 and 2019-05-01

SELECT 
    c.first_name,
    ROUND(SUM(o.total_order_cost)) AS total_cost,
    o.order_date
FROM 
    customers c
JOIN 
    orders o ON c.id = o.cust_id
WHERE 
    o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY 
    c.first_name, o.order_date
ORDER BY 
    total_cost DESC
LIMIT 1;
