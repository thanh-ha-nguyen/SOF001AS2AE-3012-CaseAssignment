# Step 1: Database modelling and logical design

Change history:

| Team member | Task | Working time |
| --- | --- | --- |
| Thanh Ha Nguyen | Create an ER diagram draft | 2 hours |
| Thanh Ha Nguyen | Revise the ER diagram, add the ERD-like class diagram and the logical design | 6 hours |
| ... | ... | ... |

## Conceptual Design (ER Diagram)

```mermaid
---
title: Greenwood Cultural Association (ERD)
---
erDiagram
    Client {
        string phone_number
    }
    Venue {
        string venue_name
        string address
        int capacity
    }
    Artist {
        string artist_name
        string contact_info
    }
    SpecificRequest {
        string request_description
    }
    Event {
        string event_name
        date event_date
        time event_time
        decimal ticket_price
        string status
    }
    Booking {
        string booking_number
        date booking_date
        int number_of_tickets
        string status
    }

    Client ||--|{ Booking : "creates"
    Artist ||--|{ SpecificRequest : "has"
    Artist }o--o{ Event : "performs"
    Event ||--|{ Booking : "has"
    Venue ||--|{ Event : "holds"
```

## Conceptual Design (Class Diagram)

This diagram represents the same entities and relationships as the ER diagram above but in a different style of ERD taught in the course.

```mermaid
---
title: Greenwood Cultural Association (Class Diagram))
---
classDiagram
    class Client {
        phone_number
    }
    class Venue {
        venue_name
        address
        capacity
    }
    class Artist {
        artist_name
        contact_info
    }
    class SpecificRequest {
        request_description
    }
    class Event {
        event_name
        event_date
        event_time
        ticket_price
        status
    }
    class Booking {
        booking_number UK
        booking_date
        number_of_tickets
        status
    }

    Client "1..1" -- "0..*" Booking : creates ▶
    Artist "1..1" -- "0..*" SpecificRequest : has ▶
    Artist "1..*" -- "0..*" Event : performs ▶
    Event "1..1" -- "0..*" Booking : has ▶
    Venue "1..1" -- "0..*" Event : holds ▶
```

## Logical Database Design (Relation Schemas)

This section outlines the relational schema derived from the conceptual model, including primary keys and foreign keys to represent relationships and ensure data integrity.

<pre>
Client (<ins>client_number</ins>, phone_number)
Venue (<ins>venue_number</ins>, venue_name, address, capacity)
Artist (<ins>artist_number</ins>, artist_name, contact_info)
SpecificRequest (<ins>request_number</ins>, request_description, artist_number)
    FK (artist_number) REFERENCES Artist (artist_number)
Event (<ins>event_number</ins>, event_name, event_date, event_time, ticket_price, status, venue_number)
    FK (venue_number) REFERENCES Venue (venue_number)
Booking (<ins>booking_number</ins>, booking_date, number_of_tickets, status, client_number, event_number)
    FK (client_number) REFERENCES Client (client_number)
    FK (event_number) REFERENCES Event (event_number)
</pre>
