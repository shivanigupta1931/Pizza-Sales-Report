select * from Pizza_detail;

SET datestyle = 'ISO, DMY';

copy Pizza_detail
from 'E:\Power BI\Pizza Sales\pizza_sales.csv'
DElimiter ','
CSV header

select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_detail WHERE EXTRACT(MONTH FROM order_date::DATE) = 1)
as PCT from pizza_detail 
WHERE EXTRACT(MONTH FROM order_date::DATE) = 1
group by pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_detail) as decimal(10,2))
as PCT from pizza_detail 
group by pizza_size

----  TOP 5 best seller by Revenue, total quantity and total order with Pizzaa anme 

select pizza_name, sum(total_price) as Total_Revenue from pizza_detail
group by pizza_name
order by Total_Revenue desc
limit 5;









