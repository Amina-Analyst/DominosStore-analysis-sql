-- 2 :-Total Revenue from pizza sales
	-- stakeholder(finanace team)
/* we need to report monthly revenue to management.
can you calculate the total revenue generaTEWD FROM ALL PIZZA SALES,
considering price * qty from each order

Analyst taask: join order_details  with pizzas and sum (price * qty)
*/

use dominos_analysis;
select sum(p.price*od.quantity) as tot_revenue
from order_details as od
join pizzas as p
on od.pizza_id=p.pizza_id;

-- 3 :-Highest priced pizza
/* stake holder(menu manager)
our premium pizzas must be correctly priced .
can you find out which pizza has the highest price on our menu and 
confirm its category & size

Analys task : Query the pizzas table for the max price 
joining with pizza_types for details
*/
select 
pt.name,p.size,concat('$',p.price) as price
from pizzas as p
join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
order by p.price desc;

-- 4 Most common pizza size ordered. 
/*
to optimize packaging and raw material supply,
i need TO KNOW WHICH PIZZA SIZE(S,M,L,XL,XXL) is ordered the most.

Analyst task: count and group order by pizza size from pizzas &order_details
*/
use dominos_analysis;
select p.size,count(*) as tot_ord
from order_details as od
join pizzas as p on od.pizza_id=p.pizza_id
join pizza_types as pt on p.pizza_type_id=pt.pizza_type_id
group by p.size
order by tot_ord desc;

-- 5-- top5 most ordered pizza types
/* we want to promote our top selling pizzas.can you provide the top 5 pizza types ordered by qty,along with the exact number of units sold

Analyst task:join ordr details with pizza types,group by pizzaname and rank top 5

*/
use dominos_analysis;
select p.pizza_id,sum(od.quantity) as tot_qty
from order_details as od
join pizzas as p on od.pizza_id=p.pizza_id
join pizza_types as pt on p.pizza_type_id=pt.pizza_type_id
group by p.pizza_id
order by tot_qty desc limit 5;

-- 6--Total qty by pizza category

/* stakeholder(marketing manager)
we run promotions based on categories(classic,veggie,supreme,chicken etc)
can you calculate the total number of pizza sold in each category.
so we can plan targeted campaigns

Analyst task:join pizzas with pizza_types and sum quantities by category

*/
select pt.category,sum(od.quantity) as tot_qty
from order_details as od
join pizzas as p on od.pizza_id=p.pizza_id
join pizza_types as pt on p.pizza_type_id=pt.pizza_type_id
group by pt.category;

-- 7-- Orders by hour of the day
-- stakeholder(operations head)
/* 
when are customers ordering the most?do they prefer lunch(12-2pm),
evenings(6-9pm) or late night?
please give a distribution of orders by hour of the day so we can adjust staffing

Analyst_task:nextract the hour from the order time in orders table and count frequency
*/

-- --------------------------------------------------------------------
#PLEASE NOTE
-- order_time contains only time (HH:MM:SS)
SELECT HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) AS hour_extracted
FROM orders;
-- order_time contains a full datetime (YYYY-MM-DD HH:MM:SS)
SELECT HOUR(STR_TO_DATE(order_time, '%Y-%m-%d %H:%i:%s')) AS hour_extracted
FROM your_table;
-- If possible, convert the column to DATETIME or TIME type for better performance:
ALTER TABLE your_table 
MODIFY order_time DATETIME;
-- If the format is unknown
SELECT order_time FROM orders LIMIT 10;
-- IF column is already of TIME data type
SELECT HOUR(order_time) AS ORD_hour
FROM ORDERS;
-- --------------------------------------------------------------------
select hour(order_time) as ord_hour,count(*) as ord_count
from orders
group by ord_hour
order by ord_count;


-- 8--Category wise pizza disribution
/*
stakeholder(product strategy team)
which categories (like veggie,chicken,supreme)dominate our menu sales?
can you prepare a breakdown of orders per category with percentage share

*/
select pt.category,sum(od.quantity) as tot_order,
ROUND(sum(od.quantity) * 100 / (SELECT sum(quantity) FROM order_details),2
    ) AS percentage_share
from pizza_types as pt
join pizzas as p on pt.pizza_type_id=p.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.category
order by tot_order desc;

SELECT sum(quantity) FROM order_details;

-- 9-- average pizza ordered per day
/*
i want to see if our daily demand is consistent.
can you group orders by date and tell the average number of pizzas ordered per day

Analyst task: agg by order_date,calculate tot pizza per day then avg
*/

select avg(daily_tot) as daily_avg
from (
 select o.order_date,sum(od.quantity) as daily_tot
 from orders  as o
 join order_details as od
on od.order_id=o.order_id
group by o.order_date);

-- 10--Top 3 pizzas by revenue
/*
we need to know which pizzas are our biggest revenue drivers.
please provide the top 3 pizzas by revenue generated.

Analyst task: calculate revenue per pizza (price*qty) and rank top3
*/
use dominos_analysis;

 with pizza_revenue as (
	 select pt.name, sum(p.price*od.quantity) as revenue,
	 rank() over(order by sum(p.price*od.quantity) desc) as rev_rank
	 from pizzas as p 
	 join order_details as od on p.pizza_id=od.pizza_id
	 join pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
	 group by pt.name
 )
 select name,revenue,rev_rank
 from pizza_revenue
 where rev_rank<=3;









































