CREATE SCHEMA order_processing_system;
USE order_processing_system;
CREATE TABLE customer(
    customer_id INT AUTO_INCREMENT NOT NULL,
    customer_name varchar(50) NOT NULL,
    city varchar(20) NOT NULL,
    PRIMARY KEY(customer_id)
);
CREATE TABLE `order`(
    order_id INT AUTO_INCREMENT,
    order_date TIMESTAMP DEFAULT NOW() NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY(order_id)
);
CREATE TABLE order_item(
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(item_id, order_id)
);
CREATE TABLE item(
    item_id INT AUTO_INCREMENT NOT NULL,
    unit_price INT NOT NULL,
    PRIMARY KEY(item_id)
);
CREATE TABLE shipment(
    order_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    ship_date TIMESTAMP NOT NULL,
    PRIMARY KEY(order_id, warehouse_id)
);
CREATE TABLE warehouse(
    warehouse_id INT AUTO_INCREMENT NOT NULL,
    warehouse_city varchar(20) NOT NULL,
    PRIMARY KEY (warehouse_id)
);
ALTER TABLE `order`
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE order_item
ADD CONSTRAINT fk_order_id_item FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES item(item_id);
ALTER TABLE shipment
ADD CONSTRAINT fk_order_id_shipment FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    ADD CONSTRAINT fk_warehouse_id FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id);