-- USE littlelemondb;
----------------------------------------------------------------------------------------

-- Task 1
-- Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 

-- INSERT INTO bookings(bookingDate, tableno, customerid)
-- values ('2022-10-10',5,1), ('2022-11-12',3,3), ('2022-10-11',2,2), ('2022-10-13',2,1);

-- SELECT * FROM bookings

----------------------------------------------------------------------------------------
-- Task 2
-- For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.

-- The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.

-- DELIMITER //
-- CREATE PROCEDURE CheckBooking(IN tablenoinput INT, IN bookingdateinput DATE)
-- BEGIN
-- 	DECLARE is_book INT;
--     SET is_book  = (SELECT 1 FROM bookings WHERE tableNo = tablenoinput and bookingDate = bookingdateinput);
--     IF is_book = 1 THEN
-- 	SELECT CONCAT('Table ', tablenoinput, ' is already booked') AS confirmation;
--     ELSE SELECT CONCAT('Table ', tablenoinput, ' is not booked') AS confirmation ;
-- 	END IF;
-- END//
-- DELIMITER ;

-- CALL CheckBooking(5, '2023-01-01');

----------------------------------------------------------------------------------------
-- Task 3
-- For your third and final task, Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 

-- Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction. 

-- To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  

-- Use the following guidelines to complete this task:

-- The procedure should include two input parameters in the form of booking date and table number.

-- It also requires at least one variable and should begin with a START TRANSACTION statement.

-- Your INSERT statement must add a new booking record using the input parameter's values.

-- Use an IF ELSE statement to check if a table is already booked on the given date. 

-- If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 
-- DELIMITER //
-- CREATE PROCEDURE AddValidBooking(IN tablenoinput INT, IN bookingdateinput DATE)
-- BEGIN
-- 	DECLARE is_book INT;
--     SET is_book  = (SELECT 1 FROM bookings WHERE tableNo = tablenoinput and bookingDate = bookingdateinput);
-- 	START TRANSACTION;
--     INSERT INTO bookings(bookingdate, tableno) values(bookingdateinput, tablenoinput);
--     IF is_book = 1 THEN
-- 		SELECT CONCAT('Table ', tablenoinput, ' is already booked') AS confirmation;
-- 		ROLLBACK;
--     ELSE 
-- 		SELECT CONCAT('Table ', tablenoinput, ' is not booked') AS confirmation; 
--         COMMIT;
-- 	END IF;

-- END//
-- DELIMITER ;

-- CALL AddValidBooking(5, '2023-01-01');
----------------------------------------------------------------------------------------