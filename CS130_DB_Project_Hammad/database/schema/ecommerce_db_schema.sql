-- -------------------------------------------------------------
-- TablePlus 6.4.8(608)
--
-- https://tableplus.com/
--
-- Database: ShopKaro (an E-commerce platform)
-- Generation Time: 2025-05-25 21:15:12.1770
-- -------------------------------------------------------------


DROP VIEW IF EXISTS "public"."v_order_summary";


DROP TABLE IF EXISTS "public"."users";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_user_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "user_id" int4 NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    "first_name" varchar(25),
    "last_name" varchar(25),
    "email" varchar(50),
    "password" varchar(255),
    "phone" varchar(15),
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "last_login" timestamp,
    "user_type" varchar(15),
    PRIMARY KEY ("user_id")
);

-- Column Comment
COMMENT ON COLUMN "public"."users"."password" IS 'Bcrypt hashed password - minimum 60 characters for proper hash storage';

DROP TABLE IF EXISTS "public"."admin";
-- Table Definition
CREATE TABLE "public"."admin" (
    "admin_id" int4 NOT NULL,
    "role" varchar(25),
    "permissions" varchar(50),
    PRIMARY KEY ("admin_id")
);

DROP TABLE IF EXISTS "public"."address";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS address_address_id_seq;

-- Table Definition
CREATE TABLE "public"."address" (
    "address_id" int4 NOT NULL DEFAULT nextval('address_address_id_seq'::regclass),
    "user_id" int4,
    "address_line_1" varchar(100),
    "address_line_2" varchar(100),
    "city" varchar(50),
    "state" varchar(50),
    "postal_code" varchar(20),
    "country" varchar(50),
    "address_type" varchar(15),
    "is_default" bool,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("address_id")
);

DROP TABLE IF EXISTS "public"."cart";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cart_cart_id_seq;

-- Table Definition
CREATE TABLE "public"."cart" (
    "cart_id" int4 NOT NULL DEFAULT nextval('cart_cart_id_seq'::regclass),
    "customer_id" int4,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("cart_id")
);

DROP TABLE IF EXISTS "public"."category";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_category_id_seq;

-- Table Definition
CREATE TABLE "public"."category" (
    "category_id" int4 NOT NULL DEFAULT nextval('category_category_id_seq'::regclass),
    "category_name" varchar(25),
    "description" text,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("category_id")
);

DROP TABLE IF EXISTS "public"."supplier";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS supplier_supplier_id_seq;

-- Table Definition
CREATE TABLE "public"."supplier" (
    "supplier_id" int4 NOT NULL DEFAULT nextval('supplier_supplier_id_seq'::regclass),
    "company_name" varchar(100),
    "contact_person" varchar(50),
    "phone" varchar(15),
    "email" varchar(50),
    "address_line_1" varchar(100),
    "address_line_2" varchar(100),
    "city" varchar(50),
    "state" varchar(50),
    "postal_code" varchar(20),
    "country" varchar(50),
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("supplier_id")
);

DROP TABLE IF EXISTS "public"."customer";
-- Table Definition
CREATE TABLE "public"."customer" (
    "customer_id" int4 NOT NULL,
    "loyalty_points" numeric(5,2) CHECK (loyalty_points >= (0)::numeric),
    PRIMARY KEY ("customer_id")
);

DROP TABLE IF EXISTS "public"."cart_item";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cart_item_cart_item_id_seq;

-- Table Definition
CREATE TABLE "public"."cart_item" (
    "cart_item_id" int4 NOT NULL DEFAULT nextval('cart_item_cart_item_id_seq'::regclass),
    "cart_id" int4,
    "product_id" int4,
    "variant_id" int4,
    "quantity" int4 CHECK (quantity > 0),
    "added_at" timestamp,
    PRIMARY KEY ("cart_item_id")
);

DROP TABLE IF EXISTS "public"."orders";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS orders_order_id_seq;

-- Table Definition
CREATE TABLE "public"."orders" (
    "order_id" int4 NOT NULL DEFAULT nextval('orders_order_id_seq'::regclass),
    "customer_id" int4,
    "shipping_address_id" int4,
    "billing_address_id" int4,
    "order_date" timestamp,
    "status" varchar(15) CHECK ((status)::text = ANY ((ARRAY['pending'::character varying, 'processing'::character varying, 'shipped'::character varying, 'delivered'::character varying, 'cancelled'::character varying, 'returned'::character varying])::text[])),
    "subtotal" numeric,
    "tax_amount" numeric,
    "shipping_cost" numeric,
    "discount_amount" numeric,
    "total_amount" numeric,
    PRIMARY KEY ("order_id")
);

DROP TABLE IF EXISTS "public"."payment";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS payment_payment_id_seq;

