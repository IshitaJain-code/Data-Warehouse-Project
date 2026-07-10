/*
==============================================================================================================
DDL Script: Create Bronze Table
==============================================================================================================
Script Purpose:
       This script creates table in the 'bronze' schema, dropping existing tables
       if they already exists.
       Run this Script to re-define the DDL structure of 'bronze' Tables
==============================================================================================================
*/
DROP TABLE IF EXISTS bronze.crm_customers;

CREATE TABLE bronze.crm_customers(
          customer_id VARCHAR(50),
          customer_name VARCHAR(50),
          gender VARCHAR(50),
          age INT,
	      city VARCHAR(50),
          state VARCHAR(50),
          signup_date DATE,
          skin_type VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_products; 

CREATE TABLE bronze.erp_products(
          brand_name VARCHAR(50),
          product_id VARCHAR(50),
          image_url TEXT,
          in_stock BOOLEAN,
          mrp NUMERIC(10,2),
          price NUMERIC(10,2),
          product_title VARCHAR(150),
          rating NUMERIC(3,2),
          rating_count INT,
          tags TEXT,
          product_url TEXT,
          listing_page_name VARCHAR(150),
          listing_url TEXT,
          listing_page_no INT
);

DROP TABLE IF EXISTS bronze.erp_orders;

CREATE TABLE bronze.erp_orders(
           order_id VARCHAR(50),
           customer_id VARCHAR(50),
           order_date TIMESTAMP,
           order_status VARCHAR(20),
           payment_methods VARCHAR(20),
           promotions_id VARCHAR(20),
           shipping_free NUMERIC(10,2),
           is_gift BOOLEAN
);

DROP TABLE IF EXISTS bronze.erp_order_items;

CREATE TABLE bronze.erp_order_items(
           order_item_id VARCHAR(20),
           order_id VARCHAR(50),
           product_id VARCHAR(50),
           quantity NUMERIC,
           mrp NUMERIC(10,2),
           unit_selling_price NUMERIC(10,2),
           gross_amount NUMERIC(10,2),
           discount_amount NUMERIC(10,2),
           net_amount NUMERIC(10,2)
);

DROP TABLE IF EXISTS bronze.erp_returns;
 
CREATE TABLE bronze.erp_returns(
           return_id VARCHAR(20),
           order_item_id VARCHAR(20),
           return_date DATE ,
           return_reason TEXT,
           return_status VARCHAR(30),
           refund_amount NUMERIC(10,2)
);
