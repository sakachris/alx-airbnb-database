# Database Normalization to Third Normal Form (3NF)

## Objective
Apply normalization principles to ensure the schema satisfies 3NF by eliminating redundancy and transitive dependencies.

---

## Normalization Process

### First Normal Form (1NF)
- All fields contain atomic values.
- No repeating groups or arrays are present in any table.
- ✅ All tables satisfy 1NF.

### Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the entire primary key.
- No partial dependencies exist.
- ✅ All tables satisfy 2NF.

### Third Normal Form (3NF)
- All transitive dependencies have been eliminated to ensure non-key attributes depend only on the primary key.

#### User Table
- Fully normalized.
- `role` remains as an ENUM value directly related to the user.
- ✅ 3NF Compliant.

#### Property Table
- The original `location` attribute (a plain VARCHAR) has been removed.
- A separate `Location` table has been introduced with attributes such as `location_id`, `city`, `state`, and `country`.
- The `Property` table now references `Location` via a foreign key `location_id`.
- ✅ 3NF Compliant.

#### Booking Table
- The `total_price` attribute has been removed to eliminate redundancy and transitive dependency.
- Price-related calculations (e.g., `price_per_night × number_of_nights`) are now handled at the application or query level.
- ✅ 3NF Compliant.

#### Payment Table
- All fields are directly dependent on the primary key.
- No transitive dependencies exist.
- ✅ 3NF Compliant.

#### Review Table
- All fields depend directly on the primary key.
- ✅ 3NF Compliant.

#### Message Table
- Each message is identified by a primary key and depends solely on it.
- ✅ 3NF Compliant.

---

## Final Verdict
✅ The database schema is fully normalized to Third Normal Form (3NF). Redundant and transitive dependencies have been eliminated through the removal of derived fields and the introduction of relational integrity via normalization (e.g., separate `Location` table).