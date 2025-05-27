-- =========================
-- SIMPLE CRUD OPERATIONS FOR E-COMMERCE DATABASE
-- =========================

-- =========================
-- USERS TABLE CRUD
-- =========================

-- CREATE (INSERT) USER
INSERT INTO users (first_name, last_name, email, password, phone, user_type, created_at)
VALUES ('Ali', 'Ahmed', 'ali.ahmed@gmail.com', 'hashed_password', '+92-300-1234567', 'customer', NOW());

-- SELECT (READ) USERS
-- Get all users
SELECT * FROM users;

-- Get user by ID
SELECT * FROM users WHERE user_id = 1;

-- Get users by type
SELECT * FROM users WHERE user_type = 'customer';

-- Get user with customer details
SELECT u.*, c.loyalty_points 
FROM users u 
JOIN customer c ON u.user_id = c.customer_id 
WHERE u.user_id = 1;

-- UPDATE USER
UPDATE users 
SET first_name = 'Updated Name', 
    phone = '+92-300-9999999',
    updated_at = NOW()
WHERE user_id = 1;

-- DELETE USER (soft delete)
UPDATE users SET is_active = FALSE WHERE user_id = 1;

-- DELETE USER (hard delete)
DELETE FROM users WHERE user_id = 1;

-- =========================
-- PRODUCTS TABLE CRUD
-- =========================

-- CREATE (INSERT) PRODUCT
INSERT INTO product (product_name, description, base_price, stock_quantity, category_id, created_at, updated_at)
VALUES ('iPhone 15', 'Latest Apple smartphone', 150000.00, 25, 1, NOW(), NOW());

-- SELECT (READ) PRODUCTS
-- Get all products
SELECT * FROM product;

-- Get product by ID
SELECT * FROM product WHERE product_id = 1;

-- Get products by category
SELECT * FROM product WHERE category_id = 1;

-- Get products with category name
SELECT p.*, c.category_name 
FROM product p 
JOIN category c ON p.category_id = c.category_id;

-- Get products by price range
SELECT * FROM product 
WHERE base_price BETWEEN 1000 AND 50000;

-- Search products by name
SELECT * FROM product 
WHERE product_name ILIKE '%phone%';

-- Get products with low stock
SELECT * FROM product WHERE stock_quantity < 10;

-- UPDATE PRODUCT
UPDATE product 
SET base_price = 145000.00, 
    stock_quantity = 30,
    updated_at = NOW()
WHERE product_id = 1;

-- DELETE PRODUCT (soft delete)
UPDATE product SET is_active = FALSE WHERE product_id = 1;

-- DELETE PRODUCT (hard delete)
DELETE FROM product WHERE product_id = 1;

-- =========================
-- ORDERS TABLE CRUD
-- =========================

-- CREATE (INSERT) ORDER
INSERT INTO orders (customer_id, shipping_address_id, billing_address_id, order_date, status, subtotal, shipping_cost, total_amount)
VALUES (1, 1, 1, NOW(), 'pending', 50000.00, 300.00, 50300.00);

-- SELECT (READ) ORDERS
-- Get all orders
SELECT * FROM orders;

-- Get order by ID
SELECT * FROM orders WHERE order_id = 1;

-- Get orders by customer
SELECT * FROM orders WHERE customer_id = 1;

-- Get orders by status
SELECT * FROM orders WHERE status = 'delivered';

-- Get order with customer details
SELECT o.*, u.first_name, u.last_name, u.email
FROM orders o
JOIN users u ON o.customer_id = u.user_id
WHERE o.order_id = 1;

-- Get orders with total items count
SELECT o.*, COUNT(oi.order_item_id) as total_items
FROM orders o
LEFT JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- UPDATE ORDER
UPDATE orders 
SET status = 'shipped',
    updated_at = NOW()
WHERE order_id = 1;

-- DELETE ORDER
DELETE FROM orders WHERE order_id = 1;

-- =========================
-- ORDER ITEMS TABLE CRUD
-- =========================

