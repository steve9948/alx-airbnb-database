# Database Normalization to 3NF

## Objective
Ensure the database schema adheres to the Third Normal Form (3NF) by eliminating redundancies and avoiding partial or transitive dependencies.

---

## Normalization Steps

### First Normal Form (1NF)
- Ensured all attributes contain atomic values.
- Removed any repeating groups or arrays.

### Second Normal Form (2NF)
- Eliminated partial dependencies by ensuring all non-key attributes depend on the entire primary key.

### Third Normal Form (3NF)
- Removed transitive dependencies, ensuring all non-key attributes depend only on the primary key of their respective table.

---

## Schema Analysis and Changes
1. **User Table**:
   - Attributes are atomic and directly dependent on `user_id`.
   - No changes necessary.

2. **Property Table**:
   - Each attribute is atomic and directly dependent on `property_id`.
   - No changes necessary.

3. **Booking Table**:
   - Attributes depend only on `booking_id`, which uniquely identifies each booking.
   - No changes necessary.

4. **Payment Table**:
   - Attributes are atomic and directly dependent on `payment_id`.
   - No changes necessary.

5. **Review Table**:
   - Attributes depend on `review_id`, with no transitive dependencies.
   - No changes necessary.

6. **Message Table**:
   - Each message is uniquely identified by `message_id`.
   - Attributes are atomic and comply with 3NF.

---

## Final Conclusion
The schema adheres to 3NF. No adjustments are required to remove redundancies or achieve normalization. The current design is efficient and optimized for relational database practices.

