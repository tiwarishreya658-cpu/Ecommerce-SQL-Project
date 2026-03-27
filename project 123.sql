create database Project;
use Project;

select * from global_superstore;

-- Find total sales

select sum(Sales) as Total_Sales
from global_superstore;

-- Top 5 product by sales
select Product_Name , sum(Sales) as total_sales
from global_superstore
group by product_Name
order by total_sales desc
limit 5;

-- Region wise sales
select Region ,
sum(sales) as total_sales
from global_superstore
group by Region
order by total_sales desc;

-- Monthly Sales trends
SELECT month(str_to_date(Order_Date , '%d-%m-%y')) as Month_No,
MONTHNAME(STR_TO_DATE(Order_Date,'%d-%m-%y')) AS Month_Name,
SUM(Sales) AS Monthly_Sales
FROM global_superstore
GROUP BY Month_Name , Month_No
order by Month_No asc;

-- Repeat Customer Query
select Customer_ID ,
count(Order_ID) as total_Order
from global_superstore
group by Customer_ID 
having total_Order > 1
order by total_Order desc;

-- Top Profit Making Category
select Category ,
sum(Profit) as total_profit 
from global_superstore
group by Category
order by total_profit desc;


