# High-Usage Columns Analysis
## User Table
- **user_id:** Primary key, used in JOINs (Property.host_id, Booking.user_id, Review.user_id, Message.sender/recipient)

- **email:** Used for authentication (already has idx_user_email)

- **role:** Likely used in WHERE clauses for permission checks and specific user roles

## Booking Table
- **booking_id:** Primary key, used in Payment JOINs

- **property_id:** Used in JOINs with Property table

- **user_id:** Used in JOINs with User table

- **status:** Likely filtered in WHERE clauses

- **start_date/end_date:** Used for date range queries or filters

## Property Table
- **property_id:** Primary key, used in JOINs (Booking, Review), WHERE, GROUP BY

- **host_id:** Used in JOINs with User table (already has idx_property_host_id)

- **location_id:** Used in JOINs with Location table (already has idx_property_location_id)

- **pricepernight**: Likely used in WHERE and ORDER BY for filtering/sorting