-- Customer
CREATE TABLE IF NOT EXISTS customer (
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL UNIQUE,
customer_username VARCHAR(100) NOT NULL UNIQUE,
customer_password VARCHAR(100) NOT NULL,
customer_mobile VARCHAR(11) NOT NULL UNIQUE,
customer_salt VARCHAR(50) NOT NULL,
last_login_time BIGINT NOT NULL
);

-- Customer Addresses
CREATE TABLE IF NOT EXISTS customer_address (
customer_address_id SERIAL PRIMARY KEY,
customer_id INTEGER REFERENCES customer (customer_id),
pincode INTEGER NOT NULL,
contact_name VARCHAR(50) NOT NULL UNIQUE,
contact_number VARCHAR(11) NOT NULL UNIQUE,
address VARCHAR(150) NOT NULL
);

-- ORDER
CREATE TABLE IF NOT EXISTS orders (
order_id SERIAL PRIMARY KEY,
customer_id INTEGER REFERENCES customer (customer_id),
delivery_address_id INTEGER REFERENCES customer_address (customer_address_id),
order_date BIGINT NOT NULL,
price VARCHAR(8) NOT NULL
);

-- INDIVIDUAL PACKAGE FROM ORDER
CREATE TABLE IF NOT EXISTS package (
package_id SERIAL PRIMARY KEY,
order_id INTEGER REFERENCES orders (order_id),
item_id INTEGER NOT NULL,
item_count INTEGER NOT NULL,
package_cost VARCHAR(8) NOT NULL
);

-- Item Categories
CREATE TABLE IF NOT EXISTS item_categories (
item_category_id SERIAL PRIMARY KEY,
item_category_name VARCHAR(40) NOT NULL UNIQUE
);
