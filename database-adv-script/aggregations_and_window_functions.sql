-- SQL Aggregation and Window Functions

-- 1. Total Number of Bookings Made by Each User
SELECT 
    B.user_id, 
    U.first_name, 
    U.last_name, 
    COUNT(B.booking_id) AS total_bookings
FROM 
    Booking B
JOIN 
    User U
ON 
    B.user_id = U.user_id
GROUP BY 
    B.user_id, U.first_name, U.last_name
ORDER BY 
    total_bookings DESC;

-- 2. Rank Properties Based on Total Number of Bookings
SELECT 
    P.property_id, 
    P.name AS property_name, 
    COUNT(B.booking_id) AS total_bookings, 
    RANK() OVER (ORDER BY COUNT(B.booking_id) DESC) AS booking_rank
FROM 
    Property P
LEFT JOIN 
    Booking B
ON 
    P.property_id = B.property_id
GROUP BY 
    P.property_id, P.name
ORDER BY 
    booking_rank;
