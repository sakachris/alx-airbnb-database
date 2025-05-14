-- This query selects properties with an average rating greater than 4.0.
-- It retrieves the property ID, name, location, and price per night from the Property table.
-- The subquery calculates the average rating for each property by filtering reviews based on the property ID.
-- The main query filters properties based on the average rating calculated in the subquery.
-- The result will include properties that have received high ratings from guests.
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    (
        SELECT AVG(r.rating)
        FROM Review r
        WHERE r.property_id = p.property_id
    ) > 4.0;


-- This query selects users who have made more than 3 bookings.
-- It retrieves the user ID, first name, last name, and email from the User table.
-- The subquery counts the number of bookings for each user by filtering bookings based on the user ID.
-- The main query filters users based on the count of bookings calculated in the subquery.
-- The result will include users who are frequent bookers on the platform.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;