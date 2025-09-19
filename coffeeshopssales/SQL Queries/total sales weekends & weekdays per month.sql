--sales by weekends(0->sunday,6->saturday)/weekdays(1-5 -> monday-friday)--
select distinct date_part('month', transaction_date) as months,
(case when date_part('dow', transaction_date) in (0,6) then 'weekends'
else 'weekdays'
end ) as day_type,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales 		
group by months,day_type;

--view table--
select * from coffee_shop_sales;