-- CREATE (INSERT) ORDER ITEM
INSERT INTO order_item (order_id, product_id, variant_id, quantity, unit_price, line_total)
VALUES (1, 1, 1, 2, 25000.00, 50000.00);

-- SELECT (READ) ORDER ITEMS
-- Get all order items for an order
SELECT * FROM order_item WHERE order_id = 1;

-- Get order items with product details
SELECT oi.*, p.product_name, pv.variant_name
FROM order_item oi
JOIN product p ON oi.product_id = p.product_id
LEFT JOIN product_variant pv ON oi.variant_id = pv.variant_id
WHERE oi.order_id = 1;

-- UPDATE ORDER ITEM
UPDATE order_item 
SET quantity = 3, 
    line_total = quantity * unit_price
WHERE order_item_id = 1;

-- DELETE ORDER ITEM
DELETE FROM order_item WHERE order_item_id = 1;

-- =========================
-- CATEGORIES TABLE CRUD
-- =========================

-- CREATE CATEGORY
INSERT INTO category (category_name, description)
VALUES ('Groceries', 'Food items and daily essentials');

-- SELECT CATEGORIES
SELECT * FROM category;

-- Get category with product count
SELECT c.*, COUNT(p.product_id) as product_count
FROM category c
LEFT JOIN product p ON c.category_id = p.category_id
GROUP BY c.category_id;

-- UPDATE CATEGORY
UPDATE category 
SET description = 'Updated description'
WHERE category_id = 1;

-- DELETE CATEGORY
DELETE FROM category WHERE category_id = 1;

-- =========================
-- ADDRESSES TABLE CRUD
-- =========================

-- CREATE ADDRESS
INSERT INTO address (user_id, address_line_1, address_line_2, city, state, postal_code, country, address_type, is_default, created_at)
VALUES (1, 'House 123', 'Block A, Gulshan', 'Karachi', 'Sindh', '75300', 'Pakistan', 'home', TRUE, NOW());

-- SELECT ADDRESSES
-- Get all addresses for a user
SELECT * FROM address WHERE user_id = 1;

-- Get default address for user
SELECT * FROM address WHERE user_id = 1 AND is_default = TRUE;

-- UPDATE ADDRESS
UPDATE address 
SET address_line_1 = 'New Address',
    city = 'Lahore'
WHERE address_id = 1;

-- DELETE ADDRESS
DELETE FROM address WHERE address_id = 1;

-- =========================
-- CART TABLE CRUD
-- =========================

-- CREATE CART
INSERT INTO cart (customer_id, created_at, updated_at)
VALUES (1, NOW(), NOW());

-- SELECT CART
-- Get cart for customer
SELECT * FROM cart WHERE customer_id = 1;

-- Get cart with items
SELECT c.*, ci.quantity, p.product_name, p.base_price
FROM cart c
JOIN cart_item ci ON c.cart_id = ci.cart_id
JOIN product p ON ci.product_id = p.product_id
WHERE c.customer_id = 1;

-- UPDATE CART
UPDATE cart SET updated_at = NOW() WHERE cart_id = 1;

-- DELETE CART
DELETE FROM cart WHERE cart_id = 1;

-- =========================
-- CART ITEMS CRUD
-- =========================

-- ADD ITEM TO CART
INSERT INTO cart_item (cart_id, product_id, variant_id, quantity, added_at)
VALUES (1, 1, 1, 2, NOW());

-- GET CART ITEMS
SELECT * FROM cart_item WHERE cart_id = 1;

-- UPDATE CART ITEM QUANTITY
UPDATE cart_item 
SET quantity = 3 
WHERE cart_item_id = 1;

-- REMOVE ITEM FROM CART
DELETE FROM cart_item WHERE cart_item_id = 1;

-- CLEAR ENTIRE CART
DELETE FROM cart_item WHERE cart_id = 1;

-- =========================
-- REVIEWS TABLE CRUD
-- =========================

-- CREATE REVIEW
INSERT INTO review (product_id, customer_id, rating, comment, review_date, is_verified_purchase)
VALUES (1, 1, 4.5, 'Great product, fast delivery!', NOW(), TRUE);

