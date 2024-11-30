-- Populate the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('uuid1', 'Alice', 'Smith', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    ('uuid2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password2', '2345678901', 'host', CURRENT_TIMESTAMP),
    ('uuid3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password3', '3456789012', 'admin', CURRENT_TIMESTAMP);

-- Populate the Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
    ('uuid4', 'uuid2', 'Cozy Cabin', 'A small but cozy cabin in the woods.', 'Mountain View, CA', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('uuid5', 'uuid2', 'Beachfront Condo', 'A luxurious condo with stunning ocean views.', 'Miami, FL', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('uuid6', 'uuid2', 'City Loft', 'A modern loft in the heart of downtown.', 'New York, NY', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Populate the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('uuid7', 'uuid4', 'uuid1', '2024-12-01', '2024-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
    ('uuid8', 'uuid5', 'uuid1', '2025-01-10', '2025-01-15', 1500.00, 'pending', CURRENT_TIMESTAMP),
    ('uuid9', 'uuid6', 'uuid1', '2025-02-20', '2025-02-25', 1250.00, 'canceled', CURRENT_TIMESTAMP);

-- Populate the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('uuid10', 'uuid7', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
    ('uuid11', 'uuid8', 1500.00, CURRENT_TIMESTAMP, 'paypal');

-- Populate the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('uuid12', 'uuid4', 'uuid1', 5, 'Amazing experience! Highly recommended.', CURRENT_TIMESTAMP),
    ('uuid13', 'uuid5', 'uuid1', 4, 'Great location but a bit pricey.', CURRENT_TIMESTAMP);

-- Populate the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('uuid14', 'uuid1', 'uuid2', 'Hi Bob, I have a question about the cabin.', CURRENT_TIMESTAMP),
    ('uuid15', 'uuid2', 'uuid1', 'Hello Alice, sure, feel free to ask!', CURRENT_TIMESTAMP),
    ('uuid16', 'uuid1', 'uuid3', 'Hi Charlie, I need help with my account.', CURRENT_TIMESTAMP);
