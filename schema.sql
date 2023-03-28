SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS e_shopping;
USE e_shopping;

-- Create a Schema for an Online Shopping Database
CREATE SCHEMA IF NOT EXISTS e_shopping;

-- Create tables
CREATE TABLE IF NOT EXISTS e_shopping.customers (
    customer_ID INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_ID)
);

CREATE TABLE IF NOT EXISTS e_shopping.products (
    product_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    quantity INT NOT NULL,
    picture_url VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_ID)
);

CREATE TABLE IF NOT EXISTS e_shopping.orders (
    order_ID INT NOT NULL AUTO_INCREMENT,
    customer_ID INT NOT NULL,
    product_ID INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATETIME NOT NULL,
    PRIMARY KEY (order_ID),
    FOREIGN KEY (customer_ID) REFERENCES e_shopping.customers (customer_ID),
    FOREIGN KEY (product_ID) REFERENCES e_shopping.products (product_ID)
);

CREATE TABLE IF NOT EXISTS e_shopping.shipping_details (
    shipping_details_ID INT NOT NULL AUTO_INCREMENT,
    order_ID INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY (shipping_details_ID),
    FOREIGN KEY (order_ID) REFERENCES e_shopping.orders (order_ID)
);

CREATE TABLE IF NOT EXISTS e_shopping.cart (
    cart_ID INT NOT NULL AUTO_INCREMENT,
    customer_ID INT NOT NULL,
    product_ID INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (cart_ID),
    FOREIGN KEY (customer_ID) REFERENCES e_shopping.customers (customer_ID),
    FOREIGN KEY (product_ID) REFERENCES e_shopping.products (product_ID)
);

CREATE TABLE IF NOT EXISTS e_shopping.payment (
    payment_ID INT NOT NULL AUTO_INCREMENT,
    order_ID INT NOT NULL,
    method VARCHAR(255) NOT NULL,
    PRIMARY KEY (payment_ID),
    FOREIGN KEY (order_ID) REFERENCES e_shopping.orders (order_ID)
);


SHOW TABLES;