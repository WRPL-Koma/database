-- Stored Procedure to Add an Item to Cart
DELIMITER //
CREATE PROCEDURE add_item_to_cart(IN customer_ID INT, IN product_ID INT, IN quantity INT)
BEGIN
    INSERT INTO vercel_commerce.cart (customer_ID, product_ID, quantity)
    VALUES (customer_ID, product_ID, quantity);
END //
DELIMITER ;

-- Stored Procedure to Update an Item in Cart
DELIMITER //
CREATE PROCEDURE update_item_in_cart(IN customer_ID INT, IN product_ID INT, IN quantity INT)
BEGIN
    UPDATE vercel_commerce.cart
    SET quantity = quantity + quantity
    WHERE customer_ID = customer_ID AND product_ID = product_ID;
END //
DELIMITER ;

-- Stored Procedure to Delete an Item from Cart
DELIMITER //
CREATE PROCEDURE delete_item_from_cart(IN customer_ID INT, IN product_ID INT)
BEGIN
    DELETE FROM vercel_commerce.cart
    WHERE customer_ID = customer_ID AND product_ID = product_ID;
END //
DELIMITER ;

-- Stored Procedure to Add Shipping Details for an Order
DELIMITER //
CREATE PROCEDURE add_shipping_details(IN order_ID INT, IN address VARCHAR(255), IN city VARCHAR(255), IN country VARCHAR(255))
BEGIN
    INSERT INTO vercel_commerce.shipping_details (order_ID, address, city, country)
    VALUES (order_ID, address, city, country);
END //
DELIMITER ;

-- Stored Procedure to Add Payment Details for an Order
DELIMITER //
CREATE PROCEDURE add_payment_details(IN order_ID INT, IN method VARCHAR(255))
BEGIN
    INSERT INTO vercel_commerce.payment (order_ID, method)
    VALUES (order_ID, method);
END //
DELIMITER ;