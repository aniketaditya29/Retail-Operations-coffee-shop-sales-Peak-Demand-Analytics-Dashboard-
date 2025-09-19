--sales analysis by product category--
select date_part('months', transaction_date) as months,
product_category,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
group by months,product_category
order by months asc,total_sales desc;




--view table--
select * from coffee_shop_sales;