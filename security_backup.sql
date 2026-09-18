-- Capstone Phase 5: Security Architecture and Backup Artifacts
CREATE ROLE ecom_app_user WITH LOGIN PASSWORD 'AppSecurePass123!';
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM public;
GRANT CONNECT ON DATABASE capstone TO ecom_app_user;
GRANT USAGE ON SCHEMA public TO ecom_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ecom_app_user;
-- pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone
