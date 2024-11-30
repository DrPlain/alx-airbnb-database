-- How to create, display and delete indexes
    -- CREATE INDEX index_name ON table_name;
    -- SHOW INDEX FROM table_name;
    -- DROP INDEX index_name ON table_name;


-- User Table Indexes
CREATE INDEX idx_user_role_id ON User (role_id);
CREATE INDEX idx_user_created_at ON User (created_at);

-- -- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_start_date ON Booking (start_date);

-- -- Property Table Indexes
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location_id ON Property (location_id);
CREATE INDEX idx_property_price_per_night ON Property (price_per_night);


EXPLAIN ANALYZE
SELECT first_name,  p.name FROM User u
INNER JOIN Property p
ON u.user_id = p.host_id
WHERE p.price_per_night > 300;