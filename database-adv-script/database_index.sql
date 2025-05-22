-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Property Table Indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
CREATE INDEX idx_property_host_status ON Property(host_id, price_per_night);

-- Payment Table Indexes
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- User Table Queries
EXPLAIN ANALYZE
SELECT * FROM User WHERE role = 'admin';

-- Booking Table Queries
EXPLAIN ANALYZE
SELECT * FROM Booking 
WHERE start_date >= '2025-06-01' AND end_date <= '2025-06-07';

EXPLAIN ANALYZE
SELECT * FROM Booking WHERE status = 'confirmed';

-- Property Table Queries
EXPLAIN ANALYZE
SELECT * FROM Property WHERE location = 'Nairobi';

EXPLAIN ANALYZE
SELECT * FROM Property WHERE pricepernight < 5000;