--sales analysis by store location--
select distinct store_location,
date_part('month', transaction_date) as months,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
group by store_location,months;

--view table--
select * from coffee_shop_sales;