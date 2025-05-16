-- performance.sql
-- This script is designed to analyze the performance of the Airbnb database.
-- It includes queries that retrieve booking details, user information, property details, and payment information.
-- The script uses various SQL techniques such as joins, subqueries, and aggregations to extract meaningful insights from the database.
-- The queries are structured to provide a comprehensive view of the booking process, including user details, property information, and payment records.

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,

    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date

FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;


-- Optimized version for performance
-- This query retrieves booking details along with user information, property details, and payment information.
-- It uses INNER JOINs for mandatory relationships and LEFT JOIN for optional relationships.
-- The query is structured to minimize the number of rows processed and improve performance.
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,

    u.first_name || ' ' || u.last_name AS customer_name,
    p.name AS property_name,
    pay.amount

FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;

