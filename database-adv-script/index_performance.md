# Database Index Optimization

## Objective
Improve query performance by creating indexes on high-usage columns in the `User`, `Booking`, and `Property` tables. Measure the query performance before and after adding indexes using `EXPLAIN` or `ANALYZE`.

---

## SQL Script to Create Indexes
```sql
-- 1. Index on User.email for quick lookups (commonly used in authentication or filters)
CREATE INDEX idx_user_email ON User(email);

-- 2. Index on Booking.user_id for efficient JOIN operations with User table
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- 3. Index on Booking.property_id for efficient JOIN operations with Property table
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- 4. Index on Property.location for faster filtering by location
CREATE INDEX idx_property_location ON Property(location);

-- 5. Index on Review.property_id for efficient JOIN operations with Property table
CREATE INDEX idx_review_property_id ON Review(property_id);

-- 6. Index on Review.user_id for efficient JOIN operations with User table
CREATE INDEX idx_review_user_id ON Review(user_id);

--EXPLAINATION
SELECT * 
FROM Booking 
WHERE user_id = 'some-user-id';

-- Analyze usage
ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';
