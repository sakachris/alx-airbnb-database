-- query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings
-- This query retrieves booking details along with user information by joining the booking and users tables.
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;


-- query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY 
    p.property_id,
    r.created_at DESC;


-- query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Emulated FULL OUTER JOIN for MySQL
-- Emulated FULL OUTER JOIN: All users with or without bookings, and all bookings with or without users
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    Booking b
LEFT JOIN 
    User u ON b.user_id = u.user_id;



-- query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Emulated FULL OUTER JOIN for PostgreSQL
-- Note: PostgreSQL supports FULL OUTER JOIN directly
-- This query retrieves all users and their bookings, including users without bookings and bookings without users.
-- Native FULL OUTER JOIN in PostgreSQL: All users and all bookings, even if not linked
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.role,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    "User" u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;

-- Table "User" is quoted because User is a reserved keyword in PostgreSQL.