CREATE TABLE Client (
  client_number INT PRIMARY KEY, 
  phone_number VARCHAR(10) NOT NULL
);

CREATE TABLE Venue (
  venue_number INT PRIMARY KEY, 
  venue_name VARCHAR(50) NOT NULL, 
  address VARCHAR(50) NOT NULL, 
  capacity INT NOT NULL
);

CREATE TABLE Artist (
  artist_number INT PRIMARY KEY, 
  artist_name VARCHAR(50) NOT NULL, 
  contact_info VARCHAR(50)
);

CREATE TABLE SpecificRequest (
  request_number INT PRIMARY KEY, 
  request_description VARCHAR(50), 
  artist_number INT NOT NULL,
  CONSTRAINT SpecificRequest_Artist FOREIGN KEY (artist_number) REFERENCES Artist (artist_number)
);

CREATE TABLE Event (
  event_number INT PRIMARY KEY, 
  event_name VARCHAR(50) NOT NULL, 
  event_date DATE NOT NULL, 
  event_time TIME NOT NULL, 
  ticket_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) NOT NULL, 
  venue_number INT NOT NULL,
  CONSTRAINT Event_Venue FOREIGN KEY (venue_number) REFERENCES Venue (venue_number)
);

CREATE TABLE Artist_Event (
  artist_number INT NOT NULL,
  event_number INT NOT NULL,
  PRIMARY KEY (artist_number, event_number),
  CONSTRAINT FK_Artist FOREIGN KEY (artist_number) REFERENCES Artist(artist_number),
  CONSTRAINT FK_Event FOREIGN KEY (event_number) REFERENCES Event(event_number)
);

CREATE TABLE Booking (
  booking_number INT PRIMARY KEY, 
  booking_date DATE NOT NULL, 
  number_of_tickets INT NOT NULL, 
  status VARCHAR(50) NOT NULL, 
  client_number INT NOT NULL, 
  event_number INT NOT NULL,
  CONSTRAINT Booking_Client FOREIGN KEY (client_number) REFERENCES Client(client_number),
  CONSTRAINT Booking_Event FOREIGN KEY (event_number) REFERENCES Event(event_number)
);
