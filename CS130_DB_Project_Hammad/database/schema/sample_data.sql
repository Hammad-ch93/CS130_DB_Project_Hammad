-- =========================
-- USER MANAGEMENT DATA
-- =========================
-- Insert Users
INSERT INTO
	users (first_name, last_name, email, password, phone, created_at, last_login, user_type)
VALUES
	('Ahmed', 'Khan', 'ahmed.khan@gmail.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-300-1234567', '2024-01-15 10:30:00', '2024-12-20 14:22:00', 'customer'),
	('Fatima', 'Sheikh', 'fatima.sheikh@hotmail.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-321-9876543', '2024-02-20 09:15:00', '2024-12-19 16:45:00', 'customer'),
	('Muhammad', 'Ali', 'muhammad.ali@yahoo.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-333-5555555', '2024-01-10 11:20:00', '2024-12-18 20:30:00', 'customer'),
	('Ayesha', 'Malik', 'ayesha.malik@gmail.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-302-7777777', '2024-03-05 14:45:00', '2024-12-21 12:15:00', 'customer'),
	('Hassan', 'Qureshi', 'hassan.qureshi@admin.pk', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-301-1111111', '2023-12-01 08:00:00', '2024-12-21 09:30:00', 'admin'),
	('Sara', 'Ahmed', 'sara.ahmed@gmail.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-345-2222222', '2024-04-12 16:30:00', '2024-12-20 18:20:00', 'customer'),
	('Usman', 'Tariq', 'usman.tariq@live.com', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-312-3333333', '2024-02-28 13:10:00', '2024-12-17 21:45:00', 'customer'),
	('Zainab', 'Raza', 'zainab.raza@admin.pk', '$2b$12$LQv3c1yqBwLFaAErBLeyHu', '+92-315-4444444', '2023-11-15 07:30:00', '2024-12-21 10:00:00', 'admin');

-- Insert Customers
INSERT INTO customer (customer_id, loyalty_points) VALUES
(1, 250.50),
(2, 180.25),
(3, 95.75),
(4, 320.00),
(6, 45.50),
(7, 150.25);

-- Insert Admins
INSERT INTO admin (admin_id, role, permissions) VALUES
(5, 'Super Admin', 'all'),
(8, 'Product Manager', 'products,categories,inventory');

-- =========================
-- ADDRESS DATA
-- =========================

INSERT INTO address (user_id, address_line_1, address_line_2, city, state, postal_code, country, address_type, is_default, created_at) VALUES
(1, 'House 123, Block A', 'Gulshan-e-Iqbal', 'Karachi', 'Sindh', '75300', 'Pakistan', 'home', true, '2024-01-15 10:35:00'),
(1, 'Office 205, Business Center', 'I.I. Chundrigar Road', 'Karachi', 'Sindh', '74000', 'Pakistan', 'office', false, '2024-02-01 09:20:00'),
(2, 'Flat 45, Garden Town', 'Main Boulevard', 'Lahore', 'Punjab', '54000', 'Pakistan', 'home', true, '2024-02-20 09:20:00'),
(3, 'House 67, F-8/3', 'Islamabad', 'Islamabad', 'Islamabad', '44000', 'Pakistan', 'home', true, '2024-01-10 11:25:00'),
(4, 'Shop 12, Liberty Market', 'Gulberg', 'Lahore', 'Punjab', '54660', 'Pakistan', 'office', false, '2024-03-05 14:50:00'),
(4, 'House 89, Model Town', 'Block B', 'Lahore', 'Punjab', '54700', 'Pakistan', 'home', true, '2024-03-06 10:15:00'),
(6, 'Apartment 301, Clifton', 'Block 4', 'Karachi', 'Sindh', '75600', 'Pakistan', 'home', true, '2024-04-12 16:35:00'),
(7, 'House 456, Hayatabad', 'Phase 1', 'Peshawar', 'KPK', '25100', 'Pakistan', 'home', true, '2024-02-28 13:15:00');

-- =========================
-- PRODUCT CATALOG DATA
-- =========================

-- Insert Categories
INSERT INTO category (category_name, description) VALUES
('Electronics', 'Mobile phones, laptops, gadgets and electronic accessories'),
('Clothing', 'Traditional and modern clothing for men, women and children'),
('Home & Kitchen', 'Household items, kitchen appliances and home decor'),
('Books', 'Educational books, novels, religious books in Urdu and English'),
('Health & Beauty', 'Cosmetics, skincare, health supplements and personal care'),
('Sports', 'Cricket equipment, gym accessories and outdoor sports gear');

-- Insert Products
INSERT INTO product (product_name, description, base_price, stock_quantity, category_id, created_at, updated_at) VALUES
('Samsung Galaxy A54', 'Latest Samsung smartphone with 128GB storage, 6GB RAM, excellent camera quality', 89999.00, 45, 1, '2024-01-01 00:00:00', '2024-12-15 10:30:00'),
('Khaadi Lawn Collection', 'Premium unstitched lawn suit with beautiful Pakistani traditional prints', 4500.00, 120, 2, '2024-03-01 00:00:00', '2024-12-10 15:20:00'),
('National Pressure Cooker', 'High quality stainless steel pressure cooker, 5 liter capacity, Pakistani brand', 3200.00, 80, 3, '2024-02-15 00:00:00', '2024-12-12 09:45:00'),
('Nimra Cricket Bat', 'Professional grade cricket bat made from premium English willow', 8500.00, 25, 6, '2024-01-20 00:00:00', '2024-12-08 14:10:00'),
('Quran Majeed with Urdu Translation', 'Holy Quran with Urdu translation by Maulana Ashraf Ali Thanvi', 850.00, 200, 4, '2024-01-05 00:00:00', '2024-12-18 11:25:00'),
('Boroline Antiseptic Cream', 'Ayurvedic antiseptic cream for cuts, burns and skin problems', 180.00, 150, 5, '2024-02-01 00:00:00', '2024-12-14 16:40:00'),
('Gul Ahmed Kurta', 'Cotton kurta for men, available in multiple colors and sizes', 2200.00, 95, 2, '2024-02-20 00:00:00', '2024-12-11 13:55:00'),
('Haier Washing Machine', 'Semi-automatic washing machine, 8kg capacity, energy efficient', 28500.00, 15, 3, '2024-01-25 00:00:00', '2024-12-16 12:30:00');

-- Insert Product Variants
INSERT INTO product_variant (product_id, variant_name, description, additional_price, stock_quantity, sku, is_active) VALUES
(1, 'Black 128GB', 'Samsung Galaxy A54 in Black color, 128GB storage', 0.00, 20, 'SAM-A54-BLK-128', true),
(1, 'White 128GB', 'Samsung Galaxy A54 in White color, 128GB storage', 0.00, 15, 'SAM-A54-WHT-128', true),
(1, 'Blue 256GB', 'Samsung Galaxy A54 in Blue color, 256GB storage', 15000.00, 10, 'SAM-A54-BLU-256', true),
(2, 'Design A - Medium', 'Khaadi lawn suit with floral design, Medium size', 0.00, 30, 'KHA-LAW-A-M', true),
(2, 'Design A - Large', 'Khaadi lawn suit with floral design, Large size', 0.00, 25, 'KHA-LAW-A-L', true),
(2, 'Design B - Medium', 'Khaadi lawn suit with geometric design, Medium size', 500.00, 35, 'KHA-LAW-B-M', true),
(3, '3 Liter', 'National pressure cooker 3 liter capacity', -800.00, 40, 'NAT-PC-3L', true),
(3, '5 Liter', 'National pressure cooker 5 liter capacity', 0.00, 40, 'NAT-PC-5L', true),
(7, 'White - Medium', 'Gul Ahmed white kurta, Medium size', 0.00, 30, 'GUL-KUR-WHT-M', true),
(7, 'Blue - Large', 'Gul Ahmed blue kurta, Large size', 200.00, 35, 'GUL-KUR-BLU-L', true),
(7, 'Cream - Extra Large', 'Gul Ahmed cream kurta, Extra Large size', 300.00, 30, 'GUL-KUR-CRM-XL', true);

-- =========================
-- SUPPLIER DATA
-- =========================

INSERT INTO supplier (company_name, contact_person, phone, email, address_line_1, address_line_2, city, state, postal_code, country) VALUES
('Samsung Electronics Pakistan', 'Ali Raza', '+92-21-35301234', 'supplier@samsung.pk', 'Plot 23, SITE Industrial Area', 'Near Hub River Road', 'Karachi', 'Sindh', '75700', 'Pakistan'),
('Khaadi Textiles Ltd', 'Shamoon Sultan', '+92-42-35714567', 'orders@khaadi.com', '25-A, Main Boulevard', 'Gulberg III', 'Lahore', 'Punjab', '54660', 'Pakistan'),
('National Foods Limited', 'Tariq Mahmood', '+92-21-34391000', 'procurement@national.pk', '12-A, S.I.T.E', 'Super Highway', 'Karachi', 'Sindh', '75730', 'Pakistan'),
('Sialkot Sports Industries', 'Muhammad Akram', '+92-52-4264789', 'export@ssi.pk', 'Sambrial Road', 'Sialkot Industrial Estate', 'Sialkot', 'Punjab', '51310', 'Pakistan'),
('Maktaba Islamia Publishers', 'Qari Abdul Rahman', '+92-42-37234567', 'books@maktaba.pk', '45-Urdu Bazaar', 'Kashmiri Gate', 'Lahore', 'Punjab', '54000', 'Pakistan'),
('Hamdard Laboratories', 'Dr. Sohail Ahmed', '+92-21-34524680', 'sales@hamdard.pk', 'Nazimabad No.2', 'Karachi', 'Karachi', 'Sindh', '74600', 'Pakistan'),
('Gul Ahmed Textiles', 'Rashid Tabani', '+92-21-32562789', 'wholesale@gulahmad.com', 'Plot 28, SITE Area', 'Manghopir Road', 'Karachi', 'Sindh', '75700', 'Pakistan'),
('Haier Pakistan', 'Zhang Wei', '+92-42-35884455', 'supply@haier.pk', 'Ferozepur Road', 'Industrial Area', 'Lahore', 'Punjab', '54760', 'Pakistan');

-- Insert Product-Supplier relationships
INSERT INTO product_supplier (product_id, supplier_id, supply_price, lead_time_days, is_primary_supplier) VALUES
(1, 1, 85000.00, 7, true),
(2, 2, 3800.00, 14, true),
(3, 3, 2800.00, 10, true),
(4, 4, 7200.00, 21, true),
(5, 5, 650.00, 5, true),
(6, 6, 140.00, 3, true),
(7, 7, 1800.00, 12, true),
(8, 8, 26000.00, 15, true);

-- =========================
-- CART DATA
-- =========================

INSERT INTO cart (customer_id, created_at, updated_at) VALUES
(1, '2024-12-20 10:30:00', '2024-12-21 14:45:00'),
(2, '2024-12-19 16:20:00', '2024-12-20 09:15:00'),
(4, '2024-12-21 11:00:00', '2024-12-21 11:30:00');

INSERT INTO cart_item (cart_id, product_id, variant_id, quantity, added_at) VALUES
(1, 1, 1, 1, '2024-12-20 10:30:00'),
(1, 5, NULL, 2, '2024-12-21 14:45:00'),
(2, 2, 4, 1, '2024-12-19 16:20:00'),
(2, 7, 9, 1, '2024-12-20 09:15:00'),
(3, 8, NULL, 1, '2024-12-21 11:00:00'),
(3, 3, 8, 1, '2024-12-21 11:30:00');

-- =========================
-- ORDERS DATA
-- =========================

INSERT INTO orders (customer_id, shipping_address_id, billing_address_id, order_date, status, subtotal, tax_amount, shipping_cost, discount_amount, total_amount) VALUES
(1, 1, 1, '2024-12-15 14:30:00', 'delivered', 89999.00, 0.00, 300.00, 5000.00, 85299.00),
(2, 3, 3, '2024-12-10 10:15:00', 'delivered', 4500.00, 0.00, 250.00, 0.00, 4750.00),
(3, 4, 4, '2024-12-05 16:45:00', 'shipped', 8500.00, 0.00, 400.00, 500.00, 8400.00),
(4, 6, 6, '2024-12-18 12:20:00', 'processing', 6900.00, 0.00, 350.00, 1000.00, 6250.00),
(6, 7, 7, '2024-12-12 09:30:00', 'delivered', 32000.00, 0.00, 500.00, 2000.00, 30500.00),
(7, 8, 8, '2024-12-08 18:00:00', 'cancelled', 2200.00, 0.00, 200.00, 0.00, 2400.00);

INSERT INTO order_item (order_id, product_id, variant_id, quantity, unit_price, line_total) VALUES
(1, 1, 1, 1, 89999.00, 89999.00),
(2, 2, 4, 1, 4500.00, 4500.00),
(3, 4, NULL, 1, 8500.00, 8500.00),
(4, 2, 6, 1, 5000.00, 5000.00),
(4, 5, NULL, 2, 850.00, 1700.00),
(4, 6, NULL, 1, 180.00, 180.00),
(5, 8, NULL, 1, 28500.00, 28500.00),
(5, 3, 8, 1, 3200.00, 3200.00),
(5, 6, NULL, 2, 180.00, 360.00),
(6, 7, 9, 1, 2200.00, 2200.00);

-- =========================
-- PAYMENT DATA
-- =========================

INSERT INTO payment_method (method_name, description) VALUES
('JazzCash', 'Mobile wallet payment via JazzCash app'),
('EasyPaisa', 'Mobile wallet payment via EasyPaisa app'),
('Bank Transfer', 'Direct bank account transfer'),
('Cash on Delivery', 'Pay cash when order is delivered'),
('Credit Card', 'Visa/MasterCard credit card payment'),
('Debit Card', 'Local bank debit card payment');

INSERT INTO payment (order_id, payment_method_id, payment_date, amount, payment_status, transaction_id, gateway_response) VALUES
(1, 1, '2024-12-15 14:35:00', 85299.00, 'completed', 'JC123456789', 'Payment successful via JazzCash'),
(2, 4, '2024-12-12 15:30:00', 4750.00, 'completed', 'COD001', 'Cash collected on delivery'),
(3, 2, '2024-12-05 16:50:00', 8400.00, 'completed', 'EP987654321', 'EasyPaisa payment confirmed'),
(4, 5, '2024-12-18 12:25:00', 6250.00, 'pending', 'CC456789123', 'Credit card authorization pending'),
(5, 3, '2024-12-12 09:35:00', 30500.00, 'completed', 'BT789123456', 'Bank transfer verified'),
(6, 4, '2024-12-08 18:05:00', 2400.00, 'refunded', 'COD002', 'Order cancelled, no payment collected');

-- =========================
-- SHIPPING DATA
-- =========================

INSERT INTO shipping_carrier (carrier_name, tracking_url_template, is_active) VALUES
('TCS', 'https://www.tcs.com.pk/tracking/{tracking_number}', true),
('Leopards Courier', 'https://leopardscourier.com/tracking/{tracking_number}', true),
('Pakistan Post', 'https://pakpost.gov.pk/track/{tracking_number}', true),
('M&P Express', 'https://mnp.com.pk/track/{tracking_number}', true),
('Call Courier', 'https://callcourier.com.pk/tracking/{tracking_number}', true);

INSERT INTO shipment (order_id, carrier_id, shipment_date, tracking_number, estimated_delivery_date, actual_delivery_date, delivery_status, shipping_cost) VALUES
(1, 1, '2024-12-16 09:00:00', 'TCS123456789', '2024-12-18', '2024-12-17', 'delivered', 300.00),
(2, 2, '2024-12-11 11:30:00', 'LEO987654321', '2024-12-13', '2024-12-12', 'delivered', 250.00),
(3, 1, '2024-12-06 14:15:00', 'TCS456789123', '2024-12-09', NULL, 'in_transit', 400.00),
(5, 3, '2024-12-13 08:45:00', 'PP789123456', '2024-12-16', '2024-12-15', 'delivered', 500.00);

INSERT INTO returns (order_id, shipment_id, return_date, reason, return_status, refund_amount) VALUES
(6, NULL, '2024-12-09', 'Customer changed mind', 'approved', 2400.00);

-- =========================
-- CUSTOMER ENGAGEMENT DATA
-- =========================

INSERT INTO wishlist (customer_id, product_id, added_at) VALUES
(1, 8, '2024-12-10 16:20:00'),
(1, 4, '2024-12-12 14:30:00'),
(2, 1, '2024-12-08 11:45:00'),
(3, 2, '2024-12-15 09:20:00'),
(4, 6, '2024-12-18 13:10:00'),
(6, 7, '2024-12-14 17:35:00');

INSERT INTO review (product_id, customer_id, rating, comment, review_date, is_verified_purchase) VALUES
(1, 1, 4.5, 'Excellent phone with great camera quality. Fast delivery by TCS. Highly recommended for the price range.', '2024-12-18 20:15:00', true),
(2, 2, 5.0, 'Beautiful Khaadi lawn design. Material quality is outstanding. Perfect for summer season.', '2024-12-13 15:30:00', true),
(8, 6, 4.0, 'Good washing machine but installation took longer than expected. Overall satisfied with performance.', '2024-12-16 11:20:00', true),
(3, 6, 4.5, 'National brand pressure cooker is reliable. Been using for 2 weeks, works perfectly.', '2024-12-17 14:45:00', true),
(5, 4, 5.0, 'Clear Urdu translation, good paper quality. Fast delivery. Great for daily reading.', '2024-12-20 19:00:00', true);

-- =========================
-- DISCOUNT DATA
-- =========================

INSERT INTO discount_type (type_name, description) VALUES
('Percentage', 'Discount calculated as percentage of order total'),
('Fixed Amount', 'Fixed rupee amount discount on order'),
('Free Shipping', 'Free shipping on qualifying orders'),
('Buy One Get One', 'Special BOGO offers on selected items');

INSERT INTO discount_code (discount_type_id, code, description, discount_value, minimum_order_amount, valid_from, valid_till, usage_limit, times_used, is_active) VALUES
(1, 'NEWUSER10', '10% discount for new users', 10.00, 2000.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1000, 150, true),
(2, 'SAVE500', 'Get Rs. 500 off on orders above Rs. 5000', 500.00, 5000.00, '2024-12-01 00:00:00', '2024-12-31 23:59:59', 500, 85, true),
(1, 'EID2024', '15% Eid special discount', 15.00, 3000.00, '2024-04-01 00:00:00', '2024-04-30 23:59:59', 2000, 890, false),
(2, 'WINTER1000', 'Winter sale - Rs. 1000 off', 1000.00, 8000.00, '2024-12-15 00:00:00', '2025-01-15 23:59:59', 300, 25, true),
(3, 'FREESHIP', 'Free shipping on orders above Rs. 2000', 0.00, 2000.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 10000, 1250, true);

INSERT INTO order_discount (order_id, discount_code_id, discount_applied) VALUES
(1, 1, 5000.00),
(3, 2, 500.00),
(4, 4, 1000.00),
(5, 4, 2000.00);