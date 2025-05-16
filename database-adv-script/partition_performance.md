# Partitioning Performance Report Guide

This document provides a step-by-step guide on how to partition the `Booking` table by date range in both MySQL and PostgreSQL. Partitioning can improve query performance for large datasets by dividing the table into smaller, more manageable pieces. 

---

After following the steps, you can check performance as follows:

- Use `EXPLAIN ANALYZE` to evaluate query performance.
- Check query execution times and ensure partitions are being utilized effectively.

---

### Important Note
Always ensure you have a complete backup of your data before running any partitioning scripts.