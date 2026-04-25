CREATE table Client (
  client_number INT PRIMARY KEY, 
  phone_number VARCHAR(10) NOT NULL
);

CREATE TABLE Venue (
  venue_number INT primary key, 
  venue_name varchar(50) not NULL, 
  address varchar(50) not NULL, 
  capacity INT not NULL
);

CREATE TABLE Artist (
  artist_number INT primary key, 
  artist_name varchar(50) not NULL, 
  contact_info varchar(50)
);

CREATE TABLE SpecificRequest (
  request_number INT primary key, 
  request_description VARCHAR(50), 
  artist_number int not NULL,
  CONSTRAINT SpecificRequest_Artist FOREIGN KEY (artist_number) REFERENCES Artist (artist_number)
);

CREATE TABLE Event (
  event_number INT primary key, 
  event_name VARCHAR(50) NOT NULL, 
  event_date date NOT NULL, 
  event_time TIME NOT NULL, 
  ticket_price DECIMAL NOT NULL, 
  status VARCHAR(50) NOT NULL, 
  venue_number INT NOT NULL,
  CONSTRAINT Event_Venue FOREIGN KEY (venue_number) REFERENCES Venue (venue_number)
);

CREATE INDEX IX_venue ON Event(event_number);

CREATE TABLE Booking (
  booking_number INT primary key, 
  booking_date date NOT NULL, 
  number_of_tickets INT NOT NULL, 
  status VARCHAR(50) NOT NULL, 
  client_number INT NOT NULL, 
  event_number INT NOT NULL,
  CONSTRAINT Booking_Client FOREIGN KEY (client_number) REFERENCES Client(client_number),
  CONSTRAINT Booking_Event FOREIGN KEY (event_number) REFERENCES Event(event_number)
);

CREATE INDEX IX_client_number ON Booking(client_number);
CREATE INDEX IX_event_number ON Booking(event_number);

