
# Performance Monitoring Report

## Objective
Monitor and improve the performance of a frequently used SQL query on a large `Booking` table in a MySQL database.

## Initial Query
```sql
SELECT 
    b.booking_id, b.start_date, b.end_date, b.status,
    u.first_name, u.last_name,
    p.name AS property_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.user_id = 'some-user-id'
  AND b.start_date BETWEEN '2023-01-01' AND '2024-01-01';
```

## Monitoring Tools Used
- `EXPLAIN` and `EXPLAIN ANALYZE` (MySQL 8+)

## Bottlenecks Identified
- Full table scan (`type: ALL`) on `Booking`
- Join buffer usage instead of index joins
- No indexes on `user_id`, `property_id`, or `start_date`
- Slow execution on large datasets

## Optimizations Applied
### Indexes Added
```sql
CREATE INDEX idx_booking_user_date ON Booking(user_id, start_date);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_property_id ON Property(property_id);
```

## Summary of Improvements

| Change                | Benefit                          |
|-----------------------|----------------------------------|
| Composite Indexes     | Reduced scan range               |
| Join Indexes          | Faster join performance          |
| EXPLAIN ANALYZE usage | Real-time execution path insight |

## Conclusion
Adding appropriate indexes and optimizing query structure led to significant performance improvements on the `Booking` table. These changes are essential for scalable performance as the data grows.
