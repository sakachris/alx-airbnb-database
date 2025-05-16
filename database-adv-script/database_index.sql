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
