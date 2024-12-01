-- Query to retrieve all bookings along with user, property, and payment details

-- EXPLAIN ANALYZE
-- SELECT 
--     Booking.booking_id,
--     Booking.start_date,
--     Booking.end_date,
--     Booking.total_price,
--     Booking.status AS booking_status,
--     User.user_id AS user_id,
--     CONCAT(User.first_name, ' ', User.last_name) AS user_name,
--     User.email AS user_email,
--     User.phone_number AS user_phone,
--     Property.property_id AS property_id,
--     Property.name AS property_name,
--     Property.description AS property_description,
--     Property.price_per_night AS property_price,
--     Location.address AS property_address,
--     Location.city AS property_city,
--     Location.state AS property_state,
--     Location.country AS property_country,
--     Payment.payment_id AS payment_id,
--     Payment.amount AS payment_amount,
--     Payment.payment_date AS payment_date,
--     PaymentMethod.method_name AS payment_method
-- FROM Booking
-- LEFT JOIN User ON Booking.user_id = User.user_id
-- LEFT JOIN Property ON Booking.property_id = Property.property_id
-- LEFT JOIN Location ON Property.location_id = Location.location_id
-- LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id
-- LEFT JOIN PaymentMethod ON Payment.payment_method_id = PaymentMethod.payment_method_id
-- ORDER BY Booking.created_at DESC;

-- -- Optimized query for retrieving bookings along with necessary details
-- SELECT 
--     Booking.booking_id,
--     Booking.start_date,
--     Booking.end_date,
--     Booking.total_price,
--     Booking.status AS booking_status,
--     CONCAT(User.first_name, ' ', User.last_name) AS user_name,
--     User.email AS user_email,
--     Property.name AS property_name,
--     Property.price_per_night AS property_price,
--     Location.city AS property_city,
--     Payment.amount AS payment_amount,
--     Payment.payment_date AS payment_date,
--     PaymentMethod.method_name AS payment_method
-- FROM Booking
-- LEFT JOIN User ON Booking.user_id = User.user_id
-- LEFT JOIN Property ON Booking.property_id = Property.property_id
-- LEFT JOIN Location ON Property.location_id = Location.location_id
-- LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id
-- LEFT JOIN PaymentMethod  ON Payment.payment_method_id = PaymentMethod.payment_method_id
-- WHERE Booking.start_date > CURRENT_DATE - INTERVAL 1 YEAR -- Filter for recent bookings
-- ORDER BY Booking.created_at DESC;

Initial query
EXPLAIN ANALYZE
SELECT *
FROM Booking
LEFT JOIN User
ON Booking.user_id = User.user_id
LEFT JOIN Property
ON Booking.property_id = Property.property_id
LEFT JOIN Payment
ON Booking.booking_id = Payment.booking_id
LEFT JOIN PaymentMethod
ON Payment.payment_method_id = PaymentMethod.payment_method_id

EXPLAIN ANALYZE
SELECT *
FROM Booking
LEFT JOIN User
ON Booking.user_id = User.user_id
LEFT JOIN Property
ON Booking.property_id = Property.property_id
LEFT JOIN Payment
ON Booking.booking_id = Payment.booking_id
LEFT JOIN PaymentMethod
ON Payment.payment_method_id = PaymentMethod.payment_method_id
WHERE Booking.start_date > CURRENT_DATE - INTERVAL 1 YEAR -- Filter for recent bookings
ORDER BY Booking.created_at DESC