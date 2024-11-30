# Airbnb-like Application Database Schema

## Overview
This project defines a robust relational database schema for an Airbnb-like application. It is designed to efficiently store and manage data for users, properties, bookings, payments, reviews, and messages. The schema adheres to best practices, including third normal form (3NF), and ensures data integrity with constraints and relationships.

---

## Features
1. **Normalization**: Schema follows 3NF to eliminate redundancy.
2. **Data Integrity**: Enforced with primary keys, foreign keys, and validation checks.
3. **Scalability**: Uses UUIDs for primary keys, suitable for distributed systems.
4. **Performance**: Indexed frequently queried columns for optimized data retrieval.
5. **Security**: Adheres to best practices for safe data storage and relationships.

---

## Entities and Relationships
### Entities
1. **User**: Stores user data such as personal details, email, roles, and authentication information.
2. **Property**: Represents listings created by hosts.
3. **Booking**: Tracks reservations for properties.
4. **Payment**: Manages payments for bookings.
5. **Review**: Captures user feedback on properties.
6. **Message**: Logs communication between users.

### Relationships
- A **User** can host multiple **Properties**.
- A **User** can make multiple **Bookings** for various **Properties**.
- A **Booking** can have one **Payment**.
- A **Property** can have multiple **Reviews**.
- Users can send and receive **Messages**.

---

## Schema Details
### User Table
- **Primary Key**: `user_id`
- **Attributes**: `first_name`, `last_name`, `email`, `password_hash`, `role`, `created_at`
- **Constraints**: 
  - Unique email
  - Non-null fields: `first_name`, `last_name`, `email`, `password_hash`, `role`

### Property Table
- **Primary Key**: `property_id`
- **Foreign Key**: `host_id` references `User(user_id)`
- **Attributes**: `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`
- **Constraints**: 
  - Non-null fields: `host_id`, `name`, `description`, `location`, `price_per_night`

### Booking Table
- **Primary Key**: `booking_id`
- **Foreign Keys**: 
  - `property_id` references `Property(property_id)`
  - `user_id` references `User(user_id)`
- **Attributes**: `start_date`, `end_date`, `total_price`, `status`, `created_at`
- **Constraints**: 
  - Non-null fields: `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`

### Payment Table
- **Primary Key**: `payment_id`
- **Foreign Key**: `booking_id` references `Booking(booking_id)`
- **Attributes**: `amount`, `payment_date`, `payment_method`
- **Constraints**: 
  - Non-null fields: `booking_id`, `amount`, `payment_method`

### Review Table
- **Primary Key**: `review_id`
- **Foreign Keys**: 
  - `property_id` references `Property(property_id)`
  - `user_id` references `User(user_id)`
- **Attributes**: `rating`, `comment`, `created_at`
- **Constraints**: 
  - Non-null fields: `property_id`, `user_id`, `rating`, `comment`
  - `rating` between 1 and 5

### Message Table
- **Primary Key**: `message_id`
- **Foreign Keys**: 
  - `sender_id` references `User(user_id)`
  - `recipient_id` references `User(user_id)`
- **Attributes**: `message_body`, `sent_at`
- **Constraints**: 
  - Non-null fields: `sender_id`, `recipient_id`, `message_body`

---

## Indexes
- **User**: `email`
- **Property**: `host_id`
- **Booking**: `property_id`, `user_id`
- **Payment**: `booking_id`
- **Review**: `property_id`, `user_id`
- **Message**: `sender_id`, `recipient_id`

---

## SQL Scripts
Refer to the `sql_schema.sql` file for the complete `CREATE TABLE` statements, constraints, and indexes. Each table is defined with appropriate relationships and indexing for optimal performance.

---

## Example Queries
### Retrieve all properties hosted by a user:
```sql
SELECT * 
FROM Property 
WHERE host_id = 'user_uuid';
