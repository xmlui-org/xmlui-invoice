-- Universal search across clients, products, and invoices
-- Returns normalized results with table name, primary key, title, and snippet

WITH search_params AS (
    SELECT :searchTerm as term
)

SELECT
    'clients' as table_name,
    id as record_id,
    name as title,
    CASE
        WHEN name LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Name: ' || name
        WHEN email LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Email: ' || email
        WHEN phone LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Phone: ' || phone
        WHEN address LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Address: ' || address
        ELSE name
    END as snippet
FROM clients
CROSS JOIN search_params
WHERE name LIKE '%' || (SELECT term FROM search_params) || '%'
   OR email LIKE '%' || (SELECT term FROM search_params) || '%'
   OR phone LIKE '%' || (SELECT term FROM search_params) || '%'
   OR address LIKE '%' || (SELECT term FROM search_params) || '%'

UNION ALL

SELECT
    'products' as table_name,
    id as record_id,
    name as title,
    CASE
        WHEN name LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Product: ' || name
        WHEN description LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Description: ' || description
        ELSE name
    END as snippet
FROM products
CROSS JOIN search_params
WHERE name LIKE '%' || (SELECT term FROM search_params) || '%'
   OR description LIKE '%' || (SELECT term FROM search_params) || '%'

UNION ALL

SELECT
    'invoices' as table_name,
    id as record_id,
    invoice_number as title,
    CASE
        WHEN invoice_number LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Invoice: ' || invoice_number
        WHEN notes LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Notes: ' || substr(notes, 1, 100) || '...'
        WHEN items LIKE '%' || (SELECT term FROM search_params) || '%' THEN 'Items: ' || substr(items, 1, 100) || '...'
        ELSE 'Invoice: ' || invoice_number
    END as snippet
FROM invoices
CROSS JOIN search_params
WHERE invoice_number LIKE '%' || (SELECT term FROM search_params) || '%'
   OR notes LIKE '%' || (SELECT term FROM search_params) || '%'
   OR items LIKE '%' || (SELECT term FROM search_params) || '%'


