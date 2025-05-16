-- partitioning.sql using MySQL
-- This script demonstrates how to partition the Booking table by date range in MySQL.
-- Note: Ensure you have a backup of your data before running this script.

-- Step 1: Backup your original table
CREATE TABLE Booking_backup AS SELECT * FROM Booking;

-- Step 2: Drop the original table (if safe)
DROP TABLE Booking;

-- Step 3: Recreate Booking table with partitioning
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- Step 4: Restore data
INSERT INTO Booking SELECT * FROM Booking_backup;


-- partitioning.sql using PostgreSQL
-- This script demonstrates how to partition the Booking table by date range in PostgreSQL.
-- Note: Ensure you have a backup of your data before running this script.

-- Step 1: Rename original table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create partitioned parent table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by year (example)
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 4: Copy data from old table
INSERT INTO Booking
SELECT * FROM Booking_old;

-- Step 5: Drop old table
DROP TABLE Booking_old;
