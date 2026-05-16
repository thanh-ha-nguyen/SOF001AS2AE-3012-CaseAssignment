# Case Assignment Closing Report

## 1. Fulfillment of Requirements
The database system developed for the Greenwood Cultural Association successfully fulfills all requirements outlined in the case assignment.
- All entities (Client, Venue, Artist, SpecificRequest, Event, Booking) have been defined, implemented, and mapped with the appropriate relationships (e.g., many-to-many between Artists and Events, one-to-many between Venue and Events).
- All 16 required operations and queries (booking tickets, changing booking status, refunding, etc.) have been implemented and validated through SQL scripts.
- Data integrity constraints have been correctly applied, and all test data successfully inserted and verified.

## 2. Successes and Challenges
### Successes:
- **Conceptual Modeling:** The ER diagram successfully captured the complex relationships, including the many-to-many relationship between artists and events.
- **Robust Implementation:** The SQL scripts efficiently created the necessary tables, indexes, and constraints, ensuring a clean and functional database structure.
- **Testing:** The validation phase, including both automated checks and manual queries, confirmed that all business requirements were met.

### Challenges:
- **Design Iterations:** Refining the relational schema to be in BCNF and handling the many-to-many relationship between Artists and Events required multiple iterations.
- **Constraint Definition:** Setting up appropriate integrity constraints while ensuring the database operations (like removing unpurchased bookings) remained straightforward was challenging.

## 3. Lessons Learned
- **Importance of Planning:** Investing more time in conceptual modeling significantly reduced the effort required during the physical implementation phase.
- **Iterative Improvement:** The realization that database designs often change during development was key; maintaining flexibility in our design documents was essential.
- **Testing Value:** Thorough testing is crucial to ensure all business rules are correctly enforced and all operations perform as expected.

## Working Time Records

| Team member | Task | Working time |
|-------------|------|--------------|
| Thanh Ha Nguyen | Conceptual & logical design, ERD, Entity definitions | 12 hours |
| Ngoc Nguyen | Review design, ERD, Implementation, Testing | 10 hours |
| Thao Dinh | Review logical design, SQL scripts, Testing, Report | 7 hours |
