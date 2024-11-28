-- Insert Data into Role
INSERT INTO Role (role_id, role_name)
VALUES
    ('1d54ac32-0a7a-4db6-91b3-b768f56dca24', 'guest'),
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
VALUES
    -- Guests
    ('6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', 'John', 'Doe', 'john.doe@example.com', 'hash123', '+1234567890', '1d54ac32-0a7a-4db6-91b3-b768f56dca24', CURRENT_TIMESTAMP),
    ('9g5aa6d3-1c8c-7fd8-03d6-d87e9g64fd16', 'Clara', 'Wilson', 'clara.wilson@example.com', 'hash1234', '+5678901234', '1d54ac32-0a7a-4db6-91b3-b768f56dca24', CURRENT_TIMESTAMP),
    ('13k9ee1h-5g2g-2jh2-07h0-h21fd098jh50', 'Grace', 'Lee', 'grace.lee@example.com', 'hash3456', '+9012345678', '1d54ac32-0a7a-4db6-91b3-b768f56dca24', CURRENT_TIMESTAMP),
    ('18x7pl9h-4j1h-4zz1-08i1-i32gd099ki50', 'Henry', 'Mills', 'henry.mills@example.com', 'hash9999', '+8765432190', '1d54ac32-0a7a-4db6-91b3-b768f56dca24', CURRENT_TIMESTAMP),
    
    -- Hosts
    ('7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Alice', 'Smith', 'alice.smith@example.com', 'hash456', '+9876543210', '2c6bc242-15d8-4763-8899-1aaf7c2d5f56', CURRENT_TIMESTAMP),
    ('10h6bb7e-2d9d-8ge9-04e7-e98fa765ge27', 'David', 'Brown', 'david.brown@example.com', 'hash5678', '+6789012345', '2c6bc242-15d8-4763-8899-1aaf7c2d5f56', CURRENT_TIMESTAMP),
    ('12j8dd9g-4f1f-1ig1-06g9-g10fc987ig49', 'Frank', 'Thomas', 'frank.thomas@example.com', 'hash2345', '+8901234567', '2c6bc242-15d8-4763-8899-1aaf7c2d5f56', CURRENT_TIMESTAMP),
    ('15m2gg3j-7i4i-4lj4-09j2-j43gf21lj722', 'Ivy', 'Lopez', 'ivy.lopez@example.com', 'hash5678', '+2345678912', '2c6bc242-15d8-4763-8899-1aaf7c2d5f56', CURRENT_TIMESTAMP),
    
    -- Admins
    ('8f4cc7d2-2c9c-6ed8-03c5-b87d9f63fc15', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hash789', '+1122334455', '3f6cba42-25e9-4763-8899-1aaf7c2d5f57', CURRENT_TIMESTAMP),
    ('11i7cc8f-3e0e-9hf0-05f8-f09fb876hf38', 'Eve', 'Taylor', 'eve.taylor@example.com', 'hash9101', '+7890123456', '3f6cba42-25e9-4763-8899-1aaf7c2d5f57', CURRENT_TIMESTAMP);

-- Insert Data into Location
INSERT INTO Location (location_id, address, city, state, country)
VALUES
    ('1abc23de-456f-78g9-h012-ijkl34567890', '123 Main St', 'San Francisco', 'CA', 'USA'),
    ('2bcd34ef-567g-89h0-i123-jklm45678901', '456 Elm St', 'Los Angeles', 'CA', 'USA'),
    ('3cde45fg-678h-90i1-j234-klmn56789012', '789 Pine St', 'New York', 'NY', 'USA'),
    ('4def56hi-891j-23l4-m567-nopq89012345', '321 Oak St', 'Chicago', 'IL', 'USA'),
    ('5ghi67ij-902k-34m5-n678-opqr90123456', '654 Maple St', 'Seattle', 'WA', 'USA'),
    ('6ijk78kl-013l-45n6-o789-pqrs01234567', '987 Birch St', 'Austin', 'TX', 'USA'),
    ('7jkl89lm-124m-56o7-p890-rstu12345678', '159 Cedar St', 'Denver', 'CO', 'USA'),
    ('8klm90mn-235n-67p8-q901-stuv23456789', '753 Spruce St', 'Miami', 'FL', 'USA'),
    ('9lmn01no-346o-78q9-r012-tuvw34567890', '852 Willow St', 'Portland', 'OR', 'USA'),
    ('10mno12op-457p-89r0-s123-uvwx4567890', '456 Redwood St', 'Atlanta', 'GA', 'USA');

-- Insert Data into Property
INSERT INTO Property (
        property_id,
        host_id,
        name,
        description,
        location_id,
        price_per_night,
        created_at,
        updated_at
    )
VALUES
    ('9de345fg-678h-90i1-j234-klmn56789012', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Cozy Apartment', 'A modern, cozy apartment in downtown SF.', '1abc23de-456f-78g9-h012-ijkl34567890', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('8cd456gh-789i-01j2-k345-lmno67890123', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Beach House', 'A beautiful beach house with stunning ocean views.', '2bcd34ef-567g-89h0-i123-jklm45678901', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('7bc567hi-890j-12k3-l456-mnop78901234', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Luxury Condo', 'A luxury condo in the heart of Manhattan.', '3cde45fg-678h-90i1-j234-klmn56789012', 500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('6ab678ij-901k-23l4-m567-opqr89012345', '10h6bb7e-2d9d-8ge9-04e7-e98fa765ge27', 'Mountain Cabin', 'A peaceful cabin in the mountains.', '4def56hi-891j-23l4-m567-nopq89012345', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('5fg789kl-012l-34m5-n678-pqrs90123456', '10h6bb7e-2d9d-8ge9-04e7-e98fa765ge27', 'City Studio', 'A stylish studio in downtown Chicago.', '5ghi67ij-902k-34m5-n678-opqr90123456', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('4kl012mn-123o-45p6-q789-rstu01234567', '15m2gg3j-7i4i-4lj4-09j2-j43gf21lj722', 'Desert Retreat', 'A serene retreat in the Arizona desert.', '6ijk78kl-013l-45n6-o789-pqrs01234567', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('3mn234op-234p-56q7-r890-stuv12345678', '15m2gg3j-7i4i-4lj4-09j2-j43gf21lj722', 'Lake House', 'A relaxing house by the lake.', '7jkl89lm-124m-56o7-p890-rstu12345678', 220.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('2op456qr-345q-67r8-s901-uvwx23456789', '15m2gg3j-7i4i-4lj4-09j2-j43gf21lj722', 'Urban Loft', 'A trendy loft in downtown Portland.', '9lmn01no-346o-78q9-r012-tuvw34567890', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('1qr678st-456r-78s9-t012-wxyz34567890', '12j8dd9g-4f1f-1ig1-06g9-g10fc987ig49', 'Countryside Cottage', 'A cozy cottage in the countryside.', '8klm90mn-235n-67p8-q901-stuv23456789', 160.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('0st890uv-567s-89t0-u123-xyza45678901', '12j8dd9g-4f1f-1ig1-06g9-g10fc987ig49', 'Penthouse Suite', 'A luxurious penthouse with panoramic views.', '10mno12op-457p-89r0-s123-uvwx4567890', 550.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

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
VALUES
    ('1aaa22bb-333c-444d-555e-666ff777888g', '9de345fg-678h-90i1-j234-klmn56789012', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', '2024-12-01', '2024-12-07', 1050.00, 'confirmed', CURRENT_TIMESTAMP),
    ('2bbb33cc-444d-555e-666f-777gg888999h', '8cd456gh-789i-01j2-k345-lmno67890123', '9g5aa6d3-1c8c-7fd8-03d6-d87e9g64fd16', '2024-12-10', '2024-12-15', 1500.00, 'pending', CURRENT_TIMESTAMP),
    ('3ccc44dd-555e-666f-777g-888hh999aaa1', '7bc567hi-890j-12k3-l456-mnop78901234', '13k9ee1h-5g2g-2jh2-07h0-h21fd098jh50', '2024-12-20', '2024-12-25', 2500.00, 'confirmed', CURRENT_TIMESTAMP),
    ('4ddd55ee-666f-777g-888h-999ii000bbb2', '6ab678ij-901k-23l4-m567-opqr89012345', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', '2025-01-01', '2025-01-05', 1000.00, 'cancelled', CURRENT_TIMESTAMP),
    ('5eee66ff-777g-888h-999i-000jj111ccc3', '5fg789kl-012l-34m5-n678-pqrs90123456', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', '2025-01-10', '2025-01-15', 500.00, 'confirmed', CURRENT_TIMESTAMP);


-- Insert Data into Review
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('1rev01ab-234c-45d6-e789-fghi12345678', '9de345fg-678h-90i1-j234-klmn56789012', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', 5, 'Amazing place!', CURRENT_TIMESTAMP),
    ('2rev23cd-345d-56e7-f890-ghij23456789', '8cd456gh-789i-01j2-k345-lmno67890123', '9g5aa6d3-1c8c-7fd8-03d6-d87e9g64fd16', 4, 'Great views, but a bit noisy.', CURRENT_TIMESTAMP),
    ('3rev45ef-456e-67f8-g901-hijk34567890', '7bc567hi-890j-12k3-l456-mnop78901234', '13k9ee1h-5g2g-2jh2-07h0-h21fd098jh50', 5, 'Perfect for our family vacation.', CURRENT_TIMESTAMP),
    ('4rev67gh-567f-78g9-h012-ijkl45678901', '6ab678ij-901k-23l4-m567-opqr89012345', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', 3, 'Good, but needed better cleaning.', CURRENT_TIMESTAMP),
    ('5rev89ij-678g-89h0-i123-jklm56789012', '5fg789kl-012l-34m5-n678-pqrs90123456', '18x7pl9h-4j1h-4zz1-08i1-i32gd099ki50', 4, 'Nice and cozy studio.', CURRENT_TIMESTAMP);

-- Insert Data into Message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('1msg23cd-456e-78g9-i234-jklm56789012', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Hello! I am interested in your property.', CURRENT_TIMESTAMP),
    ('2msg45ef-567f-89h0-j345-klmn67890123', '9g5aa6d3-1c8c-7fd8-03d6-d87e9g64fd16', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Can you provide more pictures?', CURRENT_TIMESTAMP),
    ('3msg67gh-678g-90i1-k456-lmno78901234', '13k9ee1h-5g2g-2jh2-07h0-h21fd098jh50', '10h6bb7e-2d9d-8ge9-04e7-e98fa765ge27', 'Is the property available for next week?', CURRENT_TIMESTAMP),
    ('4msg89ij-789h-01j2-l567-mnop89012345', '6f2aa5b2-0a7a-4db6-91b3-b768f56dca11', '7f3bb6c2-1b8b-5dc7-02b4-a87c8f53eb14', 'Can we check in earlier?', CURRENT_TIMESTAMP),
    ('5msg01kl-890i-12k3-m678-nopq90123456', '18x7pl9h-4j1h-4zz1-08i1-i32gd099ki50', '12j8dd9g-4f1f-1ig1-06g9-g10fc987ig49', 'Thanks for hosting us!', CURRENT_TIMESTAMP);