-- SELECT REVIEWS
-- Get all reviews for a product
SELECT * FROM review WHERE product_id = 1;

-- Get reviews with customer names
SELECT r.*, u.first_name, u.last_name
FROM review r
JOIN users u ON r.customer_id = u.user_id
WHERE r.product_id = 1;

-- Get average rating for product
SELECT AVG(rating) as avg_rating, COUNT(*) as total_reviews
FROM review 
WHERE product_id = 1;

-- UPDATE REVIEW
UPDATE review 
SET rating = 5.0, 
    comment = 'Updated review - Excellent!'
WHERE review_id = 1;

-- DELETE REVIEW
DELETE FROM review WHERE review_id = 1;

-- =========================
-- SIMPLE STORED PROCEDURES
-- =========================

-- Add item to cart (simple procedure)
CREATE OR REPLACE PROCEDURE AddToCart(
    p_customer_id INTEGER,
    p_product_id INTEGER,
    p_quantity INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_cart_id INTEGER;
BEGIN
    -- Get or create cart
    SELECT cart_id INTO v_cart_id 
    FROM cart 
    WHERE customer_id = p_customer_id;
    
    IF v_cart_id IS NULL THEN
        INSERT INTO cart (customer_id, created_at, updated_at)
        VALUES (p_customer_id, NOW(), NOW())
        RETURNING cart_id INTO v_cart_id;
    END IF;
    
    -- Add item to cart
    INSERT INTO cart_item (cart_id, product_id, quantity, added_at)
    VALUES (v_cart_id, p_product_id, p_quantity, NOW());
END;
$$;

-- Update stock when order is placed
CREATE OR REPLACE PROCEDURE UpdateStockOnOrder(
    p_product_id INTEGER,
    p_quantity INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE product 
    SET stock_quantity = stock_quantity - p_quantity
    WHERE product_id = p_product_id;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Product not found';
    END IF;
END;
$$;

-- Get customer order history
CREATE OR REPLACE FUNCTION GetCustomerOrders(p_customer_id INTEGER)
RETURNS TABLE (
    order_id INTEGER,
    order_date TIMESTAMP,
    status VARCHAR(50),
    total_amount DECIMAL(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT o.order_id, o.order_date, o.status, o.total_amount
    FROM orders o
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_date DESC;
END;
$$;

-- =========================
-- SIMPLE TRIGGERS
-- =========================

-- Trigger to update cart timestamp when items are added
CREATE OR REPLACE FUNCTION update_cart_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE cart 
    SET updated_at = NOW() 
    WHERE cart_id = NEW.cart_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_cart_timestamp
    AFTER INSERT OR UPDATE ON cart_item
    FOR EACH ROW
    EXECUTE FUNCTION update_cart_timestamp();

-- Trigger to prevent stock from going negative
CREATE OR REPLACE FUNCTION check_stock_limit()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock_quantity < 0 THEN
        RAISE EXCEPTION 'Stock cannot be negative for product %', NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_stock_limit
    BEFORE UPDATE ON product
    FOR EACH ROW
    EXECUTE FUNCTION check_stock_limit();

-- =========================
-- USEFUL QUERIES
-- =========================

-- Get top selling products
SELECT p.product_name, SUM(oi.quantity) as total_sold
FROM product p
JOIN order_item oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- Get monthly sales
SELECT 
    DATE_TRUNC('month', order_date) as month,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_revenue
FROM orders
WHERE status != 'cancelled'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- Get customers with most orders
SELECT 
    u.first_name, 
    u.last_name, 
    COUNT(o.order_id) as total_orders,
    SUM(o.total_amount) as total_spent
FROM users u
JOIN orders o ON u.user_id = o.customer_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_orders DESC;

-- Get products that need restocking
SELECT product_name, stock_quantity
FROM product
WHERE stock_quantity < 5
ORDER BY stock_quantity;

-- =========================
-- EXAMPLE USAGE
-- =========================

-- Add item to cart
CALL AddToCart(1, 1, 2);

-- Get customer orders
SELECT * FROM GetCustomerOrders(1);

-- Update stock after order
CALL UpdateStockOnOrder(1, 2);