-- Question 1: Write an SQL query to retrieve warehouse id, city, and count of orders shipped from this warehouse. The query should show all warehouses even if there are no orders that have been shipped from this warehouse.
SELECT w.warehouse_id,
    w.warehouse_city,
    COUNT(s.order_id) as order_count
FROM warehouse as w
    LEFT OUTER JOIN shipment as s ON w.warehouse_id = s.warehouse_id
GROUP BY w.warehouse_id,
    w.warehouse_city;
-- Question 2: Write a SQL query to retrieve customer name, count of orders for each customer even if the customer didn’t make any orders.
SELECT c.customer_name,
    COUNT(o.order_id) as order_count
FROM customer as c
    LEFT OUTER JOIN `order` as o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
-- Question 3: Write a SQL query to retrieve all items who haven’t been ordered.
SELECT i.item_id
FROM item as i
WHERE i.item_id NOT IN (
        SELECT item_id
        FROM order_item
    );