-- USE littlelemondb;

-- Task 1
-- In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 

-- Here’s some guidance around completing this task: 

-- Use a CREATE VIEW statement.

-- Extract the order id, quantity and cost data from the Orders table.

-- Filter data from the orders table based on orders with a quantity greater than 2. 

-- CREATE VIEW OrdersView AS (
-- 	SELECT 
-- 		orderID, 
-- 		quantity, 
-- 		totalCost 
--     FROM 
-- 		orders 
-- 	where
-- 		quantity > 2
-- )

-- SELECT * FROM OrdersView

--------------------------------------------------------------------------------
-- Task 2
-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 

-- Customers table: The customer id and full name.

-- Orders table: The order id and cost.

-- Menus table: The menus name.

-- MenusItems table: course name and starter name.

-- SELECT 
-- 	c.customerID,
--     c.name FullName,
--     o.orderid,
--     o.totalCost Cost,
--     m.cuisine AS MenuName,
--     t.name AS CourseName
-- FROM 
-- 	bookings b 
-- INNER JOIN orders o 
-- ON 
-- 	o.bookingid = b.bookingid
-- INNER JOIN customers c 
-- ON 
-- 	c.customerid = b.customerid
-- INNER JOIN menus m 
-- ON 
-- 	m.menuid = o.menuid
-- INNER JOIN menuitem t
-- ON 
-- 	t.itemid = m.itemid
-- ORDER BY
-- 	o.totalCost;

--------------------------------------------------------------------------------

-- Task 3
-- For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.

-- Here’s some guidance around completing this task: 

-- Use the ANY operator in a subquery

-- The outer query should be used to select the menu name from the menus table.

-- The inner query should check if any item quantity in the order table is more than 2. 

-- SELECT 
-- 	distinct name 
-- FROM 
-- 	menus m INNER JOIN menuitem t 
-- ON 
-- 	m.itemid = t.itemid
-- WHERE 
-- 	menuid = ANY (
-- 		SELECT
-- 			menuid 
-- 		FROM 
-- 			orders
-- 		WHERE 
-- 			quantity > 2
--     );

--------------------------------------------------------------------------------