# Applying Normalization Principles to Achieve 3NF

## Introduction to Normalization

Normalization is the process of organizing a database to reduce redundancy and improve data integrity. The main steps include:

1. **First Normal Form (1NF)**: Ensure all attributes have atomic values, and there are no repeating groups.
2. **Second Normal Form (2NF)**: Ensure all attributes are fully functionally dependent on the primary key.
3. **Third Normal Form (3NF)**: Remove transitive dependencies so that no non-prime attribute depends on another non-prime attribute.

---

## Normalization Process

### Step 1: Ensuring 1NF (Atomicity and Removing Repeating Groups)

- **Atomicity**: All attributes are already atomic (e.g., `first_name` and `last_name` are separate fields; no lists or multi-valued fields exist).
- **Repeating Groups**: No repeating groups are present.

**Result**: The schema satisfies 1NF.

---

### Step 2: Ensuring 2NF (Full Functional Dependency)

- **Identifying Partial Dependencies**: In tables with composite primary keys, non-key attributes must depend on the whole primary key. In this schema, no composite primary keys are used, so no partial dependencies exist.

**Result**: The schema satisfies 2NF.

---

### Step 3: Ensuring 3NF (Removing Transitive Dependencies)

We examine transitive dependencies where non-prime attributes depend on other non-prime attributes.

#### 1. **User Table**

- Current attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
- **Issue**: The `role` attribute is dependent on `user_id`. To eliminate redundancy:
  - Create a separate **Role** table with attributes: `role_id` (PK), `role_name`.
  - Replace `role` in **User** with `role_id` (FK).

**Normalized Tables**:

- **User**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role_id (FK)`, `created_at`.
- **Role**: `role_id` (PK), `role_name`.

---

#### 2. **Property Table**

- Current attributes: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.
- **Issue**: The `location` field could be further normalized to avoid redundancy in storing the same location multiple times.
  - Create a **Location** table with attributes: `location_id` (PK), `address`, `city`, `state`, `country`.
  - Replace `location` in **Property** with `location_id` (FK).

**Normalized Tables**:

- **Property**: `property_id`, `host_id (FK)`, `name`, `description`, `location_id (FK)`, `pricepernight`, `created_at`, `updated_at`.
- **Location**: `location_id` (PK), `address`, `city`, `state`, `country`.

---

#### 3. **Payment Table**

- Current attributes: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.
- **Issue**: The `payment_method` field can be normalized to avoid storing the same method repeatedly.
  - Create a **PaymentMethod** table with attributes: `payment_method_id` (PK), `method_name`.
  - Replace `payment_method` in **Payment** with `payment_method_id` (FK).

**Normalized Tables**:

- **Payment**: `payment_id`, `booking_id (FK)`, `amount`, `payment_date`, `payment_method_id (FK)`.
- **PaymentMethod**: `payment_method_id` (PK), `method_name`.

---

## Final Normalized Schema (3NF)

### User Table

- `user_id` (PK)
- `first_name`
- `last_name`
- `email` (unique)
- `password_hash`
- `phone_number`
- `role_id (FK)`
- `created_at`

### Role Table

- `role_id` (PK)
- `role_name`

### Property Table

- `property_id` (PK)
- `host_id` (FK references User.user_id)
- `name`
- `description`
- `location_id (FK)`
- `pricepernight`
- `created_at`
- `updated_at`

### Location Table

- `location_id` (PK)
- `address`
- `city`
- `state`
- `country`

### Booking Table

- `booking_id` (PK)
- `property_id` (FK references Property.property_id)
- `user_id` (FK references User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status`
- `created_at`

### Payment Table

- `payment_id` (PK)
- `booking_id` (FK references Booking.booking_id)
- `amount`
- `payment_date`
- `payment_method_id (FK)`

### PaymentMethod Table

- `payment_method_id` (PK)
- `method_name`

### Review Table

- `review_id` (PK)
- `property_id` (FK references Property.property_id)
- `user_id` (FK references User.user_id)
- `rating`
- `comment`
- `created_at`

### Message Table

- `message_id` (PK)
- `sender_id` (FK references User.user_id)
- `recipient_id` (FK references User.user_id)
- `message_body`
- `sent_at`

---

## Explanation of Normalization Steps

1. **User Table**: Extracted `role` into a separate **Role** table to avoid redundancy and support role management.
2. **Property Table**: Extracted `location` into a separate **Location** table to minimize duplication of location data.
3. **Payment Table**: Extracted `payment_method` into a separate **PaymentMethod** table to standardize and simplify payment method management.
4. All tables now meet the criteria for 3NF by ensuring:
   - All attributes are atomic (1NF).
   - Attributes are fully dependent on the primary key (2NF).
   - No transitive dependencies exist (3NF).

---
