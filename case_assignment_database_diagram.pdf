## database diagram
```mermaid
---
config:
  layout: elk
---
erDiagram
  CLIENT ||--o{ BOOKING : makes
  VENUE ||--o{ EVENT : hosts
  ARTIST ||--o{ SPECIFICREQUEST : has
  ARTIST }o--|| ARTIST_EVENT : participates
  EVENT }o--|| ARTIST_EVENT : features
  EVENT ||--o{ BOOKING : receives

  CLIENT {
    int client_number PK
    string phone_number
  }

  VENUE {
    int venue_number PK
    string venue_name
    string address
    int capacity
  }

  ARTIST {
    int artist_number PK
    string artist_name
    string contact_info
  }

  SPECIFICREQUEST {
    int request_number PK
    string request_description
    int artist_number FK
  }

  EVENT {
    int event_number PK
    string event_name
    date event_date
    time event_time
    decimal ticket_price
    string status
    int venue_number FK
  }

  ARTIST_EVENT {
    int artist_number FK
    int event_number FK
  }

  BOOKING {
    int booking_number PK
    date booking_date
    int number_of_tickets
    string status
    int client_number FK
    int event_number FK
  }
```
