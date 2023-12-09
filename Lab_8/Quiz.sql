-- Write SQL query to retrieve order_id,customer_city, and warehouse_city which is placed in a specific city and shipped from a specific city.
SELECT o.order_id,
    c.city AS customer_city,
    w.warehouse_city
FROM `order` as o
    JOIN customer as c ON o.customer_id = c.customer_id
    JOIN shipment as s ON o.order_id = s.order_id
    JOIN warehouse as w ON s.warehouse_id = w.warehouse_id
WHERE c.city != w.warehouse_city;