-- Migration V4: Row-Level Security Policies Matrix
ALTER TABLE customers ENABLE ROW_LEVEL_SECURITY;
ALTER TABLE shopping_carts ENABLE ROW_LEVEL_SECURITY;

CREATE POLICY customer_user_isolation_policy ON customers FOR ALL TO public USING (email = current_user);
CREATE POLICY cart_user_isolation_policy ON shopping_carts FOR ALL TO public USING (customer_id = (SELECT id FROM customers WHERE email = current_user));
