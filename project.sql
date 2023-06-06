create database ecommerce;

use ecommerce;

create table customers(
customer_id varchar(255),
customer_unique_id varchar(255),
customer_zip_code_prefix int unsigned,
customer_city varchar(255),
customer_state char(100));

CREATE TABLE customers1 (
  customer_id text,
  customer_unique_id text,
  customer_zip_code_prefix int,
  customer_city text,
  customer_state text
);


select * from customers;

LOAD DATA INFILE "olist_customers_dataset.csv"  INTO TABLE customers FIELDS TERMINATED BY ',' IGNORE 1 LINES;

select * from customers;

create table geolocation(
geolocation_zip_code_prefix text,
geolocation_lat double,
geolocation_lng double,
geolocation_city varchar(255),
geolocation_state text);

LOAD DATA INFILE "olist_geolocation_dataset.csv"  INTO TABLE geolocation FIELDS TERMINATED BY ',' IGNORE 1 LINES;

create table items(
order_id text,
order_item_id int,
product_id text,
seller_id text,
shipping_limit_date text,
price double,
freight_value double);

LOAD DATA INFILE "olist_order_items_dataset.csv"  INTO TABLE items FIELDS TERMINATED BY ',' IGNORE 1 LINES;

create table payments(
order_id text,
payment_sequential int,
payment_type text,
payment_installments int,
payment_value double);

LOAD DATA INFILE "olist_order_payments_dataset.csv"  INTO TABLE payments FIELDS TERMINATED BY ',' IGNORE 1 LINES;

create table orders_dataset(
order_id text,
customer_id text,
order_status text,
order_purchase_timestamp text,
order_approved_at text,
order_delivered_carrier_date text,
order_delivered_customer_date text,
order_estimated_delivery_date text);

LOAD DATA INFILE "olist_orders_dataset.csv"  INTO TABLE orders_dataset FIELDS TERMINATED BY ',' IGNORE 1 LINES;


drop table reviews;
create table reviews(
review_id text,
order_id text,
review_score text,
review_comment_title text,
review_comment_message text,
review_creation_date text,
review_answer_timestamp text);

LOAD DATA INFILE "olist_order_reviews_dataset.csv"  INTO TABLE reviews 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

create table products(
product_id text,
product_category_name text,
product_name_lenght int,
product_description_lenght int,
product_photos_qty int,
product_weight_g int,
product_length_cm int,
product_height_cm int,
product_width_cm int);

LOAD DATA INFILE 'olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ',,,,,,,,,,,,,,,,,,,,,,,'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@product_id, @product_category_name, @product_name_lenght, @product_description_lenght, @product_photos_qty, @product_weight_g, @product_length_cm, @product_height_cm, @product_width_cm)
SET product_id = @product_id,
    product_category_name = @product_category_name,
    product_name_lenght = COALESCE(NULLIF(@product_name_lenght, ''), 0),
    product_description_lenght = COALESCE(NULLIF(@product_description_lenght, ''), 0),
    product_photos_qty = @product_photos_qty,
    product_weight_g = @product_weight_g,
    product_length_cm = @product_length_cm,
    product_height_cm = @product_height_cm,
    product_width_cm = @product_width_cm;

create table seller(
seller_id text,
seller_zip_code_prefix text,
seller_city text,
seller_state text);











