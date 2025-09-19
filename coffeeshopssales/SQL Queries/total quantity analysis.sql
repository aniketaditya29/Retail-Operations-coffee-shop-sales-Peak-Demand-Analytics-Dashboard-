--total quantity for each respective month--
select date_part('month', transaction_date) as months,
sum(transaction_qty) as total_quantity,

-- month-on-month increase and decrease in quantities--
round(sum(transaction_qty)-lag(sum(transaction_qty),1)
over (order by date_part('month', transaction_date)))*100
/(lag(sum(transaction_qty),1) over (order by date_part('month', transaction_date))) as MOM_percentage_change,

--difference in total_quantity--
round(sum(transaction_qty)-lag(sum(transaction_qty),1)
over (order by date_part('month', transaction_date))) as diff_in_total_quantities
from coffee_shop_sales
group by months;


--view complete table--
select * from coffee_shop_sales;