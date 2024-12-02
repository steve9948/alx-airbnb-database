-- performance.sql

-- Initial Query
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
LEFT JOIN Payment py ON b.booking_id = py.booking_id;

-- Refactored Query
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
WHERE b.status = 'confirmed';
