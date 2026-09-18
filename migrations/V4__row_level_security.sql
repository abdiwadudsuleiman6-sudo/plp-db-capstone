-- Migration V4: Row-Level Security Policies Matrix
ALTER TABLE customers ENABLE ROW_LEVEL_SECURITY;
ALTER TABLE shopping_carts ENABLE ROW_LEVEL_SECURITY;

-- FIXED: Connection-pool safe implementation using current_setting
CREATE POLICY customer_user_isolation_policy ON customers
    FOR ALL TO public
    USING (id::text = current_setting('app.current_user_id', true));

CREATE POLICY cart_user_isolation_policy ON shopping_carts
    FOR ALL TO public
    USING (customer_id::text = current_setting('app.current_user_id', true));
