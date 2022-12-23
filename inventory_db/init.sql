
-- Registered Ports
CREATE TABLE IF NOT EXISTS port (
port_id SMALLSERIAL PRIMARY KEY,
port_name VARCHAR(50) NOT NULL,
port_code VARCHAR(60) NOT NULL
);

-- Districts
CREATE TABLE IF NOT EXISTS district (
district_id SERIAL PRIMARY KEY,
district_name VARCHAR(70) NOT NULL,
nearest_port SMALLINT REFERENCES port(port_id) NOT NULL,
district_latitude NUMERIC(8,6) NOT NULL,
district_longitude NUMERIC(9,6) NOT NULL
);

-- Districts Pin Codes
CREATE TABLE IF NOT EXISTS pincode_district (
pincode INTEGER PRIMARY KEY NOT NULL,
district_id INTEGER REFERENCES district (district_id) NOT NULL
);

-- Registered FC
CREATE TABLE IF NOT EXISTS fulfillment_center (
fc_id SERIAL PRIMARY KEY,
fc_name VARCHAR(50) NOT NULL UNIQUE,
district_id INTEGER REFERENCES district (district_id) NOT NULL
);

-- Sellers
CREATE TABLE IF NOT EXISTS seller (
seller_id SERIAL PRIMARY KEY,
seller_name VARCHAR(50) NOT NULL UNIQUE,
seller_username VARCHAR(100) NOT NULL UNIQUE,
seller_password VARCHAR(100) NOT NULL,
seller_salt VARCHAR(50) NOT NULL,
last_login_time BIGINT
);

-- Item Categories
CREATE TABLE IF NOT EXISTS item_categories (
item_category_id SERIAL PRIMARY KEY,
item_category_name VARCHAR(40) NOT NULL UNIQUE
);

-- Items
CREATE TABLE IF NOT EXISTS item (
item_id SERIAL PRIMARY KEY,
item_category_id INTEGER REFERENCES item_categories (item_category_id),
item_name VARCHAR(100) NOT NULL,
item_description TEXT DEFAULT '',
item_added_date BIGINT NOT NULL,
item_last_updated BIGINT NOT NULL,
item_media TEXT DEFAULT NULL
);

-- FC Inventory
CREATE TABLE IF NOT EXISTS fc_inventory (
fc_inventory_id SERIAL PRIMARY KEY,
fc_id INTEGER REFERENCES fulfillment_center (fc_id),
item_id INTEGER REFERENCES item (item_id),
fc_inventory_count INTEGER NOT NULL DEFAULT 0,
seller_id INTEGER REFERENCES seller (seller_id)
);

-- Seller Item Sold Location
CREATE TABLE IF NOT EXISTS seller_item_sold_agg (
seller_item_sold_agg_id SERIAL PRIMARY KEY,
item_id INTEGER REFERENCES item (item_id),
destination_fc_id INTEGER REFERENCES fulfillment_center (fc_id),
item_count INTEGER NOT NULL
);

-- Seller Item Sold Per Month
CREATE TABLE IF NOT EXISTS seller_item_sold_per_month_agg (
seller_item_sold_per_month_agg_id SERIAL PRIMARY KEY,
item_id INTEGER REFERENCES item (item_id),
month_year VARCHAR (30) NOT NULL,
item_count INTEGER NOT NULL
);

-- ITEMS IN TRANSIT BETWEEN FC
CREATE TABLE IF NOT EXISTS items_bw_fc (
item_bw_fc_id SERIAL PRIMARY KEY,
item_count INTEGER NOT NULL,
package_id INTEGER NOT NULL,
order_id INTEGER NOT NULL,
source_fc_id INTEGER REFERENCES fulfillment_center (fc_id),
intermediate_source_fc_id INTEGER REFERENCES fulfillment_center (fc_id),
intermediate_destination_fc_id INTEGER REFERENCES fulfillment_center (fc_id),
final_fc INTEGER REFERENCES fulfillment_center (fc_id)
);

-- ITEMS CURRENTLY IN TRANSIT FOR DELIVERY FROM FC
CREATE TABLE IF NOT EXISTS items_to_delivery (
items_to_delivery_id SERIAL PRIMARY KEY,
item_count INTEGER NOT NULL,
fc_id INTEGER REFERENCES fulfillment_center (fc_id),
package_id INTEGER NOT NULL,
order_id INTEGER NOT NULL
);

-- Item Quantity Agg
CREATE TABLE IF NOT EXISTS item_agg (
item_agg_id SERIAL PRIMARY KEY,
item_id INTEGER REFERENCES item (item_id),
approx_count INTEGER NOT NULL
);