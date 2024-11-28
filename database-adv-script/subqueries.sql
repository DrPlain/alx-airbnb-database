-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

-- SELECT Property.property_id, Property.name, Review.rating
-- FROM Property
-- INNER JOIN Review
-- ON Property.property_id = Review.property_id
-- WHERE Review.rating > (SELECT AVG(Review.rating) FROM Review);

SELECT Property.property_id, Property.name
FROM Property
WHERE (SELECT AVG(Review.rating)
    FROM Review
    WHERE Property.property_id = Review.property_id) > 4;

-- Write a correlated subquery to find users who have made more than 3 bookings

-- Solution using correlation subquery
SELECT user_id, first_name
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;

-- -- -- Alternate solution
-- SELECT User.user_id, User.first_name, COUNT(Booking.user_id) as number_bookings
-- FROM User
-- INNER JOIN Booking
-- ON User.user_id = Booking.user_id
-- GROUP BY User.user_id
-- HAVING number_bookings > 1;
