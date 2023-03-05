use Lesson1;

select * from products; -- to show the whole table

select product_name, product_category from products; -- only show the product_name and product_category from the products table list 

select product_name, product_category, unit_list_price as Price from products; -- AS function , to rename the table header

select product_name, product_category, unit_list_price, unit_production_cost,
unit_list_price - unit_production_cost as Profit from products; -- to find out the profit by subtracting and rename the table as profit 

select distinct product_category from products; -- show unique values

select * from products where unit_production_cost >= 1; -- WHERE function starts, WHERE is when you want to apply the conditions

select * from products where product_category = 'milk'; -- If you want to search for a string, make sure you always have the ' X ' inverted

select * FROM products where (unit_list_price - unit_production_cost) > 0.25; 

select * FROM products where product_name like 'M%';

select * from managers where first_name like '%a';

select * from products where unit_list_price between 1 and 1.5 and product_category = 'Milk';

select * from products where product_category in ('Milk' , 'yoghurt');

select * from products where unit_list_price > 1 and product_category = 'milk';

select * from products where unit_list_price > 1.5 or product_category = 'milk';

select * from managers where first_name is not null;

select sum(unit_list_price), avg(unit_list_price), max(unit_list_price), min(unit_list_price) from products;

select product_category, count(*) from products group by product_category;

select product_category, avg(unit_list_price) from products
group by product_cateogry having avg(unit_list_price) > 1.45;

select * from products order by unit_list_price;

select * from products order by unit_list_price desc;

select * from products order by unit_list_price desc limit 3;

select * from products;

select categoryID, count(*), sum(unitswhere) 
	from products
    where CategoryID is not null -- used to filter rows 
    group by CategoryID
    having sum()
    order by sum(Unitsinstock) desc;
    
    select product_id, unit_list_price, product_category from products where product_category = 'Yoghurt';
    
    select * from managers where first_name is null;
    
    select * from sales;
    
    select sales_id, sales_date, quantity_sold from sales 
    where quantity_sold >= 1200;
    
   select sales_manager_id, sum(quantity_sold) from sales
   where product_id <> 7001001
   group by sales_manager_id
   order by sales_manager_id desc;
   
   select * from products
   order by unit_production_cost;
   
   select product_id, product_name, max(unit_production_cost) from products 
	group by unit_production_cost
	having max(unit_production_cost) > 1.10 
	order by max(unit_production_cost); -- this was the answer but it doesn't work
    
    
	select product_id, product_name, max(unit_production_cost) from products
		group by product_id, product_name, unit_production_cost
		having max(unit_production_cost) < 1.10
		order by max(unit_production_cost); 
        
        -- this works added the group by 
        
	select * from sales
        
	select max(quantity_sold), product_id, sales_date from sales
		where sales_date > '2021-10-30' 
		and product_id not in (7001001, 7001002)
		group by product_id, sales_date
        order by max(quantity_sold) desc;
    
    
   
    select max(quantity_sold) from Sales 
    where sales_date > '2021-10-30' and product_id not in (7001001, 7001002);
    


