-- Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (start_date);

-- Create partitions based on the start_date column (monthly range in this example)
CREATE TABLE Booking_2023_01 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

CREATE TABLE Booking_2023_02 PARTITION OF Booking
    FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');

CREATE TABLE Booking_2023_03 PARTITION OF Booking
    FOR VALUES FROM ('2023-03-01') TO ('2023-04-01');

-- Add more partitions for future months as needed
-- Example: for April 2023
CREATE TABLE Booking_2023_04 PARTITION OF Booking
    FOR VALUES FROM ('2023-04-01') TO ('2023-05-01');

-- Repeat for other months...

-- Query to fetch bookings for January 2023
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-01-31';

-- Query to fetch bookings for February 2023
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-02-01' AND '2023-02-28';

EXPLAIN ANALYZE 
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-01-31';
