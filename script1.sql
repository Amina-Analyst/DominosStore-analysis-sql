use dominos_analysis;



ALTER TABLE pizza_types 
    MODIFY pizza_type_id VARCHAR(50);

ALTER TABLE pizzas 
    MODIFY pizza_id VARCHAR(50),
    MODIFY pizza_type_id VARCHAR(50);

ALTER TABLE order_details
    MODIFY pizza_id VARCHAR(50);
    
alter table orders
modify order_date date;

ALTER TABLE orders
MODIFY order_time TIME;


-- ============================
-- PRIMARY KEYS
-- ============================
alter table pizzas
add constraint pizzas_pkey 
primary key (pizza_id(100));

ALTER TABLE pizza_types
    ADD CONSTRAINT pizza_types_pkey
    PRIMARY KEY (pizza_type_id);

ALTER TABLE customers
    ADD CONSTRAINT customers_pkey
    PRIMARY KEY (custid);

ALTER TABLE orders
    ADD CONSTRAINT orders_pkey
    PRIMARY KEY (order_id);

ALTER TABLE order_details
    ADD CONSTRAINT order_details_pkey
    PRIMARY KEY (order_details_id);


-- ============================
-- FOREIGN KEYS
-- ============================

-- pizzas → pizza_types
ALTER TABLE pizzas
    ADD CONSTRAINT fk_pizzas_pizza_types
    FOREIGN KEY (pizza_type_id)
    REFERENCES pizza_types(pizza_type_id);

-- orders → customers
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customers
    FOREIGN KEY (custid)
    REFERENCES customers(custid);

-- order_details → pizzas
ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_pizzas
    FOREIGN KEY (pizza_id)
    REFERENCES pizzas(pizza_id);

-- order_details → orders
ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id);

