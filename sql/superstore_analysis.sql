

create database SuperstoreDB

select top 5 * from [Superstore_Cleaned];

select count(*) from Superstore_Cleaned

--Total Sales, profit, orders & average order value
select
round(sum(Sales), 2) as Total_Sales,
round(sum(Profit), 2) as Total_Profit,
count(distinct Order_ID) as Total_Orders,
round(sum(Sales)/ count(distinct Order_ID), 2) as Avg_Order_Value
from Superstore_Cleaned  

--Sales, profit, Margine by category
select
category,
round(sum(Sales), 2) as Total_Sales,
round(sum(Profit), 2) as Total_Profit,
round(sum(Profit) * 100.0/sum(Sales), 2) as Profit_Margin_Pct
from Superstore_Cleaned
group by Category
order by Total_Profit DESC;

--Sale,Profit,Margin by Region

select region,
round(sum(sales),2) as Total_Sales,
round(sum(profit),2) as Total_Profit,
round(sum(profit) * 100.0 / sum(sales),2) as profit_Margin_pct
from Superstore_Cleaned
group by Region
order by Total_Profit Desc;


--Monthly Sales Trend

select order_year,order_month,
round(sum(sales), 2) as Total_Sales
from Superstore_Cleaned
group by Order_Year, Order_Month
order by Order_Year,
  case Order_Month 
       when 'january' then 1
       when 'february' then 2
       when 'march' then 3
       when 'april' then 4
       when 'may' then 5 
       when 'june' then 6
       when 'july' then 7
       when 'august' then 8
       when 'september' then 9
       when 'october' then 10
       when 'november' then 11
       when 'december' then 12
 end;


 --Customer performence (Top customers)
 select top 10 Customer_Name,
 count(distinct order_id) as Total_Orders,
 round(sum(sales), 2) as Total_Sales,
 round(sum(Profit), 2) as Total_Profit
 from Superstore_Cleaned
 group by Customer_Name
 order by Total_Sales desc;

--1 customer by sales (25,043.05), but his Total_Profit is -1,980.74 — he's actually losing you money
--"high sales ≠ high profit"

--Profit-sorted version
select Top 10 Customer_Name,
count(distinct Order_ID) as Total_Orders,
round(sum(sales), 2) as Total_Sales,
round(sum(profit), 2) as Total_Profit
from Superstore_Cleaned
group by Customer_Name
order by Total_Profit desc;