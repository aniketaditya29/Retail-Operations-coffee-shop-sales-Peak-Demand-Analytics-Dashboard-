CREATE  TABLE coffee_shop_sales(
		transaction_id int,
		transaction_date date,	
		transaction_time time,	
		transaction_qty	int,
		store_id int,
		store_location varchar(100),
		product_id int,	
		unit_price numeric(10,2),
		product_category varchar(50),	
		product_type varchar(50),	
		product_detail varchar(50)
);

select * from coffee_shop_sales;

