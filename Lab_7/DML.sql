-- Question 1: Write an SQL query to retrieve names of customers whose name starts with ‘Ma’
SELECT customer_name
FROM customer
WHERE customer_name LIKE 'Ma%';
-- Question 2: Write an SQL query to retrieve count of items and total price of each order
SELECT COUNT(item_id),
    sum(quantity * unit_price)
FROM (
        order_item
        NATURAL JOIN item
    )
GROUP BY order_id;
-- Question 3: Write an SQL query to retrieve order number for each order that had been shipped from warehouse in ‘Arica’
SELECT order_id
FROM(
        shipment
        NATURAL join warehouse
    )
where warehouse_city = 'Arica';
-- Question 4: Write an SQL query to retrieve total price of orders that had been shipped from warehouse #8.
SELECT sum(quantity * unit_price)
FROM(
        shipment
        NATURAL JOIN order_item
        NATURAL join item
    )
WHERE warehouse_id = 8;