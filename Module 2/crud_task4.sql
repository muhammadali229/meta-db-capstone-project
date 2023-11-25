-- USE littlelemondb;
----------------------------------------------------------------------------------------

-- In this first task you need to create a new procedure called AddBooking to add a new table booking record.

-- The procedure should include four input parameters in the form of the following bookings parameters:

-- booking id, 

-- customer id, 

-- booking date,

-- and table number.

-- DELIMITER //
-- CREATE PROCEDURE AddBooking(IN tablenoinput INT, IN bookingdateinput DATE, IN customerid INT)
-- BEGIN
-- 	INSERT INTO bookings(bookingdate, tableno, customerid) values(bookingdateinput, tablenoinput, customerid);
--     SELECT 'New Booking Added';
-- END//
-- DELIMITER ;

-- CALL AddBooking(3, '2023-01-01', 2);
----------------------------------------------------------------------------------------

-- Task 2
-- For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.

-- The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 
-- DELIMITER //
-- CREATE PROCEDURE UpdateBooking (IN bookingdateinput DATE, IN bookingidinput INT)
-- BEGIN
-- 	DECLARE is_book INT;
--     SET is_book  = (SELECT 1 FROM bookings WHERE bookingid = bookingidinput);
--     IF is_book = 1 THEN
-- 	UPDATE bookings
--     SET 
-- 		bookingdate = bookingdateinput
-- 	WHERE 
-- 		bookingid = bookingidinput;
--     SELECT CONCAT('Booking', bookingidinput, ' is updated');
--     ELSE SELECT CONCAT('Booking id ', bookingidinput, ' not exist') AS confirmation ;
-- 	END IF;
-- END//
-- DELIMITER ;

-- CALL UpdateBooking('2023-01-01', 3);

----------------------------------------------------------------------------------------
-- Task 3
-- For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.

-- The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 

-- DELIMITER //
-- CREATE PROCEDURE CancelBooking(IN bookingidinput INT)
-- BEGIN
-- 	DECLARE is_book INT;
--     SET is_book  = (SELECT 1 FROM bookings WHERE bookingid = bookingidinput);
--     IF is_book = 1 THEN
-- 	DELETE FROM bookings WHERE bookingid = bookingidinput;
-- 	SELECT CONCAT('Booking ', bookingidinput, ' is canelled') AS confirmation;
--     ELSE SELECT CONCAT('Booking ', bookingidinput, ' is not exist') AS confirmation ;
-- 	END IF;
-- END//
-- DELIMITER ;

-- CALL CancelBooking(5);
----------------------------------------------------------------------------------------