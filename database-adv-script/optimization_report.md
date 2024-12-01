# Optimization Report for Query Performance

## 1. Initial Query Analysis

### Query Description

The query retrieves all bookings along with details about:

- Users
- Properties
- Locations
- Payments
- Payment methods

### Performance Results

**Initial Execution Plan:**

```plaintext
-> Sort: b.created_at DESC  (actual time=0.26..0.263 rows=5 loops=1)
    -> Stream results  (cost=2.37 rows=5) (actual time=0.13..0.237 rows=5 loops=1)
        -> Nested loop left join  (cost=2.37 rows=5) (actual time=0.101..0.18 rows=5 loops=1)
            -> Left hash join (py.booking_id = b.booking_id)  (cost=0.871 rows=5) (actual time=0.0986..0.175 rows=5 loops=1)
                -> Nested loop left join  (cost=6 rows=5) (actual time=0.058..0.129 rows=5 loops=1)
                    -> Nested loop left join  (cost=4.25 rows=5) (actual time=0.0479..0.1 rows=5 loops=1)
                        -> Nested loop left join  (cost=2.5 rows=5) (actual time=0.0368..0.07 rows=5 loops=1)
                            -> Table scan on b  (cost=0.75 rows=5) (actual time=0.0172..0.0248 rows=5 loops=1)
                            -> Single-row index lookup on u using PRIMARY (user_id=b.user_id)  (cost=0.27 rows=1) (actual time=0.00852..0.00854 rows=1 loops=5)
                        -> Single-row index lookup on p using PRIMARY (property_id=b.property_id)  (cost=0.27 rows=1) (actual time=0.00564..0.00568 rows=1 loops=5)
                    -> Single-row index lookup on l using PRIMARY (location_id=p.location_id)  (cost=0.27 rows=1) (actual time=0.00546..0.0055 rows=1 loops=5)
                -> Hash
                    -> Table scan on py  (cost=0.0785 rows=1) (actual time=0.0219..0.0219 rows=0 loops=1)
            -> Single-row index lookup on pm using PRIMARY (payment_method_id=py.payment_method_id)  (cost=0.22 rows=1) (actual time=560e-6..560e-6 rows=0 loops=5)
```
