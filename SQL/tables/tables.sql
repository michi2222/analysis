CREATE TABLE sqlprojekt.products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price NUMERIC NOT NULL
);

select * from sqlprojekt.products;



CREATE TABLE sqlprojekt.customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    region TEXT NOT NULL,
    registration_date DATE NOT NULL
);

select * from sqlprojekt.customers;

CREATE TABLE sqlprojekt.orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES sqlprojekt.customers(customer_id)
);

select * from sqlprojekt.orders;



CREATE TABLE sqlprojekt.order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC NOT NULL,
    FOREIGN KEY (order_id) REFERENCES sqlprojekt.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES sqlprojekt.products(product_id)
);

select * from sqlprojekt.order_items;
