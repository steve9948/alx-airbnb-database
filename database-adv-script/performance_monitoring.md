# Continuous Database Performance Monitoring and Refinement

## Objective:
The objective of this task is to continuously monitor and refine database performance by analyzing query execution plans, identifying bottlenecks, and implementing changes such as new indexes or schema adjustments.

## Steps Taken:

### 1. Monitoring Query Performance
We began by monitoring the performance of several frequently used queries using SQL commands like `EXPLAIN ANALYZE` and `SHOW PROFILE`. These commands helped in generating execution plans that highlight inefficiencies such as full table scans, inefficient joins, or missing indexes.

#### Example Query for Monitoring:
We chose a query that retrieves all bookings along with user and property details, as this is commonly used.

```sql
EXPLAIN ANALYZE 
SELECT B.booking_id, U.first_name, U.last_name, P.name, B.start_date, B.end_date, B.total_price
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id
WHERE B.start_date BETWEEN '2024-01-01' AND '2024-03-01';
