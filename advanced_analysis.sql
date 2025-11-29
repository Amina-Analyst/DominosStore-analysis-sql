--  -------------ADVANCED ANALYSIS-------------------------

-- 11.REVENUE CONTRIBUTION PER PIZZA
/*
Stakeholder:(CFO)
For our revenue mix analysis ,i need to know what percentage of total revenue each pizza contributes.
This will show which items carry the business

Analyst task: divide revenue of each pizza by total revenue,express in %
*/

select pt.name, sum(p.price*od.quantity) as revenue,
round(100 * sum(p.price*od.quantity)/sum(sum(p.price*od.quantity))
over(),2) as pctg_contribution
from pizzas as p 
	 join order_details as od on p.pizza_id=od.pizza_id
	 join pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
	 group by pt.name
     order by pctg_contribution desc;
     
/*
 This is the total revenue of all pizza types combined.
SUM(...) OVER () is a window function
	It calculates the grand total revenue without grouping
	The query still groups by pt.name, but the window function sees all results

Example:
If total revenue = $50,000 → this part returns 50000 for every row.
*/

-- 12 CUMULATIVE REVENUE OVER TIME
/*
Stakeholder:(board of directors)

we want to see how our cumulative revenue  has grown by month since launch.can you prepare a cumulative revenue trend line

Analyst task:Aggregate revenue by date/month and calculate running total.
*/
select order_date,
daily_revenue,
sum(daily_revenue) over(order by order_date ) as cumulative_revenue
from(
select o.order_date,sum(od.quantity*p.price) as daily_revenue
from 
orders as o
join order_details as od on od.order_id=o.order_id
join pizzas as p on p.pizza_id=od.pizza_id
group by o.order_date
) as t;

-- PLEASE NOTE
/*
It takes the current row’s value
Adds it to all previous rows’ values
Based on the order given (ORDER BY order_date)
	Row1: value1
	Row2: value1 + value2
    ...
*/

-- 13 --TOP 3 PIZZAS BY CATEGORY (REVENUE_BASED)
/*
within each piozza category,which 3 pizzas bring the most reveue?
this will help us decide which pizzas to promote or expand

Analyst task:partition by category, calculate revenue per pizaa,rank top3
*/

with cat_rank as(
select 
pt.category,pt.name,sum(od.quantity*p.price) as revenue ,
rank() over(partition by pt.category 
	order by sum(od.quantity*p.price) desc) as catg_rank
from order_details as od 
join pizzas as p on od.pizza_id=p.pizza_id
join pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
group by pt.category,pt.name
)
select category,name,revenue,catg_rank
from cat_rank
where catg_rank<=3;

-- EXTENDED BUSINESS CASE STUDIES

-- 14 TOP 10 CUSTOMERS BY SPENDING
/*
Stakeholder(customer retention manager)

who are our top 10 customers based on total spend.
we want to reward them with loyalty offers
*/
select c.custid,c.first_name ||' '|| c.last_name as name,
sum(od.quantity*p.price) as tot_spent
from customers as c
join orders as o on c.custid=o.cust_id
join order_details on o.order_id=od.order_id
join pizzas as p on od.pizza_id=p.pizza_id
group by c.custid,name
order by tot_spent desc
limit 10; 

-- 14. ORDERS BY WEEKDAY
/*
SATKEHOLDER (marketing team,)
 which days of the week are busiest for orders?
 do customers order more on weekends
 */
 select dayname(order_date) as weekday,
count(distinct order_id) as tot_orders
from orders
group by  dayname(order_date)
order by tot_orders desc;
use dominos_analysis;

-- 16--AVERAGE ORDER SIZE
/*
STAKEHOLDDER(supplychain manager)
whtas the avg number of pizzas per order?
this helps in planning inventory and staffing
*/
select round(sum(quantity)/count(distinct order_id),0) as avg
from 
order_details;
-- OR --
select round(avg(order_size),0) as avg_order
from (
select order_id,sum(quantity) as order_size
from order_details
group by order_id
)as t;

-- 17-- SEASONAL TRENDS
/*
STAKEHOLDER(operations manager)

do we see peak sales in certain month/holidays?
this will help us manage seasonal demand
*/
select month(order_date) as month,count(*) as ord_count
from orders
group by month(order_date)
order by month;

-- 18 REVENUE BY PIZZA SIZE
/*
STAKEHOLDER( finance heaD )
whta is the revenue contribution of each pizza size (s,m,l,xl,xxl)
*/
select p.size,sum(od.quantity*p.price) as size_rev
from pizzas as p 
join order_details as od 
on p.pizza_id = od.pizza_id
group by p.size;

-- 19 CUSTOMER SEGMENTATION
/*
STAKEHOLDER(Customer insights team)
do our high_value customers prefer premium pizzas or regular pizzas?
we want to personalize marketing
*/


with cust_spend as (
select c.custid,sum(od.quantity*p.price) as tot_spend
from customers as c
join orders as o on c.custid=o.custid
join order_details as od on od.order_id=o.order_id
join pizzas as p on od.pizza_id=p.pizza_id
 group by c.custid
)
select 
     case
     when tot_spend>105500 then 'High value'
     else 'Regular'
     end as Segment,
     count(*) as customer_count
     from cust_spend
     group by segment;

-- 20-- REPEAT CUSTOMER RATE
/*
STAKEHOLDER(CRM head-customer relations manager)
we want to measure customer loyalty.can you calculate the percentage of repear customers (customers who placed more than one order)
v/s one time buyers.
this will help us design retention campaigns

Analyst task: fro the orders table ,count distinct customers.
county how many customers have more than one order.
calculate repeat rate=(repeat customers +tot_customers)=100
*/
with cust_order as (
select custid,count(distinct order_id) as ord_count
from orders group by custid
)
select (100* sum(case when ord_count>1 then 1 else 0 end)/count(*))
									as repeat_rate
from cust_order;



















