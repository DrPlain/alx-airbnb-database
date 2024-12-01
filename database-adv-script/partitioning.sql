-- Partitioning the Booking table by the year of the start_date column
-- Step 1: Ensure the table is compatible with partitioning (must use InnoDB and PRIMARY KEY must include partition key)
-- Recreate the Booking table with partitioning
DROP TABLE IF EXISTS Booking;

CREATE TABLE Booking (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (booking_id, start_date)
) 

-- Step 2: Partition the table by RANGE on the YEAR of start_date

PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);


EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE Booking.start_date > CURRENT_DATE - INTERVAL 1 YEAR;