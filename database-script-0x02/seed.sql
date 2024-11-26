-- Insert Data into Role
INSERT INTO Role (role_id, role_name)
VALUES ('1d54ac32-0a7a-4db6-91b3-b768f56dca24', 'guest'),
    ('2c6bc242-15d8-4763-8899-1aaf7c2d5f56', 'host'),
    ('3f6cba42-25e9-4763-8899-1aaf7c2d5f57', 'admin');
-- Insert Data into User
INSERT INTO User (
        user_id,
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role_id,
        created_at
    )
VALUES (
        '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11',
        'John',
        'Doe',
        'john.doe@example.com',
        'hash123',
        '+1234567890',
        '1d54ac32-0a7a-4db6-91b3-b768f56dca24',
        CURRENT_TIMESTAMP
    ),
    (
        '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14',
        'Alice',
        'Smith',
        'alice.smith@example.com',
        'hash456',
        '+9876543210',
        '2c6bc242-15d8-4763-8899-1aaf7c2d5f56',
        CURRENT_TIMESTAMP
    ),
    (
        '8f4cc7d2-2c9c-6ed8-03c5-b87d9f63fc15',
        'Bob',
        'Johnson',
        'bob.johnson@example.com',
        'hash789',
        '+1122334455',
        '3f6cba42-25e9-4763-8899-1aaf7c2d5f57',
        CURRENT_TIMESTAMP
    );
-- Insert Data into Location
INSERT INTO Location (location_id, address, city, state, country)
VALUES (
        '1abc23de-456f-78g9-h012-ijkl34567890',
        '123 Main St',
        'San Francisco',
        'CA',
        'USA'
    ),
    (
        '2bcd34ef-567g-89h0-i123-jklm45678901',
        '456 Elm St',
        'Los Angeles',
        'CA',
        'USA'
    ),
    (
        '3cde45fg-678h-90i1-j234-klmn56789012',
        '789 Pine St',
        'New York',
        'NY',
        'USA'
    );
-- Insert Data into Property
INSERT INTO Property (
        property_id,
        name,
        description,
        location_id,
        price_per_night,
        created_at,
        updated_at
    )
VALUES (
        '9de345fg-678h-90i1-j234-klmn56789012',
        'Cozy Apartment',
        'A modern, cozy apartment in downtown SF.',
        '1abc23de-456f-78g9-h012-ijkl34567890',
        150.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        '8cd456gh-789i-01j2-k345-lmno67890123',
        'Beach House',
        'A beautiful beach house with stunning ocean views.',
        '2bcd34ef-567g-89h0-i123-jklm45678901',
        300.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        '7bc567hi-890j-12k3-l456-mnop78901234',
        'Luxury Condo',
        'A luxury condo in the heart of Manhattan.',
        '3cde45fg-678h-90i1-j234-klmn56789012',
        500.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Insert Data into Booking
INSERT INTO Booking (
        booking_id,
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status,
        created_at
    )
VALUES (
        '1aaa22bb-333c-444d-555e-666ff777888g',
        '9de345fg-678h-90i1-j234-klmn56789012',
        '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11',
        '2024-12-01',
        '2024-12-07',
        1050.00,
        'confirmed',
        CURRENT_TIMESTAMP
    ),
    (
        '2bbb33cc-444d-555e-666f-777gg888999h',
        '8cd456gh-789i-01j2-k345-lmno67890123',
        '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14',
        '2024-12-10',
        '2024-12-15',
        1500.00,
        'pending',
        CURRENT_TIMESTAMP
    );
-- Insert Data into PaymentMethod
INSERT INTO PaymentMethod (payment_method_id, method_name)
VALUES (
        '1pm12345-6789-0123-4567-890abcde123f',
        'credit_card'
    ),
    ('2pm23456-7890-1234-5678-901bcdef234g', 'paypal'),
    ('3pm34567-8901-2345-6789-012cdefg345h', 'stripe');
-- Insert Data into Payment
INSERT INTO Payment (
        payment_id,
        booking_id,
        amount,
        payment_date,
        payment_method_id
    )
VALUES (
        '1pp12345-6789-0123-4567-890abcde123f',
        '1aaa22bb-333c-444d-555e-666ff777888g',
        1050.00,
        CURRENT_TIMESTAMP,
        '1pm12345-6789-0123-4567-890abcde123f'
    ),
    (
        '2pp23456-7890-1234-5678-901bcdef234g',
        '2bbb33cc-444d-555e-666f-777gg888999h',
        1500.00,
        CURRENT_TIMESTAMP,
        '2pm23456-7890-1234-5678-901bcdef234g'
    );
-- Insert Data into Review
INSERT INTO Review (
        review_id,
        property_id,
        user_id,
        rating,
        comment,
        created_at
    )
VALUES (
        '1rv12345-6789-0123-4567-890abcde123f',
        '9de345fg-678h-90i1-j234-klmn56789012',
        '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11',
        5,
        'Amazing stay! Highly recommend.',
        CURRENT_TIMESTAMP
    ),
    (
        '2rv23456-7890-1234-5678-901bcdef234g',
        '8cd456gh-789i-01j2-k345-lmno67890123',
        '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14',
        4,
        'Great place, but a bit pricey.',
        CURRENT_TIMESTAMP
    );
-- Insert Data into Message
INSERT INTO Message (
        message_id,
        sender_id,
        recipient_id,
        message_body,
        sent_at
    )
VALUES (
        '1msg12345-6789-0123-4567-890abcde123f',
        '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11',
        '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14',
        'Is the property available for next weekend?',
        CURRENT_TIMESTAMP
    ),
    (
        '2msg23456-7890-1234-5678-901bcdef234g',
        '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14',
        '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11',
        'Yes, it is available.',
        CURRENT_TIMESTAMP
    );