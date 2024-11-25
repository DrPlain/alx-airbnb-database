# Entity-Relationship Diagram for Airbnb Database

## Entities and Attributes

### 1. User

- **Attributes**:
  - `user_id` (PK)
  - `first_name`
  - `last_name`
  - `email` (unique)
  - `password_hash`
  - `phone_number`
  - `role`
  - `created_at`
- **Relationships**:
  - A user can **host** properties.
  - A user can **book** bookings.
  - A user can **write** reviews.
  - A user can **send/receive** messages.

---

### 2. Property

- **Attributes**:
  - `property_id` (PK)
  - `host_id` (FK references User.user_id)
  - `name`
  - `description`
  - `location`
  - `pricepernight`
  - `created_at`
  - `updated_at`
- **Relationships**:
  - A property is **hosted by** a user.
  - A property can have multiple **bookings**.
  - A property can receive multiple **reviews**.
  - A property is **located in** a location (if normalized).

---

### 3. Booking

- **Attributes**:
  - `booking_id` (PK)
  - `property_id` (FK references Property.property_id)
  - `user_id` (FK references User.user_id)
  - `start_date`
  - `end_date`
  - `total_price`
  - `status`
  - `created_at`
- **Relationships**:
  - A booking is **made by** a user.
  - A booking is **for** a property.
  - A booking can have multiple **payments**.

---

### 4. Payment

- **Attributes**:
  - `payment_id` (PK)
  - `booking_id` (FK references Booking.booking_id)
  - `amount`
  - `payment_date`
  - `payment_method`
- **Relationships**:
  - A payment is **linked to** a booking.
  - A payment **uses** a payment method (if normalized).

---

### 5. Review

- **Attributes**:
  - `review_id` (PK)
  - `property_id` (FK references Property.property_id)
  - `user_id` (FK references User.user_id)
  - `rating`
  - `comment`
  - `created_at`
- **Relationships**:
  - A review is **written by** a user.
  - A review is **for** a property.

---

### 6. Message

- **Attributes**:
  - `message_id` (PK)
  - `sender_id` (FK references User.user_id)
  - `recipient_id` (FK references User.user_id)
  - `message_body`
  - `sent_at`
- **Relationships**:
  - A message is **sent by** a user.
  - A message is **received by** another user.

---

### 7. Locations (Optional Normalization)

- **Attributes**:
  - `location_id` (PK)
  - `address`
  - `city`
  - `state`
  - `country`
- **Relationships**:
  - A location is **linked to** a property.

---

## Key Relationships

1. **User ↔ Property**: A user (host) can have multiple properties (1-to-many).
2. **User ↔ Booking**: A user (guest) can make multiple bookings (1-to-many).
3. **Property ↔ Booking**: A property can have multiple bookings (1-to-many).
4. **Booking ↔ Payment**: A booking can have one or more payments (1-to-many).
5. **Property ↔ Review**: A property can receive multiple reviews (1-to-many).
6. **User ↔ Review**: A user (guest) can write multiple reviews (1-to-many).
7. **User ↔ Message**: Users can send and receive messages from one another (many-to-many, resolved with sender_id and recipient_id).

---
