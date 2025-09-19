--total sales for each respective month--
select date_part('month', transaction_date)as months,
round(sum(transaction_qty * unit_price)) as total_sales,

-- month-on-month increase and decrease in sales--
round(((sum(transaction_qty * unit_price))-(lag(sum(transaction_qty * unit_price),1)
over (order by date_part('month', transaction_date))))*100
/(lag(sum(transaction_qty * unit_price),1)over (order by date_part('month', transaction_date))),1) as MOM_percentage_change,

--difference in total_sales--
round((sum(transaction_qty * unit_price))-(lag(sum(transaction_qty * unit_price),1)
over (order by date_part('month', transaction_date)))) as diff_in_total_sales
from coffee_shop_sales
group by months;


--view complete table--
select * from coffee_shop_sales;