-- Table Definition
CREATE TABLE "public"."payment" (
    "payment_id" int4 NOT NULL DEFAULT nextval('payment_payment_id_seq'::regclass),
    "order_id" int4,
    "payment_method_id" int4,
    "payment_date" timestamp,
    "amount" numeric,
    "payment_status" varchar(15) CHECK ((payment_status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'failed'::character varying, 'refunded'::character varying, 'cancelled'::character varying])::text[])),
    "transaction_id" varchar(100),
    "gateway_response" text,
    PRIMARY KEY ("payment_id")
);

DROP TABLE IF EXISTS "public"."review";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS review_review_id_seq;

-- Table Definition
CREATE TABLE "public"."review" (
    "review_id" int4 NOT NULL DEFAULT nextval('review_review_id_seq'::regclass),
    "product_id" int4,
    "customer_id" int4,
    "rating" numeric(2,1) CHECK ((rating >= 1.0) AND (rating <= 5.0)),
    "comment" text,
    "review_date" timestamp,
    "is_verified_purchase" bool,
    PRIMARY KEY ("review_id")
);

DROP TABLE IF EXISTS "public"."shipment";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS shipment_shipment_id_seq;

-- Table Definition
CREATE TABLE "public"."shipment" (
    "shipment_id" int4 NOT NULL DEFAULT nextval('shipment_shipment_id_seq'::regclass),
    "order_id" int4,
    "carrier_id" int4,
    "shipment_date" timestamp,
    "tracking_number" varchar(50),
    "estimated_delivery_date" date,
    "actual_delivery_date" date,
    "delivery_status" varchar(25) CHECK ((delivery_status)::text = ANY ((ARRAY['pending'::character varying, 'picked_up'::character varying, 'in_transit'::character varying, 'out_for_delivery'::character varying, 'delivered'::character varying, 'failed'::character varying, 'returned'::character varying])::text[])),
    "shipping_cost" numeric,
    PRIMARY KEY ("shipment_id")
);

DROP TABLE IF EXISTS "public"."wishlist";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS wishlist_wishlist_id_seq;

-- Table Definition
CREATE TABLE "public"."wishlist" (
    "wishlist_id" int4 NOT NULL DEFAULT nextval('wishlist_wishlist_id_seq'::regclass),
    "customer_id" int4,
    "product_id" int4,
    "added_at" timestamp,
    PRIMARY KEY ("wishlist_id")
);

DROP TABLE IF EXISTS "public"."payment_method";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS payment_method_payment_method_id_seq;

-- Table Definition
CREATE TABLE "public"."payment_method" (
    "payment_method_id" int4 NOT NULL DEFAULT nextval('payment_method_payment_method_id_seq'::regclass),
    "method_name" varchar(25),
    "description" text,
    PRIMARY KEY ("payment_method_id")
);

DROP TABLE IF EXISTS "public"."shipping_carrier";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS shipping_carrier_carrier_id_seq;

-- Table Definition
CREATE TABLE "public"."shipping_carrier" (
    "carrier_id" int4 NOT NULL DEFAULT nextval('shipping_carrier_carrier_id_seq'::regclass),
    "carrier_name" varchar(50),
    "tracking_url_template" varchar(200),
    "is_active" bool,
    PRIMARY KEY ("carrier_id")
);

DROP TABLE IF EXISTS "public"."discount_type";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS discount_type_discount_type_id_seq;

-- Table Definition
CREATE TABLE "public"."discount_type" (
    "discount_type_id" int4 NOT NULL DEFAULT nextval('discount_type_discount_type_id_seq'::regclass),
    "type_name" varchar(20),
    "description" text,
    PRIMARY KEY ("discount_type_id")
);

DROP TABLE IF EXISTS "public"."order_discount";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_discount_order_discount_id_seq;

-- Table Definition
CREATE TABLE "public"."order_discount" (
    "order_discount_id" int4 NOT NULL DEFAULT nextval('order_discount_order_discount_id_seq'::regclass),
    "order_id" int4,
    "discount_code_id" int4,
    "discount_applied" numeric,
    PRIMARY KEY ("order_discount_id")
);

DROP TABLE IF EXISTS "public"."returns";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS returns_return_id_seq;

-- Table Definition
CREATE TABLE "public"."returns" (
    "return_id" int4 NOT NULL DEFAULT nextval('returns_return_id_seq'::regclass),
    "order_id" int4,
    "shipment_id" int4,
    "return_date" date,
    "reason" varchar(100),
    "return_status" varchar(20),
    "refund_amount" numeric,
    PRIMARY KEY ("return_id")
);

DROP TABLE IF EXISTS "public"."product_supplier";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS product_supplier_product_supplier_id_seq;

-- Table Definition
CREATE TABLE "public"."product_supplier" (
    "product_supplier_id" int4 NOT NULL DEFAULT nextval('product_supplier_product_supplier_id_seq'::regclass),
    "product_id" int4,
    "supplier_id" int4,
    "supply_price" numeric,
    "lead_time_days" int4,
    "is_primary_supplier" bool,
    PRIMARY KEY ("product_supplier_id")
);

