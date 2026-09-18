-- Migration V5: High Density Seed Datasets Initialization
INSERT INTO customers (name, email, password_hash) VALUES 
('Abdiwadud Suleiman', 'abdiwadud@example.com', '$2b$12$K3lh7yR9PqE8ZmBvN7zXLe1Y2o3u4i5o6p7q8r9s0t1u2v3w4x5y6'),
('Jane Doe', 'jane.doe@example.com', '$2b$12$M5nj8zS0QrF9AnCwO8wYMf2Z3p4q5w6e7r8t9y0u1i2o3p4[...]');

INSERT INTO products (name, description, price, stock_count, category)
SELECT 
    'Premium Item Model ' || i,
    'High performance retail evaluation testing commodity catalog description for item ' || i,
    (random() * 450 + 10)::numeric(10,2),
    (random() * 150)::int,
    (ARRAY['Electronics', 'Apparel', 'Home', 'Books'])[ceil(random() * 4)]
FROM generate_series(1, 5000) i;

INSERT INTO shopping_carts (customer_id, items) VALUES 
(1, '[{"product_id": 12, "quantity": 1, "color": "slate grey"}]'),
(2, '[{"product_id": 140, "quantity": 3, "gift_wrap": true}]');
