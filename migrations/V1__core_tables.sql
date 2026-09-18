-- Migration V1: Core Table Foundations Layout
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL DEFAULT 'placeholder_hash',
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock_count INT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE shopping_carts (
    customer_id INT PRIMARY KEY REFERENCES customers(id) ON DELETE CASCADE,
    items JSONB DEFAULT '[]',
    updated_at TIMESTAMPTZ DEFAULT now()
);
