-- Enable pgcrypto for UUID generation (PostgreSQL only)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host'),
  (gen_random_uuid(), 'Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', '3456789012', 'guest'),
  (gen_random_uuid(), 'Dan', 'Brown', 'dan@example.com', 'hashed_pw_4', '4567890123', 'admin');

INSERT INTO Location (location_id, city, state, country)
VALUES
  (gen_random_uuid(), 'Nairobi', NULL, 'Kenya'),
  (gen_random_uuid(), 'Mombasa', NULL, 'Kenya'),
  (gen_random_uuid(), 'Kampala', NULL, 'Uganda');

-- Get Bob's user_id and Nairobi location_id
-- Replace UUIDs if manually setting them

-- Example (use your own UUIDs if needed):
-- Host ID (from previous insert): bob_user_id
-- Nairobi location_id: nairobi_location_id

-- Suppose you've retrieved those UUIDs manually or using subqueries:
INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night)
SELECT gen_random_uuid(), u.user_id, l.location_id, 
       'Sunny Apartment', '2-bedroom near CBD', 50.00
FROM "User" u, Location l
WHERE u.email = 'bob@example.com' AND l.city = 'Nairobi' AND l.country = 'Kenya'
UNION ALL
SELECT gen_random_uuid(), u.user_id, l.location_id, 
       'Coastal Cottage', 'Beachfront property', 120.00
FROM "User" u, Location l
WHERE u.email = 'bob@example.com' AND l.city = 'Mombasa' AND l.country = 'Kenya';

-- Booking by Alice for Sunny Apartment
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
SELECT gen_random_uuid(), p.property_id, u.user_id, 
       '2025-06-01', '2025-06-05', 'confirmed'
FROM Property p, "User" u
WHERE p.name = 'Sunny Apartment' AND u.email = 'alice@example.com';

-- Booking by Carol for Coastal Cottage
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
SELECT gen_random_uuid(), p.property_id, u.user_id, 
       '2025-07-10', '2025-07-12', 'pending'
FROM Property p, "User" u
WHERE p.name = 'Coastal Cottage' AND u.email = 'carol@example.com';

-- Payment for Alice's confirmed booking
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT gen_random_uuid(), b.booking_id, 200.00, 'credit_card'
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com' AND b.status = 'confirmed';

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), p.property_id, u.user_id, 5, 'Fantastic stay!'
FROM Property p, "User" u
WHERE p.name = 'Sunny Apartment' AND u.email = 'alice@example.com';

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), p.property_id, u.user_id, 4, 'Nice location, will return.'
FROM Property p, "User" u
WHERE p.name = 'Coastal Cottage' AND u.email = 'carol@example.com';

-- Alice sends a message to Bob
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT gen_random_uuid(), sender.user_id, recipient.user_id, 'Hi, is the apartment available in June?'
FROM "User" sender, "User" recipient
WHERE sender.email = 'alice@example.com' AND recipient.email = 'bob@example.com';