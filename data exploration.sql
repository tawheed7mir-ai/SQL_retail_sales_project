-- DATA EXPLORATION


-- HOW MANY transactions WE HAVE
select count(total_sale)as num_transactions from retails_sales;

-- SELECT TOTAL NUMBER OF UNIQUE CUSTOMERS WE HAVE 
select count(distinct customer_id)as total_customers from retails_sales;

-- SELECT DISTINCT CATEGORIES WE HAVE 
SELECT DISTINCT CATEGORY FROM retails_sales