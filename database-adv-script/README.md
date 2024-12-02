# Airbnb-like Application Database

This project involves the design and management of a relational database for an Airbnb-like application. It covers schema creation, normalization, data population, and advanced SQL queries using joins.

---

## Database Schema

### Entities and Attributes
1. **User**  
   - `user_id`: Primary Key, UUID, Indexed  
   - `first_name`: `VARCHAR`, NOT NULL  
   - `last_name`: `VARCHAR`, NOT NULL  
   - `email`: `VARCHAR`, UNIQUE, NOT NULL  
   - `password_hash`: `VARCHAR`, NOT NULL  
   - `phone_number`: `VARCHAR`, NULL  
   - `role`: `ENUM` (`guest`, `host`, `admin`), NOT NULL  
   - `created_at`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  

2. **Property**  
   - `property_id`: Primary Key, UUID, Indexed  
   - `host_id`: Foreign Key, references `User(user_id)`  
   - `name`: `VARCHAR`, NOT NULL  
   - `description`: `TEXT`, NOT NULL  
   - `location`: `VARCHAR`, NOT NULL  
   - `pricepernight`: `DECIMAL`, NOT NULL  
   - `created_at`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  
   - `updated_at`: `TIMESTAMP`, ON UPDATE CURRENT_TIMESTAMP  

3. **Booking**  
   - `booking_id`: Primary Key, UUID, Indexed  
   - `property_id`: Foreign Key, references `Property(property_id)`  
   - `user_id`: Foreign Key, references `User(user_id)`  
   - `start_date`: `DATE`, NOT NULL  
   - `end_date`: `DATE`, NOT NULL  
   - `total_price`: `DECIMAL`, NOT NULL  
   - `status`: `ENUM` (`pending`, `confirmed`, `canceled`), NOT NULL  
   - `created_at`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  

4. **Payment**  
   - `payment_id`: Primary Key, UUID, Indexed  
   - `booking_id`: Foreign Key, references `Booking(booking_id)`  
   - `amount`: `DECIMAL`, NOT NULL  
   - `payment_date`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  
   - `payment_method`: `ENUM` (`credit_card`, `paypal`, `stripe`), NOT NULL  

5. **Review**  
   - `review_id`: Primary Key, UUID, Indexed  
   - `property_id`: Foreign Key, references `Property(property_id)`  
   - `user_id`: Foreign Key, references `User(user_id)`  
   - `rating`: `INTEGER`, CHECK: `rating >= 1 AND rating <= 5`, NOT NULL  
   - `comment`: `TEXT`, NOT NULL  
   - `created_at`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  

6. **Message**  
   - `message_id`: Primary Key, UUID, Indexed  
   - `sender_id`: Foreign Key, references `User(user_id)`  
   - `recipient_id`: Foreign Key, references `User(user_id)`  
   - `message_body`: `TEXT`, NOT NULL  
   - `sent_at`: `TIMESTAMP`, DEFAULT CURRENT_TIMESTAMP  

---

## SQL Schema Definition

```sql
-- Example for User table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Other table definitions follow similar conventions.
-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES 
('uuid-1', 'John', 'Doe', 'john.doe@example.com', 'hashed_password', 'guest'),
('uuid-2', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password', 'host');

-- Populate other tables with realistic data.
