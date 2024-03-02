-- creating the database
CREATE DATABASE library;
-- specifying the database
USE library;
-- foreign keys will be added later
CREATE TABLE book(
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title varchar(50) NOT NULL,
    price FLOAT NOT NULL,
    pub_id INT NOT NULL,
    category_id INT NOT NULL
);
-- create the other tables
CREATE TABLE category(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL
);
CREATE TABLE publisher(
    pub_id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL
);
CREATE TABLE member(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    join_date TIMESTAMP DEFAULT NOW() NOT NULL
);
CREATE TABLE borrowing_book(
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date TIMESTAMP DEFAULT NOW() NOT NULL,
    due_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP,
    PRIMARY KEY (member_id, book_id, borrow_date)
);
-- adding book foreign keys
ALTER TABLE book
ADD CONSTRAINT fk_pub_id FOREIGN KEY (pub_id) REFERENCES publisher(pub_id),
    ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);
-- adding borrowing_book foreign keys
ALTER TABLE borrowing_book
ADD CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id),
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES book(book_id);