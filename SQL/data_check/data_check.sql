SELECT 
  COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
  COUNT(*) FILTER (WHERE customer_name IS NULL) AS null_customer_name,
  COUNT(*) FILTER (WHERE region IS NULL) AS null_region,
  COUNT(*) FILTER (WHERE registration_date IS NULL) AS null_registration_date
FROM sqlprojekt.customers;


SELECT 
  COUNT(*) FILTER (WHERE product_id IS NULL) AS null_product_id,
  COUNT(*) FILTER (WHERE product_name IS NULL) AS null_product_name,
  COUNT(*) FILTER (WHERE category IS NULL) AS null_category,
  COUNT(*) FILTER (WHERE unit_price IS NULL) AS null_price
FROM sqlprojekt.products;




SELECT 
  COUNT(*) FILTER (WHERE order_item_id IS NULL) AS null_order_item_id,
  COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
  COUNT(*) FILTER (WHERE product_id IS NULL) AS null_product,
  COUNT(*) FILTER (WHERE quantity IS NULL) AS null_quantity,
  COUNT(*) FILTER (WHERE unit_price IS NULL) AS null_unit
FROM sqlprojekt.order_items;


SELECT 
  COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
  COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
  COUNT(*) FILTER (WHERE order_date IS NULL) AS null_date,
  COUNT(*) FILTER (WHERE status IS NULL) AS null_status
FROM sqlprojekt.orders;



SELECT customer_id, COUNT(*) 
FROM sqlprojekt.customers 
GROUP BY customer_id 
HAVING COUNT(*) > 1;



SELECT order_id, COUNT(*) 
FROM sqlprojekt.orders 
GROUP BY order_id 
HAVING COUNT(*) > 1;



SELECT order_item_id, COUNT(*) 
FROM sqlprojekt.order_items 
GROUP BY order_item_id 
HAVING COUNT(*) > 1;
