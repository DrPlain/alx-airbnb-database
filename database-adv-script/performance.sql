-- Query to retrieve all bookings along with user, property, and payment details

EXPLAIN ANALYZE
``SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id AS user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email AS user_email,
    u.phone_number AS user_phone,
    p.property_id AS property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.price_per_night AS property_price,
    l.address AS property_address,
    l.city AS property_city,
    l.state AS property_state,
    l.country AS property_country,
    py.payment_id AS payment_id,
    py.amount AS payment_amount,
    py.payment_date AS payment_date,
    pm.method_name AS payment_method
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Location l ON p.location_id = l.location_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id
LEFT JOIN PaymentMethod pm ON py.payment_method_id = pm.payment_method_id
ORDER BY b.created_at DESC;``

-- Optimized query for retrieving bookings along with necessary details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.price_per_night AS property_price,
    l.city AS property_city,
    py.amount AS payment_amount,
    py.payment_date AS payment_date,
    pm.method_name AS payment_method
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Location l ON p.location_id = l.location_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id
LEFT JOIN PaymentMethod pm ON py.payment_method_id = pm.payment_method_id
WHERE b.start_date > CURRENT_DATE - INTERVAL 1 YEAR -- Filter for recent bookings
ORDER BY b.created_at DESC;

