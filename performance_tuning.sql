-- Capstone Phase 4: Performance Optimization and Tuning Check Scripts

-- 1. Unoptimized Wildcard full table scan query evaluation
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, name, price FROM products WHERE description ILIKE '%evaluation%';

-- 2. High performance optimized full text query using GIN Index
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, name, price FROM products WHERE search_vec @@ to_tsquery('english', 'evaluation');
