-- Create an ER diagram for the given airlines database.
-- **passengers_on_flights has been renamed to passengers**

select * from customers;

select * from passengers;

select * from routes;

select * from ticket_details;

-- Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0      

CREATE TABLE route_details (
	route_id INT PRIMARY KEY,
    flight_num INT(4),
    origin_airport VARCHAR(64),
    destination_airport VARCHAR(6),
    aircraft_id VARCHAR(20),
    distance_miles INT,
    CHECK (distance_miles > 0),
	UNIQUE (route_id)
);

select * from route_details;

-- Write a query to display all the passengers (customers) who have traveled in routes 01 to 25. Take data  from the passengers_on_flights table.

select * from passengers; 

Select * from passengers 
	where route_id between 1 and 25;

-- Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

select * from ticket_details;

select count(*) customer_id from ticket_details
	where sum(price_per_ticket)
    having class_id = 'Bussiness';

-- Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

select * from customers;

select CONCAT(first_name, ' ', last_name) as full_name
	from customers;

-- Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.

select * from customers;
select * from ticket_details;

select t.customer_id as customer_booked_ticket
	FROM ticket_details t
	INNER JOIN customers c
    ON t.customer_id = c.customer_id;

-- Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.

select t.customer_id as customer_booked_ticket, c.first_name, c.last_name, t.brand
	FROM ticket_details t
	INNER JOIN customers c
    ON t.customer_id = c.customer_id;


-- Write a query to identify the customers who have traveled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.

select * from passengers;

select customer_id, class_id from passengers
group by customer_id, class_id
having class_id = 'Economy Plus';


-- Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.

select * from ticket_details;

SELECT IF(SUM(price_per_ticket)> 10000, 'Revenue Crossed 10000', 'Revenue Not Crossed 10000') from ticket_details;


-- let me check if this is true
select SUM(price_per_ticket) as Total_revenue from ticket_details;
-- ok all good!

-- Write a query to create a view with only business class customers along with the brand of airlines.

select * from ticket_details;

select customer_id, class_id, brand from ticket_details
where class_id = 'Bussiness';

-- Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.

CALL passengers_range_routes


-- personal notes

select * from passengers p JOIN Routes r on p.route_id = r.route_id where p.route_id = 34;


-- Write a query to create a stored procedure that extracts all the details from the routes table where the traveled distance is more than 2000 miles.

CALL distance_more_2000;

-- Write a query to create a stored procedure that groups the distance traveled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.

CALL distance_group_by_travel_time;


-- personal notes section


select * from routes;

SELECT flight_num,
	CASE
		WHEN distance_miles BETWEEN 0 and 2000 THEN 'short distance travel (SDT)'
        WHEN distance_miles BETWEEN 2001 and 6500 THEN 'intermediate distance travel (IDT)'
		WHEN distance_miles > 6500  THEN 'long-distance travel (LDT)'    
		ELSE "Not defined"
        END
	AS Type_of_travel
FROM routes
ORDER BY type_of_travel;


