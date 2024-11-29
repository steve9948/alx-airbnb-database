## Entities and Attributes

### 1. User
- `user_id`: Primary Key, UUID, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. Property
- `property_id`: Primary Key, UUID, Indexed
- `host_id`: Foreign Key, references `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. Booking
- `booking_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. Payment
- `payment_id`: Primary Key, UUID, Indexed
- `booking_id`: Foreign Key, references `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### 5. Review
- `review_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. Message
- `message_id`: Primary Key, UUID, Indexed
- `sender_id`: Foreign Key, references `User(user_id)`
- `recipient_id`: Foreign Key, references `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Relationships

### User ↔ Property
- A user can act as a host and own multiple properties.
- Relationship: One-to-Many (`User.user_id → Property.host_id`).

### User ↔ Booking
- A user can make multiple bookings for various properties.
- Relationship: One-to-Many (`User.user_id → Booking.user_id`).

### Property ↔ Booking
- A property can have multiple bookings by different users.
- Relationship: One-to-Many (`Property.property_id → Booking.property_id`).

### Booking ↔ Payment
- A booking can have one or more payments (e.g., partial payments).
- Relationship: One-to-Many (`Booking.booking_id → Payment.booking_id`).

### User ↔ Review
- A user can write reviews for properties they have booked.
- Relationship: One-to-Many (`User.user_id → Review.user_id`).

### Property ↔ Review
- A property can have multiple reviews from different users.
- Relationship: One-to-Many (`Property.property_id → Review.property_id`).

### User ↔ Message
- A user can send messages to another user.
- Relationship: Many-to-Many (`Message.sender_id` and `Message.recipient_id`).
