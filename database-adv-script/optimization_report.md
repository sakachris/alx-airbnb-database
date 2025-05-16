```markdown
# Optimization Report

This document provides an analysis of the query execution plan and highlights areas for optimization.

It includes details such as table scans, joins, and index usage. The following provide insights into the operations performed during query execution.
```

```plaintext
-> Table scan on <temporary> (actual time=7.13..7.14 rows=37 loops=1)
    -> Aggregate using temporary table (actual time=7.13..7.13 rows=37 loops=1)
        -> Nested loop inner join (cost=25.8 rows=64.1) (actual time=2.72..4.05 rows=71 loops=1)
            -> Filter: (u.`role` = 'guest') (cost=10.8 rows=33.3) (actual time=2.02..2.95 rows=50 loops=1)
                -> Table scan on u (cost=10.8 rows=100) (actual time=1.92..2.83 rows=100 loops=1)
            -> Covering index lookup on b using idx_booking_user_id (user_id=u.user_id) (cost=0.264 rows=1.92) (actual time=0.0146..0.0164 rows=1.42 loops=50)
```
