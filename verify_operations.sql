-- ==========================================================
-- SQL Verification Script for Greenwood Cultural Association
-- Compatible with SQL Server
-- ==========================================================

-- ==========================================================
-- OPERATIONS (Data Modification)
-- ==========================================================

-- 1. Booking tickets
INSERT INTO Booking (booking_number, booking_date, number_of_tickets, status, client_number, event_number)
VALUES (4, '2026-05-01', 2, 'Booked', 1, 1);

-- 2. Changing the number of tickets in a booking
UPDATE Booking
SET number_of_tickets = 3
WHERE booking_number = 4;

-- 3. Changing ticket booking status to "sold"
UPDATE Booking
SET status = 'Sold'
WHERE booking_number = 4;

-- 4. Cancelling a ticket booking
UPDATE Booking
SET status = 'Cancelled'
WHERE booking_number = 4;

-- 5. Removing unpurchased bookings after 3 days
-- Assuming booking_date is '2026-05-01', this would remove it if today is > '2026-05-04'
DELETE FROM Booking
WHERE status = 'Booked' AND booking_date < DATEADD(day, -3, GETDATE());

-- 6. Cancelling an event
UPDATE Event
SET status = 'Cancelled'
WHERE event_name = 'Event 1';

-- 7. Refunding a client (Implies setting booking status to Cancelled for a cancelled event)
UPDATE Booking
SET status = 'Refunded'
WHERE event_number IN (SELECT event_number FROM Event WHERE status = 'Cancelled')
AND status = 'Sold';

-- ==========================================================
-- QUERIES (Data Retrieval)
-- ==========================================================

-- 1. What is Taylor's contact info?
SELECT contact_info FROM Artist WHERE artist_name = 'Taylor';

-- 2. Which artists are scheduled to perform in a specific event?
SELECT a.artist_name 
FROM Artist a
JOIN Artist_Event ae ON a.artist_number = ae.artist_number
JOIN Event e ON ae.event_number = e.event_number
WHERE e.event_name = 'Event 1'; -- Placeholder

-- 4. When is an artist's performance and what are their special requests?
SELECT e.event_date, sr.request_description 
FROM Artist a
JOIN Artist_Event ae ON a.artist_number = ae.artist_number
JOIN Event e ON ae.event_number = e.event_number
JOIN SpecificRequest sr ON a.artist_number = sr.artist_number
WHERE a.artist_name = 'Taylor';


-- 5. What events are coming up this year?
SELECT * FROM Event WHERE YEAR(event_date) = 2026;

-- 6. What dance performances are coming up this year?
SELECT * FROM Event WHERE event_name LIKE '%Dance%' AND YEAR(event_date) = 2026;

-- 7. How many tickets have been sold so far for a specific concert?
SELECT SUM(number_of_tickets) 
FROM Booking 
WHERE event_number = 1 AND status = 'Sold';

-- 8. How many tickets remain for a concert?
-- Venue capacity - SUM(tickets)
SELECT v.capacity - ISNULL((SELECT SUM(number_of_tickets) FROM Booking b WHERE b.event_number = e.event_number AND b.status IN ('Booked', 'Sold')), 0) as remaining_tickets
FROM Event e
JOIN Venue v ON e.venue_number = v.venue_number
WHERE e.event_name = 'Event 1';

-- 9. Revenue generated from ticket sales this year?
SELECT SUM(b.number_of_tickets * e.ticket_price) as total_revenue
FROM Booking b
JOIN Event e ON b.event_number = e.event_number
WHERE b.status = 'Sold' AND YEAR(b.booking_date) = 2026;
