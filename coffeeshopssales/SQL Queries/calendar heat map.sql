--calendar heat map--
select distinct transaction_date,
sum(unit_price * transaction_qty) as total_sales,
count(transaction_id) as total_orders,
sum(transaction_qty) as total_quantity
from coffee_shop_sales
group by transaction_date;




--view table--
select * from coffee_shop_sales;