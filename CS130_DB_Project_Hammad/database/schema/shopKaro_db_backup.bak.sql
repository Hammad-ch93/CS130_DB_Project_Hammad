PGDMP                       }         
   e-commerce    17.4 (Postgres.app)    17.0 (DBngin.app) �    f           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            g           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            h           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            i           1262    33284 
   e-commerce    DATABASE     �   CREATE DATABASE "e-commerce" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE "e-commerce";
                     postgres    false            �            1259    33316    address    TABLE     �  CREATE TABLE public.address (
    address_id integer NOT NULL,
    user_id integer,
    address_line_1 character varying(100),
    address_line_2 character varying(100),
    city character varying(50),
    state character varying(50),
    postal_code character varying(20),
    country character varying(50),
    address_type character varying(15),
    is_default boolean,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.address;
       public         heap r       postgres    false            �            1259    33315    address_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.address_address_id_seq;
       public               postgres    false    222            j           0    0    address_address_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;
          public               postgres    false    221            �            1259    33305    admin    TABLE     �   CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    role character varying(25),
    permissions character varying(50)
);
    DROP TABLE public.admin;
       public         heap r       postgres    false            �            1259    33394    cart    TABLE     �   CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    customer_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.cart;
       public         heap r       postgres    false            �            1259    33393    cart_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cart_cart_id_seq;
       public               postgres    false    234            k           0    0    cart_cart_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;
          public               postgres    false    233            �            1259    33406 	   cart_item    TABLE       CREATE TABLE public.cart_item (
    cart_item_id integer NOT NULL,
    cart_id integer,
    product_id integer,
    variant_id integer,
    quantity integer,
    added_at timestamp without time zone,
    CONSTRAINT chk_cart_quantity CHECK ((quantity > 0))
);
    DROP TABLE public.cart_item;
       public         heap r       postgres    false            �            1259    33405    cart_item_cart_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_item_cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cart_item_cart_item_id_seq;
       public               postgres    false    236            l           0    0    cart_item_cart_item_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.cart_item_cart_item_id_seq OWNED BY public.cart_item.cart_item_id;
          public               postgres    false    235            �            1259    33329    category    TABLE       CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(25),
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.category;
       public         heap r       postgres    false            �            1259    33328    category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_category_id_seq;
       public               postgres    false    224            m           0    0    category_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;
          public               postgres    false    223            �            1259    33295    customer    TABLE     �   CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    loyalty_points numeric(5,2),
    CONSTRAINT chk_loyalty_points CHECK ((loyalty_points >= (0)::numeric))
);
    DROP TABLE public.customer;
       public         heap r       postgres    false                       1259    33594    discount_code    TABLE     �  CREATE TABLE public.discount_code (
    discount_code_id integer NOT NULL,
    discount_type_id integer,
    code character varying(20),
    description text,
    discount_value numeric,
    minimum_order_amount numeric,
    valid_from timestamp without time zone,
    valid_till timestamp without time zone,
    usage_limit integer,
    times_used integer,
    is_active boolean,
    CONSTRAINT chk_usage_count CHECK ((times_used >= 0))
);
 !   DROP TABLE public.discount_code;
       public         heap r       postgres    false                       1259    33593 "   discount_code_discount_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discount_code_discount_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.discount_code_discount_code_id_seq;
       public               postgres    false    258            n           0    0 "   discount_code_discount_code_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.discount_code_discount_code_id_seq OWNED BY public.discount_code.discount_code_id;
          public               postgres    false    257                        1259    33585    discount_type    TABLE     �   CREATE TABLE public.discount_type (
    discount_type_id integer NOT NULL,
    type_name character varying(20),
    description text
);
 !   DROP TABLE public.discount_type;
       public         heap r       postgres    false            �            1259    33584 "   discount_type_discount_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discount_type_discount_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.discount_type_discount_type_id_seq;
       public               postgres    false    256            o           0    0 "   discount_type_discount_type_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.discount_type_discount_type_id_seq OWNED BY public.discount_type.discount_type_id;
          public               postgres    false    255                       1259    33610    order_discount    TABLE     �   CREATE TABLE public.order_discount (
    order_discount_id integer NOT NULL,
    order_id integer,
    discount_code_id integer,
    discount_applied numeric
);
 "   DROP TABLE public.order_discount;
       public         heap r       postgres    false                       1259    33609 $   order_discount_order_discount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_discount_order_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.order_discount_order_discount_id_seq;
       public               postgres    false    260            p           0    0 $   order_discount_order_discount_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.order_discount_order_discount_id_seq OWNED BY public.order_discount.order_discount_id;
          public               postgres    false    259            �            1259    33452 
   order_item    TABLE     \  CREATE TABLE public.order_item (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    variant_id integer,
    quantity integer,
    unit_price numeric,
    line_total numeric,
    CONSTRAINT chk_order_item_price CHECK ((unit_price >= (0)::numeric)),
    CONSTRAINT chk_order_item_quantity CHECK ((quantity > 0))
);
    DROP TABLE public.order_item;
       public         heap r       postgres    false            �            1259    33451    order_item_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_item_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.order_item_order_item_id_seq;
       public               postgres    false    240            q           0    0    order_item_order_item_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.order_item_order_item_id_seq OWNED BY public.order_item.order_item_id;
          public               postgres    false    239            �            1259    33428    orders    TABLE     t  CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    shipping_address_id integer,
    billing_address_id integer,
    order_date timestamp without time zone,
    status character varying(15),
    subtotal numeric,
    tax_amount numeric,
    shipping_cost numeric,
    discount_amount numeric,
    total_amount numeric,
    CONSTRAINT chk_order_status CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'processing'::character varying, 'shipped'::character varying, 'delivered'::character varying, 'cancelled'::character varying, 'returned'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            r           0    0    TABLE orders    COMMENT     _   COMMENT ON TABLE public.orders IS 'Main order table with complete order lifecycle management';
          public               postgres    false    238            �            1259    33427    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public               postgres    false    238            s           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public               postgres    false    237            �            1259    33485    payment    TABLE       CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    order_id integer,
    payment_method_id integer,
    payment_date timestamp without time zone,
    amount numeric,
    payment_status character varying(15),
    transaction_id character varying(100),
    gateway_response text,
    CONSTRAINT chk_payment_status CHECK (((payment_status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'failed'::character varying, 'refunded'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.payment;
       public         heap r       postgres    false            �            1259    33476    payment_method    TABLE     �   CREATE TABLE public.payment_method (
    payment_method_id integer NOT NULL,
    method_name character varying(25),
    description text
);
 "   DROP TABLE public.payment_method;
       public         heap r       postgres    false            �            1259    33475 $   payment_method_payment_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_method_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.payment_method_payment_method_id_seq;
       public               postgres    false    242            t           0    0 $   payment_method_payment_method_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.payment_method_payment_method_id_seq OWNED BY public.payment_method.payment_method_id;
          public               postgres    false    241            �            1259    33484    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public               postgres    false    244            u           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public               postgres    false    243            �            1259    33338    product    TABLE     �  CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(50),
    description text,
    base_price numeric,
    stock_quantity integer,
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT chk_product_price CHECK ((base_price >= (0)::numeric)),
    CONSTRAINT chk_product_stock CHECK ((stock_quantity >= 0))
);
    DROP TABLE public.product;
       public         heap r       postgres    false            �            1259    33337    product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.product_product_id_seq;
       public               postgres    false    226            v           0    0    product_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
          public               postgres    false    225            �            1259    33375    product_supplier    TABLE     �   CREATE TABLE public.product_supplier (
    product_supplier_id integer NOT NULL,
    product_id integer,
    supplier_id integer,
    supply_price numeric,
    lead_time_days integer,
    is_primary_supplier boolean
);
 $   DROP TABLE public.product_supplier;
       public         heap r       postgres    false            �            1259    33374 (   product_supplier_product_supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_supplier_product_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.product_supplier_product_supplier_id_seq;
       public               postgres    false    232            w           0    0 (   product_supplier_product_supplier_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.product_supplier_product_supplier_id_seq OWNED BY public.product_supplier.product_supplier_id;
          public               postgres    false    231            �            1259    33352    product_variant    TABLE     O  CREATE TABLE public.product_variant (
    variant_id integer NOT NULL,
    product_id integer,
    variant_name character varying(50),
    description text,
    additional_price numeric,
    stock_quantity integer,
    sku character varying(50),
    is_active boolean,
    CONSTRAINT chk_variant_stock CHECK ((stock_quantity >= 0))
);
 #   DROP TABLE public.product_variant;
       public         heap r       postgres    false            �            1259    33351    product_variant_variant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_variant_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.product_variant_variant_id_seq;
       public               postgres    false    228            x           0    0    product_variant_variant_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.product_variant_variant_id_seq OWNED BY public.product_variant.variant_id;
          public               postgres    false    227            �            1259    33530    returns    TABLE     �   CREATE TABLE public.returns (
    return_id integer NOT NULL,
    order_id integer,
    shipment_id integer,
    return_date date,
    reason character varying(100),
    return_status character varying(20),
    refund_amount numeric
);
    DROP TABLE public.returns;
       public         heap r       postgres    false            �            1259    33529    returns_return_id_seq    SEQUENCE     �   CREATE SEQUENCE public.returns_return_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.returns_return_id_seq;
       public               postgres    false    250            y           0    0    returns_return_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.returns_return_id_seq OWNED BY public.returns.return_id;
          public               postgres    false    249            �            1259    33566    review    TABLE     :  CREATE TABLE public.review (
    review_id integer NOT NULL,
    product_id integer,
    customer_id integer,
    rating numeric(2,1),
    comment text,
    review_date timestamp without time zone,
    is_verified_purchase boolean,
    CONSTRAINT chk_review_rating CHECK (((rating >= 1.0) AND (rating <= 5.0)))
);
    DROP TABLE public.review;
       public         heap r       postgres    false            �            1259    33565    review_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.review_review_id_seq;
       public               postgres    false    254            z           0    0    review_review_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;
          public               postgres    false    253            �            1259    33511    shipment    TABLE     �  CREATE TABLE public.shipment (
    shipment_id integer NOT NULL,
    order_id integer,
    carrier_id integer,
    shipment_date timestamp without time zone,
    tracking_number character varying(50),
    estimated_delivery_date date,
    actual_delivery_date date,
    delivery_status character varying(25),
    shipping_cost numeric,
    CONSTRAINT chk_delivery_status CHECK (((delivery_status)::text = ANY ((ARRAY['pending'::character varying, 'picked_up'::character varying, 'in_transit'::character varying, 'out_for_delivery'::character varying, 'delivered'::character varying, 'failed'::character varying, 'returned'::character varying])::text[])))
);
    DROP TABLE public.shipment;
       public         heap r       postgres    false            �            1259    33510    shipment_shipment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shipment_shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.shipment_shipment_id_seq;
       public               postgres    false    248            {           0    0    shipment_shipment_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.shipment_shipment_id_seq OWNED BY public.shipment.shipment_id;
          public               postgres    false    247            �            1259    33504    shipping_carrier    TABLE     �   CREATE TABLE public.shipping_carrier (
    carrier_id integer NOT NULL,
    carrier_name character varying(50),
    tracking_url_template character varying(200),
    is_active boolean
);
 $   DROP TABLE public.shipping_carrier;
       public         heap r       postgres    false            �            1259    33503    shipping_carrier_carrier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shipping_carrier_carrier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.shipping_carrier_carrier_id_seq;
       public               postgres    false    246            |           0    0    shipping_carrier_carrier_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.shipping_carrier_carrier_id_seq OWNED BY public.shipping_carrier.carrier_id;
          public               postgres    false    245            �            1259    33366    supplier    TABLE     E  CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    company_name character varying(100),
    contact_person character varying(50),
    phone character varying(15),
    email character varying(50),
    address_line_1 character varying(100),
    address_line_2 character varying(100),
    city character varying(50),
    state character varying(50),
    postal_code character varying(20),
    country character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.supplier;
       public         heap r       postgres    false            �            1259    33365    supplier_supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.supplier_supplier_id_seq;
       public               postgres    false    230            }           0    0    supplier_supplier_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;
          public               postgres    false    229            �            1259    33286    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(25),
    last_name character varying(25),
    email character varying(50),
    password character varying(255),
    phone character varying(15),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_login timestamp without time zone,
    user_type character varying(15)
);
    DROP TABLE public.users;
       public         heap r       postgres    false            ~           0    0    TABLE users    COMMENT     i   COMMENT ON TABLE public.users IS 'Base user table for both customers and admins with role-based access';
          public               postgres    false    218                       0    0    COLUMN users.password    COMMENT     u   COMMENT ON COLUMN public.users.password IS 'Bcrypt hashed password - minimum 60 characters for proper hash storage';
          public               postgres    false    218            �            1259    33285    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public               postgres    false    218            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public               postgres    false    217                       1259    33784    v_order_summary    VIEW     �  CREATE VIEW public.v_order_summary AS
 SELECT o.order_id,
    o.customer_id,
    (((u.first_name)::text || ' '::text) || (u.last_name)::text) AS customer_name,
    o.order_date,
    o.status,
    o.subtotal,
    o.tax_amount,
    o.shipping_cost,
    o.discount_amount,
    o.total_amount,
    count(oi.order_item_id) AS total_items,
    sum(oi.quantity) AS total_quantity,
    p.payment_status,
    s.delivery_status
   FROM (((((public.orders o
     JOIN public.customer c ON ((o.customer_id = c.customer_id)))
     JOIN public.users u ON ((c.customer_id = u.user_id)))
     LEFT JOIN public.order_item oi ON ((o.order_id = oi.order_id)))
     LEFT JOIN public.payment p ON ((o.order_id = p.order_id)))
     LEFT JOIN public.shipment s ON ((o.order_id = s.order_id)))
  GROUP BY o.order_id, o.customer_id, u.first_name, u.last_name, o.order_date, o.status, o.subtotal, o.tax_amount, o.shipping_cost, o.discount_amount, o.total_amount, p.payment_status, s.delivery_status;
 "   DROP VIEW public.v_order_summary;
       public       v       postgres    false    240    218    218    218    219    238    238    238    238    238    238    238    238    238    240    240    244    244    248    248            �            1259    33549    wishlist    TABLE     �   CREATE TABLE public.wishlist (
    wishlist_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    added_at timestamp without time zone
);
    DROP TABLE public.wishlist;
       public         heap r       postgres    false            �            1259    33548    wishlist_wishlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wishlist_wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.wishlist_wishlist_id_seq;
       public               postgres    false    252            �           0    0    wishlist_wishlist_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.wishlist_wishlist_id_seq OWNED BY public.wishlist.wishlist_id;
          public               postgres    false    251            0           2604    33319    address address_id    DEFAULT     x   ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);
 A   ALTER TABLE public.address ALTER COLUMN address_id DROP DEFAULT;
       public               postgres    false    221    222    222            ;           2604    33397    cart cart_id    DEFAULT     l   ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);
 ;   ALTER TABLE public.cart ALTER COLUMN cart_id DROP DEFAULT;
       public               postgres    false    233    234    234            <           2604    33409    cart_item cart_item_id    DEFAULT     �   ALTER TABLE ONLY public.cart_item ALTER COLUMN cart_item_id SET DEFAULT nextval('public.cart_item_cart_item_id_seq'::regclass);
 E   ALTER TABLE public.cart_item ALTER COLUMN cart_item_id DROP DEFAULT;
       public               postgres    false    236    235    236            2           2604    33332    category category_id    DEFAULT     |   ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
       public               postgres    false    224    223    224            G           2604    33597    discount_code discount_code_id    DEFAULT     �   ALTER TABLE ONLY public.discount_code ALTER COLUMN discount_code_id SET DEFAULT nextval('public.discount_code_discount_code_id_seq'::regclass);
 M   ALTER TABLE public.discount_code ALTER COLUMN discount_code_id DROP DEFAULT;
       public               postgres    false    258    257    258            F           2604    33588    discount_type discount_type_id    DEFAULT     �   ALTER TABLE ONLY public.discount_type ALTER COLUMN discount_type_id SET DEFAULT nextval('public.discount_type_discount_type_id_seq'::regclass);
 M   ALTER TABLE public.discount_type ALTER COLUMN discount_type_id DROP DEFAULT;
       public               postgres    false    255    256    256            H           2604    33613     order_discount order_discount_id    DEFAULT     �   ALTER TABLE ONLY public.order_discount ALTER COLUMN order_discount_id SET DEFAULT nextval('public.order_discount_order_discount_id_seq'::regclass);
 O   ALTER TABLE public.order_discount ALTER COLUMN order_discount_id DROP DEFAULT;
       public               postgres    false    260    259    260            >           2604    33455    order_item order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_item ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_item_order_item_id_seq'::regclass);
 G   ALTER TABLE public.order_item ALTER COLUMN order_item_id DROP DEFAULT;
       public               postgres    false    239    240    240            =           2604    33431    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    237    238    238            @           2604    33488    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public               postgres    false    243    244    244            ?           2604    33479     payment_method payment_method_id    DEFAULT     �   ALTER TABLE ONLY public.payment_method ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_method_payment_method_id_seq'::regclass);
 O   ALTER TABLE public.payment_method ALTER COLUMN payment_method_id DROP DEFAULT;
       public               postgres    false    241    242    242            5           2604    33341    product product_id    DEFAULT     x   ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);
 A   ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
       public               postgres    false    225    226    226            :           2604    33378 $   product_supplier product_supplier_id    DEFAULT     �   ALTER TABLE ONLY public.product_supplier ALTER COLUMN product_supplier_id SET DEFAULT nextval('public.product_supplier_product_supplier_id_seq'::regclass);
 S   ALTER TABLE public.product_supplier ALTER COLUMN product_supplier_id DROP DEFAULT;
       public               postgres    false    232    231    232            6           2604    33355    product_variant variant_id    DEFAULT     �   ALTER TABLE ONLY public.product_variant ALTER COLUMN variant_id SET DEFAULT nextval('public.product_variant_variant_id_seq'::regclass);
 I   ALTER TABLE public.product_variant ALTER COLUMN variant_id DROP DEFAULT;
       public               postgres    false    228    227    228            C           2604    33533    returns return_id    DEFAULT     v   ALTER TABLE ONLY public.returns ALTER COLUMN return_id SET DEFAULT nextval('public.returns_return_id_seq'::regclass);
 @   ALTER TABLE public.returns ALTER COLUMN return_id DROP DEFAULT;
       public               postgres    false    249    250    250            E           2604    33569    review review_id    DEFAULT     t   ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);
 ?   ALTER TABLE public.review ALTER COLUMN review_id DROP DEFAULT;
       public               postgres    false    253    254    254            B           2604    33514    shipment shipment_id    DEFAULT     |   ALTER TABLE ONLY public.shipment ALTER COLUMN shipment_id SET DEFAULT nextval('public.shipment_shipment_id_seq'::regclass);
 C   ALTER TABLE public.shipment ALTER COLUMN shipment_id DROP DEFAULT;
       public               postgres    false    247    248    248            A           2604    33507    shipping_carrier carrier_id    DEFAULT     �   ALTER TABLE ONLY public.shipping_carrier ALTER COLUMN carrier_id SET DEFAULT nextval('public.shipping_carrier_carrier_id_seq'::regclass);
 J   ALTER TABLE public.shipping_carrier ALTER COLUMN carrier_id DROP DEFAULT;
       public               postgres    false    246    245    246            7           2604    33369    supplier supplier_id    DEFAULT     |   ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);
 C   ALTER TABLE public.supplier ALTER COLUMN supplier_id DROP DEFAULT;
       public               postgres    false    230    229    230            .           2604    33289    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    218    217    218            D           2604    33552    wishlist wishlist_id    DEFAULT     |   ALTER TABLE ONLY public.wishlist ALTER COLUMN wishlist_id SET DEFAULT nextval('public.wishlist_wishlist_id_seq'::regclass);
 C   ALTER TABLE public.wishlist ALTER COLUMN wishlist_id DROP DEFAULT;
       public               postgres    false    252    251    252            =          0    33316    address 
   TABLE DATA           �   COPY public.address (address_id, user_id, address_line_1, address_line_2, city, state, postal_code, country, address_type, is_default, created_at) FROM stdin;
    public               postgres    false    222   E      ;          0    33305    admin 
   TABLE DATA           <   COPY public.admin (admin_id, role, permissions) FROM stdin;
    public               postgres    false    220   �      I          0    33394    cart 
   TABLE DATA           L   COPY public.cart (cart_id, customer_id, created_at, updated_at) FROM stdin;
    public               postgres    false    234   A      K          0    33406 	   cart_item 
   TABLE DATA           f   COPY public.cart_item (cart_item_id, cart_id, product_id, variant_id, quantity, added_at) FROM stdin;
    public               postgres    false    236   �      ?          0    33329    category 
   TABLE DATA           c   COPY public.category (category_id, category_name, description, created_at, updated_at) FROM stdin;
    public               postgres    false    224   	      :          0    33295    customer 
   TABLE DATA           ?   COPY public.customer (customer_id, loyalty_points) FROM stdin;
    public               postgres    false    219   w
      a          0    33594    discount_code 
   TABLE DATA           �   COPY public.discount_code (discount_code_id, discount_type_id, code, description, discount_value, minimum_order_amount, valid_from, valid_till, usage_limit, times_used, is_active) FROM stdin;
    public               postgres    false    258   �
      _          0    33585    discount_type 
   TABLE DATA           Q   COPY public.discount_type (discount_type_id, type_name, description) FROM stdin;
    public               postgres    false    256   �      c          0    33610    order_discount 
   TABLE DATA           i   COPY public.order_discount (order_discount_id, order_id, discount_code_id, discount_applied) FROM stdin;
    public               postgres    false    260   �      O          0    33452 
   order_item 
   TABLE DATA           w   COPY public.order_item (order_item_id, order_id, product_id, variant_id, quantity, unit_price, line_total) FROM stdin;
    public               postgres    false    240   �      M          0    33428    orders 
   TABLE DATA           �   COPY public.orders (order_id, customer_id, shipping_address_id, billing_address_id, order_date, status, subtotal, tax_amount, shipping_cost, discount_amount, total_amount) FROM stdin;
    public               postgres    false    238   b      S          0    33485    payment 
   TABLE DATA           �   COPY public.payment (payment_id, order_id, payment_method_id, payment_date, amount, payment_status, transaction_id, gateway_response) FROM stdin;
    public               postgres    false    244   >      Q          0    33476    payment_method 
   TABLE DATA           U   COPY public.payment_method (payment_method_id, method_name, description) FROM stdin;
    public               postgres    false    242   �      A          0    33338    product 
   TABLE DATA           �   COPY public.product (product_id, product_name, description, base_price, stock_quantity, category_id, created_at, updated_at) FROM stdin;
    public               postgres    false    226   K      G          0    33375    product_supplier 
   TABLE DATA           �   COPY public.product_supplier (product_supplier_id, product_id, supplier_id, supply_price, lead_time_days, is_primary_supplier) FROM stdin;
    public               postgres    false    232   �      C          0    33352    product_variant 
   TABLE DATA           �   COPY public.product_variant (variant_id, product_id, variant_name, description, additional_price, stock_quantity, sku, is_active) FROM stdin;
    public               postgres    false    228   D      Y          0    33530    returns 
   TABLE DATA           v   COPY public.returns (return_id, order_id, shipment_id, return_date, reason, return_status, refund_amount) FROM stdin;
    public               postgres    false    250   �      ]          0    33566    review 
   TABLE DATA           x   COPY public.review (review_id, product_id, customer_id, rating, comment, review_date, is_verified_purchase) FROM stdin;
    public               postgres    false    254   @      W          0    33511    shipment 
   TABLE DATA           �   COPY public.shipment (shipment_id, order_id, carrier_id, shipment_date, tracking_number, estimated_delivery_date, actual_delivery_date, delivery_status, shipping_cost) FROM stdin;
    public               postgres    false    248   �      U          0    33504    shipping_carrier 
   TABLE DATA           f   COPY public.shipping_carrier (carrier_id, carrier_name, tracking_url_template, is_active) FROM stdin;
    public               postgres    false    246   �      E          0    33366    supplier 
   TABLE DATA           �   COPY public.supplier (supplier_id, company_name, contact_person, phone, email, address_line_1, address_line_2, city, state, postal_code, country, created_at, updated_at) FROM stdin;
    public               postgres    false    230   I      9          0    33286    users 
   TABLE DATA           z   COPY public.users (user_id, first_name, last_name, email, password, phone, created_at, last_login, user_type) FROM stdin;
    public               postgres    false    218   �      [          0    33549    wishlist 
   TABLE DATA           R   COPY public.wishlist (wishlist_id, customer_id, product_id, added_at) FROM stdin;
    public               postgres    false    252         �           0    0    address_address_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.address_address_id_seq', 8, true);
          public               postgres    false    221            �           0    0    cart_cart_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cart_cart_id_seq', 57, true);
          public               postgres    false    233            �           0    0    cart_item_cart_item_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cart_item_cart_item_id_seq', 126, true);
          public               postgres    false    235            �           0    0    category_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.category_category_id_seq', 6, true);
          public               postgres    false    223            �           0    0 "   discount_code_discount_code_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.discount_code_discount_code_id_seq', 5, true);
          public               postgres    false    257            �           0    0 "   discount_type_discount_type_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.discount_type_discount_type_id_seq', 4, true);
          public               postgres    false    255            �           0    0 $   order_discount_order_discount_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.order_discount_order_discount_id_seq', 20, true);
          public               postgres    false    259            �           0    0    order_item_order_item_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.order_item_order_item_id_seq', 10, true);
          public               postgres    false    239            �           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 6, true);
          public               postgres    false    237            �           0    0 $   payment_method_payment_method_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.payment_method_payment_method_id_seq', 6, true);
          public               postgres    false    241            �           0    0    payment_payment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_payment_id_seq', 6, true);
          public               postgres    false    243            �           0    0    product_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_product_id_seq', 8, true);
          public               postgres    false    225            �           0    0 (   product_supplier_product_supplier_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.product_supplier_product_supplier_id_seq', 8, true);
          public               postgres    false    231            �           0    0    product_variant_variant_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.product_variant_variant_id_seq', 11, true);
          public               postgres    false    227            �           0    0    returns_return_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.returns_return_id_seq', 1, true);
          public               postgres    false    249            �           0    0    review_review_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.review_review_id_seq', 5, true);
          public               postgres    false    253            �           0    0    shipment_shipment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.shipment_shipment_id_seq', 4, true);
          public               postgres    false    247            �           0    0    shipping_carrier_carrier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.shipping_carrier_carrier_id_seq', 5, true);
          public               postgres    false    245            �           0    0    supplier_supplier_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 8, true);
          public               postgres    false    229            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);
          public               postgres    false    217            �           0    0    wishlist_wishlist_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.wishlist_wishlist_id_seq', 6, true);
          public               postgres    false    251            ^           2606    33322    address address_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public                 postgres    false    222            \           2606    33309    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public                 postgres    false    220            l           2606    33411    cart_item cart_item_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_item_id);
 B   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_pkey;
       public                 postgres    false    236            j           2606    33399    cart cart_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public                 postgres    false    234            `           2606    33336    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public                 postgres    false    224            Z           2606    33299    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public                 postgres    false    219            �           2606    33603 $   discount_code discount_code_code_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.discount_code
    ADD CONSTRAINT discount_code_code_key UNIQUE (code);
 N   ALTER TABLE ONLY public.discount_code DROP CONSTRAINT discount_code_code_key;
       public                 postgres    false    258            �           2606    33601     discount_code discount_code_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.discount_code
    ADD CONSTRAINT discount_code_pkey PRIMARY KEY (discount_code_id);
 J   ALTER TABLE ONLY public.discount_code DROP CONSTRAINT discount_code_pkey;
       public                 postgres    false    258            �           2606    33592     discount_type discount_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.discount_type
    ADD CONSTRAINT discount_type_pkey PRIMARY KEY (discount_type_id);
 J   ALTER TABLE ONLY public.discount_type DROP CONSTRAINT discount_type_pkey;
       public                 postgres    false    256            �           2606    33617 "   order_discount order_discount_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.order_discount
    ADD CONSTRAINT order_discount_pkey PRIMARY KEY (order_discount_id);
 L   ALTER TABLE ONLY public.order_discount DROP CONSTRAINT order_discount_pkey;
       public                 postgres    false    260            p           2606    33459    order_item order_item_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id);
 D   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
       public                 postgres    false    240            n           2606    33435    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    238            r           2606    33483 "   payment_method payment_method_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (payment_method_id);
 L   ALTER TABLE ONLY public.payment_method DROP CONSTRAINT payment_method_pkey;
       public                 postgres    false    242            t           2606    33492    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public                 postgres    false    244            b           2606    33345    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public                 postgres    false    226            h           2606    33382 &   product_supplier product_supplier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT product_supplier_pkey PRIMARY KEY (product_supplier_id);
 P   ALTER TABLE ONLY public.product_supplier DROP CONSTRAINT product_supplier_pkey;
       public                 postgres    false    232            d           2606    33359 $   product_variant product_variant_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_pkey PRIMARY KEY (variant_id);
 N   ALTER TABLE ONLY public.product_variant DROP CONSTRAINT product_variant_pkey;
       public                 postgres    false    228            z           2606    33537    returns returns_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (return_id);
 >   ALTER TABLE ONLY public.returns DROP CONSTRAINT returns_pkey;
       public                 postgres    false    250            ~           2606    33573    review review_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);
 <   ALTER TABLE ONLY public.review DROP CONSTRAINT review_pkey;
       public                 postgres    false    254            x           2606    33518    shipment shipment_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipment_id);
 @   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_pkey;
       public                 postgres    false    248            v           2606    33509 &   shipping_carrier shipping_carrier_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.shipping_carrier
    ADD CONSTRAINT shipping_carrier_pkey PRIMARY KEY (carrier_id);
 P   ALTER TABLE ONLY public.shipping_carrier DROP CONSTRAINT shipping_carrier_pkey;
       public                 postgres    false    246            f           2606    33373    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public                 postgres    false    230            V           2606    33294    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            X           2606    33292    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            |           2606    33554    wishlist wishlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (wishlist_id);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public                 postgres    false    252            �           2606    33323    address address_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_user_id_fkey;
       public               postgres    false    222    3672    218            �           2606    33310    admin admin_admin_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.users(user_id);
 C   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_admin_id_fkey;
       public               postgres    false    218    220    3672            �           2606    33400    cart cart_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 D   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_customer_id_fkey;
       public               postgres    false    3674    219    234            �           2606    33412     cart_item cart_item_cart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);
 J   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_cart_id_fkey;
       public               postgres    false    236    3690    234            �           2606    33417 #   cart_item cart_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 M   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_product_id_fkey;
       public               postgres    false    3682    226    236            �           2606    33422 #   cart_item cart_item_variant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variant(variant_id);
 M   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_variant_id_fkey;
       public               postgres    false    3684    236    228            �           2606    33300 "   customer customer_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.users(user_id);
 L   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_customer_id_fkey;
       public               postgres    false    218    219    3672            �           2606    33604 1   discount_code discount_code_discount_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discount_code
    ADD CONSTRAINT discount_code_discount_type_id_fkey FOREIGN KEY (discount_type_id) REFERENCES public.discount_type(discount_type_id);
 [   ALTER TABLE ONLY public.discount_code DROP CONSTRAINT discount_code_discount_type_id_fkey;
       public               postgres    false    258    256    3712            �           2606    33779    admin fk_admin_user    FK CONSTRAINT     x   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fk_admin_user FOREIGN KEY (admin_id) REFERENCES public.users(user_id);
 =   ALTER TABLE ONLY public.admin DROP CONSTRAINT fk_admin_user;
       public               postgres    false    220    218    3672            �           2606    33623 3   order_discount order_discount_discount_code_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_discount
    ADD CONSTRAINT order_discount_discount_code_id_fkey FOREIGN KEY (discount_code_id) REFERENCES public.discount_code(discount_code_id);
 ]   ALTER TABLE ONLY public.order_discount DROP CONSTRAINT order_discount_discount_code_id_fkey;
       public               postgres    false    258    3716    260            �           2606    33618 +   order_discount order_discount_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_discount
    ADD CONSTRAINT order_discount_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 U   ALTER TABLE ONLY public.order_discount DROP CONSTRAINT order_discount_order_id_fkey;
       public               postgres    false    3694    260    238            �           2606    33460 #   order_item order_item_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 M   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_order_id_fkey;
       public               postgres    false    238    3694    240            �           2606    33465 %   order_item order_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 O   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_product_id_fkey;
       public               postgres    false    226    3682    240            �           2606    33470 %   order_item order_item_variant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variant(variant_id);
 O   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_variant_id_fkey;
       public               postgres    false    228    3684    240            �           2606    33446 %   orders orders_billing_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES public.address(address_id);
 O   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_billing_address_id_fkey;
       public               postgres    false    222    3678    238            �           2606    33436    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public               postgres    false    238    3674    219            �           2606    33441 &   orders orders_shipping_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipping_address_id_fkey FOREIGN KEY (shipping_address_id) REFERENCES public.address(address_id);
 P   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_shipping_address_id_fkey;
       public               postgres    false    238    222    3678            �           2606    33493    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public               postgres    false    244    3694    238            �           2606    33498 &   payment payment_payment_method_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(payment_method_id);
 P   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_payment_method_id_fkey;
       public               postgres    false    244    3698    242            �           2606    33346     product product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_category_id_fkey;
       public               postgres    false    226    3680    224            �           2606    33383 1   product_supplier product_supplier_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT product_supplier_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 [   ALTER TABLE ONLY public.product_supplier DROP CONSTRAINT product_supplier_product_id_fkey;
       public               postgres    false    3682    232    226            �           2606    33388 2   product_supplier product_supplier_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT product_supplier_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 \   ALTER TABLE ONLY public.product_supplier DROP CONSTRAINT product_supplier_supplier_id_fkey;
       public               postgres    false    3686    232    230            �           2606    33360 /   product_variant product_variant_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 Y   ALTER TABLE ONLY public.product_variant DROP CONSTRAINT product_variant_product_id_fkey;
       public               postgres    false    226    228    3682            �           2606    33538    returns returns_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 G   ALTER TABLE ONLY public.returns DROP CONSTRAINT returns_order_id_fkey;
       public               postgres    false    250    3694    238            �           2606    33543     returns returns_shipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES public.shipment(shipment_id);
 J   ALTER TABLE ONLY public.returns DROP CONSTRAINT returns_shipment_id_fkey;
       public               postgres    false    248    3704    250            �           2606    33579    review review_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 H   ALTER TABLE ONLY public.review DROP CONSTRAINT review_customer_id_fkey;
       public               postgres    false    219    3674    254            �           2606    33574    review review_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 G   ALTER TABLE ONLY public.review DROP CONSTRAINT review_product_id_fkey;
       public               postgres    false    226    3682    254            �           2606    33524 !   shipment shipment_carrier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_carrier_id_fkey FOREIGN KEY (carrier_id) REFERENCES public.shipping_carrier(carrier_id);
 K   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_carrier_id_fkey;
       public               postgres    false    3702    248    246            �           2606    33519    shipment shipment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_order_id_fkey;
       public               postgres    false    248    238    3694            �           2606    33555 "   wishlist wishlist_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 L   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_customer_id_fkey;
       public               postgres    false    3674    219    252            �           2606    33560 !   wishlist wishlist_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 K   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_product_id_fkey;
       public               postgres    false    226    252    3682            =   �  x�}��R�0��7Oq����w$3@&d�@����
V�HT����(�;-M�N��;G��}��B&8o�v�7p�7mM.5���XQ�mm�ٺ��\KƠ��m;rP���*e<�9+�.������֠`:���:Ӷ�0�3���u�`_(����_1���v����Ȯ��r�6ԡ�Zw*��s�&�p�������@�������
��#R����1�,O�6�]IX�h}�菉`Ǩr^�!*
�k��H��nL��qMao�c��r�;�.'#S�P��g�~r>�Np�+Ӝ�95>?C�mGpvl��s���Bw���d<�Ecw���Vg��.�U��l��ѳ�Y���N�jY�q�P�8�7
�*W 4���r9Z�>�L&��f      ;   T   x�3�.-H-RpL����L����(�O)M.Q�M�KLO-�,���u�KR��2S�u2��R�J�*�8�AF$�M����� c�)      I   O   x�]��	�0��^ Er�x��?G���{:N�Bqx4zsQ'
��Q��iv�w�0��]�a�|IlN�/s��}���`�      K   l   x�]��� ��0��MBK��	���R�U>�d�����6p�fh�r���2,̗(�u��W��Q�w�MpH{nh�c��snు/Q�(ü�z��)�/Բ"e      ?   K  x��R1n�0��Wp����4q���n]��ˢ+�-���NPt�䉂���,�ɢ��� ��B�7�0�`e�O�F�c �4�/�R{� �U�Y�6�r�v_�b��꺪��uU��mV���h�5��KM��I;�t��;Pw>�C�.�oNa�(CV{t3�+qN���(*�ʜyh�j��]��� �}oI��v�5c�F�~��Z�� NzP���2����m�-5��@޼&��k,3S|#�(m4�����ȡØ �ВS�c�F
C�i��������Ț���x��� ��T��s�~�H�v���դ�CԜ��,hP���2˲C?׳      :   9   x���� �7�p���K��#���BǊ٨��p`G+�m�|0s�B厍��H�X�
9      a     x���AK�0���_1�=�L��{�j/��j/^�m���)MW������
�0��&ɗ�F���i�jS	Al]��C?a�G��+��2"�D��S\H���	�*�R����oqCh�)� ���7��+;a2�=��Cߣ[���ѿ؏�>��W,#��FF��؞)/����k1v���Qnķՙ��'�5E��K�.��ZSnnc�,6���a����^���yDH�͐�g0�e�SQ��4(XW�����Gk1<�ap�ӯ!Ο���xtr��C�$��Kz�      _   �   x�=�K�0��)|$>�BeY�n�X�["�IH�ޞ�-����Y�5;����$���du�$< %��>Q����jͧH׹�v�90#�+~/�ےpVm,��eB0n�(�T�w&k�e��HpQM^�s�w�:UX��t����U��-����	� ���Nd      c   4   x�34�4BS=.CNcN#̳�4BC����)�k���qqq 96	�      O   w   x�=��� �3[L��D*H�ud=,�4��k�\��"~�uU�LT��?��%e��
G2�)݇�?v�2(#��
9�ɁP����X�&�ebSF����8`�����r&���r*�      M   �   x�e�[� E�an@33<D�ҟFIkb�Ѥ�� Ji�Mx��(0��t�ԢiP{@La��a�p��K'i1�Wg(]J$���A�h~Y��gi"���>dDh΅V�^'��-
�]|�N>ʈ��b�$O��m��8��!�P�T���3���aL�)(j`��$EP�N��� d$9N鎵�"k��cXf՟T���n����CV�      S   3  x�]��n�0Fg�)��ߐd$ea��c�v���Av�O�AQ+J���8��&Ԃ���U-u�)���%��;?zG�R�bUVdoν�#��Z�s;up
��riL>PAQO� �kɮ`���?��}2���?�C�y�oa��|N>��$yC͢�7Z��m���U���lL>�M����bR�U觟�%pQ�[z!�G]�?�i��XO��]@�I�4�.f(;M5R�k9��I%���;/ kaL&��'����,H�$Cϲf7��ۓo��C
�K�D�qL�qx����KJ�{�Y      Q   �   x�}�K�0D��)|�вAT��b�&FD��JB����Ć��y��Dm�Px@�
mk2�#�Լ�F�4�A*K��#�&'����d�x�dÝ=�ڳ�X�"I��'Sla�rS6�b�@N�^�l�y�u@5����n�	y׮w�Q������~��{H�����d�wԠ�Do!�<zf,      A   �  x�m��n�0E��W�(IK���	��6E7݌e�b͇�G��;�;@,��q�\J�hcvk�E�o{�W%{��b��H�Ҷ�N�N���o�!&p�
������ ��*c�KТU�oF�Ӟ�Wt]r�ʊ	&�,/��8o��0'䅨@�f��M$���p�����m�ޱ砬���I��SK0}J�:
sҫl�7:&tR������6h�"�p�c	I#��<Q5r���'�!�sPD�7*�;���wM�v��M�����T@y*�Z[l���"�[��< ֜MG�A��|�USV=_ɞ�%�o�n7*�5&�̯���zMJ�^`�O���=��W�6:v$�1~��Q)Y�ٱ���5���P��i���h��ϰ��B��"�;o�p�;%�S,��@6�������ҡ{�=׀�{�d�s�h� Ќ]���&?�]�Qm�nI.����9��%��j��<�*�X�")a	q�i�F��D}�S�Yul�Y;� fM9��ݒO�%��sH�n|J��M?�Z�
�W��PI�M�[�{��0��*29Z�:ZZ�� �M5(R�;���_;M'�[z*���pAG�[�u؍a{Po�ܫ�
�=��J��~L��FTG��mεgF������L&�9�V�      G   U   x�5�� !D��P���-c��2���^��U+U��b���EQ�KZ`��%��-Y0�,6�	fwǋ������D�O�:      C   �  x���]O�0��ï8?��n���LĨ/��[��}��请�Ƙ���go{�	�v踓Y <-�l�3���;�l�2�:�I��u�+�@��K��_�&A8'&��z��Z�J׉�i���������u)�e�_J�-\�Z�a��x��������µ(�&C	.D,��[�c�	�gX�R�^�-��'W�~��B~4�=
�[�����dap��2}�eW���zt���zoD�
�dt�:�_�;�!�ʏ�C30K�e��~oJE��S�;����0�o<��Ȥ���#���֝����s�LbV��q�h��ge��61]�4�<��*$��}�]��f'��r�s�^������m���m���`S%xj���V��U�ډԴG�{N����σ^��	���      Y   F   x�3�4���4202�54�5��t.-.��M-RH�H�KOMQ���K�L,((�/KM�4210�30������ 	��      ]   �  x�u��n�0E��W�HI����I
} mw݌űD�"U�����HNo
.�!��{��*�ԺQO�-;�>c�g�6��"SFKG¯��͋�3���������7���݂�m��N!"��1ږ�w�UUT�mYݖ���C��B�]����B=0Mٞ&��=��p4{�%�y�O�9Zr��&�)�L�X�i|�x�6o�4I��R�W�=�/.佺Ww��P/!̔z��Z��)�z��e<rg� ]�r���� �h|!�I^����Q"�8�o��ߡ,�[�Z�����Q��Q|Q�)M��
V�R7�y::�x`���w�[af>��!�ӆ�`n���CY�7�jT�9tL?����.UoЭFF�I�پ���EV�!�ퟶE�cV���0��n�^l�o      W   �   x�M��
�0Eד����#I�lŝhA�� ]���%afq�3�!�4�l:⎜����p%c��C-�xί�3o��GTy��DQ2�t�?8k��sR#74��& �:M&����dX�3,�}��{��)�C��G�1�X�ռ�F�8��z����?�      U   �   x�3�q��())(���///�+I.�K���+��/)JL���Kׯ����Js�R�j9K��8}R��R���K�2S����@%�!� ��e����Y\����_\7� 1� ��K�/���&��j
�E���p��y(^��Ք�91'��@A$��=... '�xX      E   �  x����n�0E��Wp�XЋ����I�Ćk�(Pt32	��$�����gh'N�vgt)P޹s�F��ƺvK����F�jc�v��ВI��
^�|��8&,	�8I�u]W+a��p=�vdY���-g�)�����(��� �޺��ԃ0t���;0�������,Cr|;c6�0Ni�_F�eT�eY��h��Q2�ɝ����S�ja�}�I)�Ѻ���}i�Mc7y��,'�pa�x��ltC����A��J�Z<����Օ0[:���=HmY��7T��Yv��,�W�EǮ��\5�����?(Fb�8�4E!��qF4����[?�(�-��,XSR�]�U[�����>�bP���Ӧ�G �%s��7��dg��w���4/FD<�ck���<V{j�����D�E����8�(��9�z���l��tU��D:�7��Tܡ4�'�r��Q��Ύ�C	�Kʆ�w�
W�ne��ʍo����|�3rGT�=T�@���5-���(�	!�Y�(cy��/�E5���G\N�I��%�~���+KVh��oTЪ�ژe���Qj�	%��������=�O�?�̙C���S�/n
tc�#1J|���#d�"M;D�3���{����/�so�N��������W�̭�      9      x�e�[w�<����»o��@p����c����7QQP������/Zk;W3�2�w���y0���"��6v�B��#P'�:&���D����zuD���F޹���4&�g�"���`&CGX�L�ȡ�AH}�D'HÆCH�m��YyI���ȂH���l�
�e����'�;>rI�?���I�����A�E2($�u��&3h�T�G���w$lk�tv�D���"��4� DUE4���8��;�H�qo}�M�;4���ܲ�:Sq�H�r��4����g/�p%����QQ���l�an�U�f��桗�'>�� u�VFt��¡:b�z�}�0�4��a�'�Tg�'�i ���o�l�M���h�x�;��;�t��yg��U���H
���N��kȒ��-*��A5,D"*C�2���+���b������38ug{��8-��(��.���#��lU��҅��4��<�$xy�ì�ap�<�v����5������`���<�Y�\�����-S�:�k����"8���� �2���-�e�B{k�ѷ��}�!��:�Yu�1��r���OY�V�]�c_���+x�E%�8��8>T��8�C��|����.��q��X��h�-{:��~�>/��A�<5]�0�k����R1ie�0�xi��9�MlR�_�H���r=?��P�k߶�uJ.���>�_�	J&3�:K߼xF<�ۂ�c;��`�����=w�] �GѲ�u�wȄ̲����
�C14��P���Z����      [   [   x�E��� D�sRE��&4���r�7�A��L-
�@-MS�mHl1A�/q����d�)A��O��Z��e|<����o	AO_��`��}     