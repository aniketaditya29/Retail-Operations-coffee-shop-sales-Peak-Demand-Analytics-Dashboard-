--total orders for each respective month--
select date_part('month', transaction_date) as months,
count(*) as total_orders,

-- month-on-month increase and decrease in orders--
round((count(*))-lag(count(*),1)
over (order by date_part('month', transaction_date)))*100
/(lag(count(*),1) over (order by date_part('month', transaction_date))) as MOM_percentage_change,

--difference in total_orders--
round(count(*)-lag(count(*),1)
over (order by date_part('month', transaction_date))) as diff_in_total_orders
from coffee_shop_sales
group by months;


--view complete table--
select * from coffee_shop_sales;