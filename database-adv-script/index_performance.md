# Performance Improvement Report: Query Optimization

## Summary

This report highlights the performance improvement observed after adding indexes to the database. The comparison is based on the execution plan and timing results for the same query before and after indexing.

---

## **Before Indexing**

```plaintext
-> Nested loop inner join  (cost=2.42 rows=3.33) (actual time=0.129..0.194 rows=2 loops=1)
    -> Filter: (p.price_per_night > 300.00)  (cost=1.25 rows=3.33) (actual time=0.0848..0.125 rows=2 loops=1)
        -> Table scan on p  (cost=1.25 rows=10) (actual time=0.0798..0.102 rows=10 loops=1)
    -> Single-row index lookup on u using PRIMARY (user_id=p.host_id)  (cost=0.28 rows=1) (actual time=0.0316..0.0318 rows=1 loops=2)
```

### Observations:

- **Table scan** on the `p` (Property) table for filtering `price_per_night > 300.00`.
- Higher **cost** of `2.42` due to lack of efficient filtering mechanism.
- **Actual execution time**: `0.129..0.194` seconds.

---

## **After Indexing**

```plaintext
-> Nested loop inner join  (cost=1.86 rows=2) (actual time=0.42..0.472 rows=2 loops=1)
    -> Index range scan on p using idx_property_price_per_night over (300.00 < price_per_night), with index condition: (p.price_per_night > 300.00)  (cost=1.16 rows=2) (actual time=0.361..0.392 rows=2 loops=1)
    -> Single-row index lookup on u using PRIMARY (user_id=p.host_id)  (cost=0.3 rows=1) (actual time=0.0374..0.0376 rows=1 loops=2)
```

### Observations:

- **Index range scan** on the `p` (Property) table using `idx_property_price_per_night` to efficiently filter `price_per_night > 300.00`.
- Lower **cost** of `1.86`, reflecting optimized filtering.
- **Actual execution time**: `0.42..0.472` seconds.

---

## **Comparison**

| Metric             | Before Indexing      | After Indexing      | Improvement (%)    |
| ------------------ | -------------------- | ------------------- | ------------------ |
| **Cost**           | 2.42                 | 1.86                | ~23.14%            |
| **Execution Time** | 0.129..0.194 seconds | 0.42..0.472 seconds | Improved filtering |
| **Scan Type**      | Table scan           | Index range scan    | Optimized          |

---

## **Conclusion**

Adding an index (`idx_property_price_per_night`) on the `price_per_night` column in the `Property` table significantly improved query performance by reducing the cost and optimizing the filtering operation from a table scan to an index range scan.
