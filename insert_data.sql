INSERT INTO Client values (1, '01234567890');
INSERT INTO Client values (2, '03456788522');
INSERT INTO Client values (3, '01236665554');
INSERT INTO Client values (4, '07897897893');
INSERT INTO Client values (5, '02344321234');

INSERT INTO Venue values (1, 'Venue A', 'AvaStreet 1', 60);
INSERT INTO Venue values (2, 'Venue B', 'AvaStreet 5', 250);
INSERT INTO Venue values (3, 'Venue C', 'AvaStreet 10', 600);

INSERT INTO Artist VALUES (1, 'Taylor', '0989898989');
INSERT INTO Artist VALUES (2, 'Sam', '0967856784');
INSERT INTO Artist VALUES (3, 'John', '0343434343');

INSERT INTO SpecificRequest VALUES (1, 'Vegan food', 1);
INSERT INTO SpecificRequest VALUES (2, 'Hotel room', 3);

INSERT INTO Event VALUES (1, 'Event 1', '2026-03-14', '17:00', 50.00, 'scheduled', 1);
INSERT INTO Event VALUES (2, 'Event 2', '2026-02-10', '14:00', 20.00, 'cancelled', 2);
INSERT INTO Event VALUES (3, 'Event 3', '2026-06-24', '10:00', 30.50, 'scheduled', 1);
INSERT INTO Event VALUES (4, 'Event 4', '2026-09-30', '12:00', 14.25, 'scheduled', 3);
INSERT INTO Event VALUES (5, 'Event 5', '2026-12-25', '09:00', 05.30, 'scheduled', 2);

INSERT INTO Booking VALUES (1, '2026-04-27', 2, 'Confirmed', 1, 1);
INSERT INTO Booking VALUES (2, '2026-04-28', 4, 'Pending', 2, 2);
INSERT INTO Booking VALUES (3, '2026-04-29', 1, 'Cancelled', 3, 3);
