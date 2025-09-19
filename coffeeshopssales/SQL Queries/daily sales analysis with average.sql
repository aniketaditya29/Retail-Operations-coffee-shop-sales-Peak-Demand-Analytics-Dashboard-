--total sales per day--
select date_part('month', transaction_date) as months,
transaction_date,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
group by months,transaction_date;

--average sales per month--
select months,avg(total_sales) as avg_sales
from (select date_part('month', transaction_date) as months,
		sum(unit_price * transaction_qty) as total_Sales
		from coffee_shop_sales
		group by transaction_date)
group by months;

--average line--
select transaction_date,
(case when total_sales > avg_sales then 'above_average'
		when total_sales < avg_sales then 'below_average'
		else 'point_average'
		end) as sales_type,
total_sales
from (select transaction_date,
			date_part('month', transaction_date) as months,
			sum(unit_price * transaction_qty) as total_Sales,
			 (avg(sum(unit_price * transaction_qty)) over()) as avg_sales
				from coffee_shop_sales
				group by transaction_date
				)
group by transaction_date,total_sales,avg_sales;


--view table--
select * from coffee_shop_sales;