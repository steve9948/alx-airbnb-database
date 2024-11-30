# Airbnb-like Application Database Population

## Overview
This project provides an SQL script to populate the database for an Airbnb-like application with sample data. The sample data reflects real-world scenarios with multiple users, properties, bookings, payments, reviews, and messages. The data ensures proper relationships and constraints, allowing you to test and interact with the database.

---

## Features
1. **Realistic Data**: The sample dataset mimics a live system's behavior, including roles for users, property listings, and transactions.
2. **Fully Relational**: Maintains integrity by adhering to foreign key constraints.
3. **Versatile**: Enables testing for features like booking, payment processing, and user interactions.

---

## Entities and Sample Data
### User
- **Description**: Stores personal details and roles for application users.
- **Sample Data**:
  - Alice Smith: A guest user.
  - Bob Johnson: A host who lists properties.
  - Charlie Brown: An admin with system privileges.

### Property
- **Description**: Represents listings by hosts, including location and pricing.
- **Sample Data**:
  - Cozy Cabin: A serene retreat in the woods.
  - Beachfront Condo: Luxurious accommodation by the sea.
  - City Loft: A modern urban dwelling.

### Booking
- **Description**: Tracks reservations made by guests for listed properties.
- **Sample Data**:
  - Alice books the Cozy Cabin for a 5-day stay.
  - A pending booking for the Beachfront Condo.
  - A canceled booking for the City Loft.

### Payment
- **Description**: Records payments for bookings, including methods like credit cards and PayPal.
- **Sample Data**:
  - Payment for Alice's confirmed Cozy Cabin booking.
  - Payment initiated for a pending Beachfront Condo booking.

### Review
- **Description**: Logs user feedback on properties.
- **Sample Data**:
  - 5-star review for the Cozy Cabin.
  - 4-star review for the Beachfront Condo.

### Message
- **Description**: Facilitates communication between users (guests, hosts, and admins).
- **Sample Data**:
  - Alice asks Bob a question about the cabin.
  - Bob replies with helpful information.
  - Alice contacts admin Charlie for account assistance.

---

## SQL Population Script
### Usage
1. **Pre-requisites**:
   - Ensure the database schema is created using the `CREATE TABLE` statements provided earlier.
2. **Execution**:
   - Run the SQL script to insert sample data into the database.
3. **Validation**:
   - Use SELECT queries to verify the inserted data.

### Sample Query
- Retrieve all properties hosted by Bob:
  ```sql
  SELECT * 
  FROM Property 
  WHERE host_id = 'uuid2';
