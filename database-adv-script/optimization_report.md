# SQL Query Performance Optimization Report

## Key Findings from the EXPLAIN Output:
- **Full Table Scans**: If indexes are not present on frequently queried columns, the database may perform full table scans.
- **Inefficient Join Order**: The order of joins can impact performance. Larger tables should be joined last.
- **LEFT JOIN**: The `LEFT JOIN` with the Payment table may be unnecessary if every booking has a corresponding payment.

## Query Optimization:
1. **Create Appropriate Indexes**:
   - Index on `Booking.user_id`
   - Index on `Booking.property_id`
   - Index on `Booking.booking_id`
   - Index on `User.user_id`
   - Index on `Property.property_id`
   - Index on `Payment.booking_id`
   
2. **Avoid `SELECT *`**: Select only necessary columns to reduce overhead.

3. **Use `INNER JOIN` When Possible**: Replace `LEFT JOIN` with `INNER JOIN` when the relationship is guaranteed, e.g., between bookings and users.

4. **Filter Unnecessary Data**: Add `WHERE` clauses to filter out irrelevant records, such as pending bookings.

## Refactored Query:
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight AS property_price_per_night,
    py.payment_id,
    py.amount AS payment_amount,
    py.payment_date,
    py.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id
WHERE b.status = 'confirmed';  -- Example filter for confirmed bookings
