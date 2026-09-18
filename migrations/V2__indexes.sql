-- Migration V2: Optimization Indices Mapping
ALTER TABLE products ADD COLUMN search_vec TSVECTOR;

CREATE INDEX idx_products_search ON products USING GIN (search_vec);
CREATE INDEX idx_carts_items ON shopping_carts USING GIN (items);
