select * from managers;
select * from products;

select sales_manager_id, first_name, last_name from managers
UNION
select product_id, product_name, product_category from products;

select * from products where unit_list_price = 
(select max(unit_list_price) from products); -- to show the max value not as a value but the whole table

use hr;

select * from employees;

select count(*), sum(salary), avg(salary), max(salary), min(salary) from employees;

select employee_id, first_name, last_name, upper(first_name), concat(first_name,' ' , last_name) from employees; -- joins the first and last name together

select first_name, left(first_name,3) from employees; -- takes the first 3 letters from the left

select round(5.67); -- round up numbers

use hr;

select * from employees;

select first_name, hire_date, datediff("yy", hire_date, now())
	from employees;
    
select now();

select first_name, ifnull(manager_id, 'No Manager')
	from employees; -- there are null(blank) values in one of the fields, then replace it with the value in orange
    

select * from managers;
select * from sales order by sales_manager_id; 

use Lesson1;

select * from managers;

select m.sales_manager_id, m.first_name, m.last_name
from managers m
where m.sales_manager_id =
ANY (select s.sales_manager_id from sales s);

SELECT M.first_name, M.last_name
FROM managers M
WHERE EXISTS(SELECT sales_manager_id 
FROM sales S WHERE S.sales_manager_id = M.sales_manager_id);

SELECT M.first_name, M.last_name
FROM managers M
WHERE M.sales_manager_id > ALL(SELECT S.sales_manager_id FROM sales S);

SELECT sales_manager_id, date_joined, 
IF(date_joined < '2020-01-01', 'EXPERIENCED', 'NEW HIRE') 
AS manager_experience
FROM managers;

SELECT product_name, unit_list_price,
	CASE
		WHEN unit_list_price > 1.5 THEN"Expensive"    
		WHEN unit_list_price >= 1.0 THEN"Moderate"    
		ELSE"Cheap"
        END
	AS price_category
FROM products;


-- Find the total quantity sold (of all products) for each sales manager (get the first name and last name).

select * from managers;
select * from sales;
select * from products;

select m.first_name, m.last_name, sum(s.quantity_sold) from managers m
	left join sales s on m.sales_manager_id = s.sales_manager_id
    group by s.sales_manager_id;
	