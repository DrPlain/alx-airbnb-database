-- retrieve all bookings and the respective users who made those bookings.

SELECT Booking.booking_id, User.first_name
FROM Booking
INNER JOIN  User
ON Booking.user_id = User.user_id;

-- retrieve all properties and their reviews, including properties that have no reviews.
SELECT Property.name, Review.review_id, Review.comment
FROM Property
LEFT OUTER JOIN Review
ON Property.property_id = Review.property_id;

-- retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT User.user_id, User.first_name, Booking.booking_id
FROM User
FULL OUTER JOIN Booking
ON User.user_id = Booking.user_id


-- I used MySQL for this project and it did not support FULL OUTER JOIN KEYWORD hence the need for the reunion
-- retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
-- SELECT User.user_id, User.first_name, Booking.booking_id
-- FROM User
-- LEFT JOIN Booking
-- ON User.user_id = Booking.user_id
-- UNION
-- SELECT User.user_id, User.first_name, Booking.booking_id
-- FROM User
-- RIGHT JOIN Booking
-- ON User.user_id = Booking.user_id;

