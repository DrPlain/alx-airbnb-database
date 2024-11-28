-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT User.first_name, COUNT(Booking.booking_id) as number_bookings
FROM User
INNER JOIN Booking
ON User.user_id = Booking.user_id
GROUP BY User.first_name
ORDER BY number_bookings DESC;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- Special notes of ROW_NUMBER and RANK
-- ROW_NUMBER
    -- Always assigns a unique number to each row, even if there are ties.
    -- If two properties have the same number of bookings, they still get different numbers (based on the order they appear in the result set).
-- RANK
    -- Assigns the same rank to rows with identical values in the ordering column (ties).
    -- Skips subsequent ranks if there are ties.

SELECT property_id, COUNT(property_id) AS total_booking,
    ROW_NUMBER() OVER (ORDER BY COUNT(property_id)) AS ranking
FROM Booking
GROUP BY property_id

SELECT property_id, COUNT(property_id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(property_id)) AS ranking
FROM Booking
GROUP BY property_id
