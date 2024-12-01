-- Partitioning the Booking table by the year of the start_date column
-- Step 1: Ensure the table is compatible with partitioning (must use InnoDB and PRIMARY KEY must include partition key)
ALTER TABLE Booking DROP PRIMARY KEY, ADD PRIMARY KEY (booking_id, start_date);

-- Step 2: Partition the table by RANGE on the YEAR of start_date
ALTER TABLE Booking
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
-- );


EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE Booking.created_at > CURRENT_DATE - INTERVAL 1 YEAR;