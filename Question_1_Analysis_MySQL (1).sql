-- Method 1: Manipulate data in excel
-- Method 2: Import data and perform analysis through SQL

CREATE TABLE sample (
  order_id int DEFAULT NULL,
  shop_id int DEFAULT NULL,
  user_i int DEFAULT NULL,
  order_amount int DEFAULT NULL,
  total_items int DEFAULT NULL,
  payment_method text,
  created_at datetime DEFAULT NULL
);


-- Confirm total count of data set is 5000
select count(*) from world.sample;

-- Confirm the data set is for 30 days
select min(created_at) MinCreatedDate, max(created_at) MaxCreatedDate from world.sample;

-- Get top 100 row of data 
select * from world.sample limit 100;

-- Check the count for each shop
select shop_id ShopID, count(*) TotalCount from world.sample group by shop_id order by shop_id; 

-- Get top 100 rows of data sort be order amount with descending order to see the most expensive shoes
select * from world.sample order by order_amount desc limit 100;

-- Get top 100 rows of data sort be order amount with ascending order to see the cheapest shoes
select * from world.sample order by order_amount asc limit 100;

-- Get the most expensive and the cheapest sneaker with dollar amount for one item
select round(min(cast(order_amount as decimal(10,2)) / total_items), 2) MinOrderAmount, 
round(max(cast(order_amount as decimal(10,2)) / total_items), 2)  MaxOrderAmount
from world.sample;

-- The mistake is made by assuming all order_amount is for one item, hence summing up order_amount and divided by 5000 will result in the wrong AOV is 3145.13
select round(sum(cast(order_amount as decimal(10,2)))/5000, 2) AOV from world.sample;

-- The metric we should focus on is order amount for single item
select *, cast(order_amount as decimal(10,2)) / total_items order_amount_single_item from world.sample limit 100;

-- The way to get AOV is to calculate order_amount for single item, sum it up, then divided by 5000. The correct AOV is 387.74
select round(sum(cast(order_amount as decimal(10,2)) / total_items) / 5000, 2) AOV from world.sample;










