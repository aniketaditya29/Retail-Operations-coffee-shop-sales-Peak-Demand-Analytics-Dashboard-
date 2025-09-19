--sales analysis by days and hours--
select 
date_part('dow',transaction_date) as days ,
date_trunc('hour', transaction_time) as hours ,
date_part('month', transaction_date) as months,
sum(unit_price * transaction_qty) as total_sales,
sum(transaction_qty) as total_quantities_sold,
count(*) as total_orders
from coffee_shop_sales
group by days,hours,months
order by months asc, days asc,hours asc;

--sales analysis for month in each hours--
select 
date_trunc('hour', transaction_time) as hours ,
date_part('month', transaction_date) as months,
round(sum(unit_price * transaction_qty)) as total_sales,
sum(transaction_qty) as total_quantities_sold,
count(*) as total_orders
from coffee_shop_sales
group by hours,months
order by months asc,hours asc;

--sales analysis for months on each days--
select 
date_part('dow',transaction_date) as days,
date_part('month', transaction_date) as months,
round(sum(unit_price * transaction_qty)) as total_sales,
sum(transaction_qty) as total_quantities_sold,
count(*) as total_orders
from coffee_shop_sales
group by days,months
order by months asc, days asc;


--view table--
select * from coffee_shop_sales;