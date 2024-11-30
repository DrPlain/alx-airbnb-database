-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on
-- CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);


EXPLAIN ANALYZE SELECT * 
FROM Booking
INNER JOIN User
ON Booking.user_id = User.user_id
INNER JOIN Property
ON Booking.property_id = Property.property_id;
