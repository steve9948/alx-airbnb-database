# Report on Implementing Table Partitioning for Query Optimization

## Objective:
The goal of this exercise was to implement partitioning on the `Booking` table based on the `start_date` column to optimize query performance on large datasets.

## Partitioning Strategy:
We used **range partitioning** based on the `start_date` column. The `Booking` table was partitioned into monthly ranges, where each partition contains bookings for a specific month. This helps to speed up queries that filter by date range, as only the relevant partitions are accessed.

## Steps Taken:

1. **Created the Partitioned Table**:
   The `Booking` table was partitioned using the `PARTITION BY RANGE (start_date)` clause. Each partition was created for monthly ranges, with partition tables created for specific months (e.g., January 2023, February 2023, etc.).

2. **Partition Creation**:
   We created partitions such as `Booking_2024_01`, `Booking_2024_02`, etc., for each month by defining the `FOR VALUES FROM` clause with appropriate date ranges.

   Example SQL code:

   ```sql
   -- Creating the partitioned Booking table
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

   -- Example partition for January 2024
   CREATE TABLE Booking_2024_01 PARTITION OF Booking
       FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
