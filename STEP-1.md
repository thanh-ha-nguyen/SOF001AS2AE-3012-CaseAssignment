# Step 1: Database modelling and logical design

Change history:

| Team member | Task | Working time |
| --- | --- | --- |
| Thanh Ha Nguyen | Create ER diagram draft | 2 hours |
| ... | ... | ... |

## Conceptual Design

```mermaid
---
title: Greenwood Cultural Association
---
erDiagram
    Client many optionally to many Booking: "creates"
    Event one to many Booking : "has"
    Event many optionally to one Venue: "is hold at"
    Artist many optionally to many Event : "performs"
    Artist one to many SpecificRequest : "has"
```