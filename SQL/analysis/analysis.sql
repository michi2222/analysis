
-- Total sales value: 2275932.66
SELECT SUM(unit_price * quantity) AS total_sales
FROM sqlprojekt.order_items;

-- Unique Customers Count: 300
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM sqlprojekt.orders;

-- Average Order Value: 3,104.96
SELECT ROUND(AVG(quantity * unit_price), 2) AS average_order_value
FROM sqlprojekt.order_items;

-- Completed Orders Count: 95
SELECT COUNT(*) AS completed_orders
FROM sqlprojekt.orders
WHERE status = 'Completed';

-- Top Selling Product: Laptop Model 616
SELECT o.product_id, pp.product_name, COUNT(o.quantity) AS total_sold
FROM sqlprojekt.order_items o
JOIN sqlprojekt.products pp ON o.product_id = pp.product_id
GROUP BY o.product_id, pp.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- Top Selling Category: Laptop – 216 pieces
SELECT pp.category, COUNT(o.quantity) AS total_sold
FROM sqlprojekt.order_items o
JOIN sqlprojekt.products pp ON o.product_id = pp.product_id
GROUP BY pp.category
ORDER BY total_sold DESC
LIMIT 1;

-- Highest Average Product Price: "Laptop Model 915" – 1,985.06
SELECT pp.product_name, ROUND(AVG(o.unit_price), 2) AS avg_price
FROM sqlprojekt.order_items o
JOIN sqlprojekt.products pp ON o.product_id = pp.product_id
GROUP BY pp.product_name
ORDER BY avg_price DESC
LIMIT 1;

-- Income by Region: Highest = East - 557,315.80
SELECT 
    SUM(oo.quantity * oo.unit_price) AS total_income, 
    cc.region 
FROM sqlprojekt.order_items oo
JOIN sqlprojekt.orders o ON o.order_id = oo.order_id
JOIN sqlprojekt.customers cc ON o.customer_id = cc.customer_id
GROUP BY cc.region
ORDER BY total_income DESC;

-- Customer Rank by Sales: Top Client - Stephanie Herman
SELECT 
    cc.customer_name, 
    SUM(oo.quantity * oo.unit_price) AS total_spent
FROM sqlprojekt.order_items oo
JOIN sqlprojekt.orders o ON o.order_id = oo.order_id
JOIN sqlprojekt.customers cc ON o.customer_id = cc.customer_id
GROUP BY cc.customer_name
ORDER BY total_spent DESC;

-- Client Grouping by Total Order Value
SELECT 
    cc.customer_name, 
    SUM(oo.quantity * oo.unit_price) AS total_spent,
    CASE 
        WHEN SUM(oo.quantity * oo.unit_price) > 35000 THEN 'high'
        WHEN SUM(oo.quantity * oo.unit_price) BETWEEN 15000 AND 35000 THEN 'avg'
        ELSE 'low'
    END AS customer_spending_category
FROM sqlprojekt.order_items oo
JOIN sqlprojekt.orders o ON o.order_id = oo.order_id
JOIN sqlprojekt.customers cc ON o.customer_id = cc.customer_id
GROUP BY cc.customer_name
ORDER BY total_spent DESC;

-- Best Sales by Month (Numeric) - Best Month: June
SELECT 
    SUM(oo.quantity * oo.unit_price) AS total_sales, 
    EXTRACT(MONTH FROM o.order_date) AS month_number
FROM sqlprojekt.order_items oo
JOIN sqlprojekt.orders o ON oo.order_id = o.order_id
GROUP BY month_number
ORDER BY month_number;

-- Best Sales by Month (Text Names) - Best Month: June
SELECT 
    SUM(oo.quantity * oo.unit_price) AS total_sales, 
    TO_CHAR(o.order_date, 'Month') AS month_name
FROM sqlprojekt.order_items oo
JOIN sqlprojekt.orders o ON oo.order_id = o.order_id
GROUP BY month_name
ORDER BY total_sales DESC;

-- Top Product by Region:
-- Central - Keyboard Model 197
-- East - Keyboard Model 417
-- North - Laptop Model 915
-- South - Monitor Model 354
-- West - Laptop Model 468
SELECT region, product_name, total_sales
FROM (
    SELECT 
        c.region,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY c.region ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS rn
    FROM sqlprojekt.order_items oi
    JOIN sqlprojekt.orders o ON oi.order_id = o.order_id
    JOIN sqlprojekt.customers c ON o.customer_id = c.customer_id
    JOIN sqlprojekt.products p ON oi.product_id = p.product_id
    GROUP BY c.region, p.product_name
) sub
WHERE rn = 1;

-- Average Items per Order: 2.4
SELECT ROUND(AVG(items_per_order), 1) AS average_items_per_order
FROM (
    SELECT order_id, COUNT(*) AS items_per_order
    FROM sqlprojekt.order_items
    GROUP BY order_id
) subquery;