DROP TABLE IF EXISTS "public"."product";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS product_product_id_seq;

-- Table Definition
CREATE TABLE "public"."product" (
    "product_id" int4 NOT NULL DEFAULT nextval('product_product_id_seq'::regclass),
    "product_name" varchar(50),
    "description" text,
    "base_price" numeric CHECK (base_price >= (0)::numeric),
    "stock_quantity" int4 CHECK (stock_quantity >= 0),
    "category_id" int4,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("product_id")
);

DROP TABLE IF EXISTS "public"."product_variant";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS product_variant_variant_id_seq;

-- Table Definition
CREATE TABLE "public"."product_variant" (
    "variant_id" int4 NOT NULL DEFAULT nextval('product_variant_variant_id_seq'::regclass),
    "product_id" int4,
    "variant_name" varchar(50),
    "description" text,
    "additional_price" numeric,
    "stock_quantity" int4 CHECK (stock_quantity >= 0),
    "sku" varchar(50),
    "is_active" bool,
    PRIMARY KEY ("variant_id")
);

DROP TABLE IF EXISTS "public"."order_item";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_item_order_item_id_seq;

-- Table Definition
CREATE TABLE "public"."order_item" (
    "order_item_id" int4 NOT NULL DEFAULT nextval('order_item_order_item_id_seq'::regclass),
    "order_id" int4,
    "product_id" int4,
    "variant_id" int4,
    "quantity" int4 CHECK (quantity > 0),
    "unit_price" numeric CHECK (unit_price >= (0)::numeric),
    "line_total" numeric,
    PRIMARY KEY ("order_item_id")
);

DROP TABLE IF EXISTS "public"."discount_code";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS discount_code_discount_code_id_seq;

-- Table Definition
CREATE TABLE "public"."discount_code" (
    "discount_code_id" int4 NOT NULL DEFAULT nextval('discount_code_discount_code_id_seq'::regclass),
    "discount_type_id" int4,
    "code" varchar(20),
    "description" text,
    "discount_value" numeric,
    "minimum_order_amount" numeric,
    "valid_from" timestamp,
    "valid_till" timestamp,
    "usage_limit" int4,
    "times_used" int4 CHECK (times_used >= 0),
    "is_active" bool,
    PRIMARY KEY ("discount_code_id")
);

CREATE VIEW "public"."v_order_summary" AS ;


-- Comments
COMMENT ON TABLE "public"."users" IS 'Base user table for both customers and admins with role-based access';


-- Indices
CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);
ALTER TABLE "public"."admin" ADD FOREIGN KEY ("admin_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."admin" ADD FOREIGN KEY ("admin_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."address" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."cart" ADD FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");
ALTER TABLE "public"."customer" ADD FOREIGN KEY ("customer_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."cart_item" ADD FOREIGN KEY ("cart_id") REFERENCES "public"."cart"("cart_id");
ALTER TABLE "public"."cart_item" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."cart_item" ADD FOREIGN KEY ("variant_id") REFERENCES "public"."product_variant"("variant_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("shipping_address_id") REFERENCES "public"."address"("address_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("billing_address_id") REFERENCES "public"."address"("address_id");
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");


-- Comments
COMMENT ON TABLE "public"."orders" IS 'Main order table with complete order lifecycle management';
ALTER TABLE "public"."payment" ADD FOREIGN KEY ("payment_method_id") REFERENCES "public"."payment_method"("payment_method_id");
ALTER TABLE "public"."payment" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."review" ADD FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");
ALTER TABLE "public"."review" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."shipment" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."shipment" ADD FOREIGN KEY ("carrier_id") REFERENCES "public"."shipping_carrier"("carrier_id");
ALTER TABLE "public"."wishlist" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."wishlist" ADD FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");
ALTER TABLE "public"."order_discount" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."order_discount" ADD FOREIGN KEY ("discount_code_id") REFERENCES "public"."discount_code"("discount_code_id");
ALTER TABLE "public"."returns" ADD FOREIGN KEY ("shipment_id") REFERENCES "public"."shipment"("shipment_id");
ALTER TABLE "public"."returns" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."product_supplier" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."product_supplier" ADD FOREIGN KEY ("supplier_id") REFERENCES "public"."supplier"("supplier_id");
ALTER TABLE "public"."product" ADD FOREIGN KEY ("category_id") REFERENCES "public"."category"("category_id");
ALTER TABLE "public"."product_variant" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."order_item" ADD FOREIGN KEY ("variant_id") REFERENCES "public"."product_variant"("variant_id");
ALTER TABLE "public"."order_item" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id");
ALTER TABLE "public"."order_item" ADD FOREIGN KEY ("product_id") REFERENCES "public"."product"("product_id");
ALTER TABLE "public"."discount_code" ADD FOREIGN KEY ("discount_type_id") REFERENCES "public"."discount_type"("discount_type_id");


-- Indices
CREATE UNIQUE INDEX discount_code_code_key ON public.discount_code USING btree (code);
