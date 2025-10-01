# Retail Sales SQL Project  

## 📊 Data Exploration  

```sql
**FINDING ALL NULL VALUES
...sql
SELECT *
FROM retails_sales
WHERE cogs IS NULL
   OR age IS NULL
   OR gender IS NULL
   OR quantity IS NULL
   OR quantiy_price_per_unit IS NULL
   OR total_sale IS NULL
   OR customer_id IS NULL
   OR transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL...

** HOW MANY TRANSACTIONS WE HAVE:
...sql
SELECT COUNT(total_sale) AS num_transactions
FROM retails_sales
...

** SELECT TOTAL NUMBER OF UNIQUE CUSTOMERS WE HAVE
...sql
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retails_sales...

** SELECT DISTINCT CATEGORIES WE HAVE
...sql
SELECT DISTINCT category
FROM retails_sales...

-- DATA ANALYSIS & BUSSINESS KEY PROBLEMS & ANSWERS

**Q1 RETRIEVE ALL COLUMNS FOE SALES MADE ON '2022-11-05':
...sql
select * from retails_sales where sale_date = '2022-11-05'...

**Q2 RETRIEVE ALL TRANSACTIONS WHERE THE CATEGORY IS 'CLOTHING' AND THE QUANTITY SOLD IS MORE THAN 10 IN THE MONTH OF NOV_2022:
...sql
select * from retails_sales where category = 'clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01'
  and quantity >=4...
  
  **Q3 CALCULATE TOTAL SALES FOR EACH CATEGORY:
...sql
  select category, sum(total_sale)as total_sales ,
  count(*)as total_orders
  from retails_sales
  group by category
  order by total_sales desc...
  
  **Q4 FIND THE AVERAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE 'BEAUTY' CATEGORY
...sql
select round(avg(age),1)as avg_age from retails_sales where category = 'beauty'...

** Q5 FIND ALL TRANSACTIONS WHERE TOTAL_SALE IS GREATER THAN 1000
...sql
select * from retails_sales where total_sale >1000...

**Q6 FIND THE TOTAL NUMBER OF TRANSACTIONS MADE BY EACH GENDER IN EACH CATEGORY
...sql
select category, gender ,count(*)as orders from retails_sales
group by category , gender 
order by gender desc...

**Q7 CALCULATE THE AVERAGE SALE FOR EACH MONTH. FIND OUT THE BEST SELLING MONTH IN EACH YEAR
...sql
select year,month,round(avg_sal,2)as avg_sal from(
select year(sale_date)as year,
month(sale_date)as month,
avg(total_sale)as avg_sal,
rank() over(partition by year(sale_date) order by avg(total_sale) desc) as rnk
from retails_sales
group by year(sale_date),month(sale_date)
)as t
where rnk = 1...

** Q8 FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES
...sql
select customer_id,sum(total_sale)as sales
from retails_sales 
group by customer_id order by sales desc
limit 5'''

** Q9 NO OF PURCHASES BY EACH CUSTOMER FROM EACH CATEGORY
...sql
select customer_id ,category,count(*)as no_of_purchases
from retails_sales
group by customer_id ,category order by customer_id...

**Q10 FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY:
...sql
select category, count(distinct customer_id)as total_customers from retails_sales
group by category...

**Q11 CREATE EACH SHIFT AND NUMBER OF ORDERS:
...sql
with hourly_sale as(
select *, case
when hour(sale_time) <12 then 'morning'
when hour (sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retails_sales)
select shift, count(*)as toal_orders from hourly_sale 
group by shift...




