-- FINDING ALL NULL VALUES 

select * from retails_sales where  cogs is null or age is null or gender is null or quantity is null or 
quantiy_price_per_unit is null or total_sale is null or customer_id is null or transactions_id is null
or sale_date is null or sale_time is null;

select * from retails_sales;