--sales analysis by product type--
select date_part('months', transaction_date) as months,
product_type,product_category,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
group by months,product_type,product_category
order by months asc,product_category asc,total_sales desc;



--view table--
select * from coffee_shop_sales;