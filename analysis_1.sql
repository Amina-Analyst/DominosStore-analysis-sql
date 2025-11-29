-- Analysis & Reports

-- 1. Orders volume analysis queries
      -- Stake holder (operations manager)

/* 
we are trying to understand order volume in detail 
so we can measure store performance and benchmark growth.
instead of just knowing the total number of unique order.
*/

use dominos_analysis;
select * from orders;
select count(*) from orders;

-- 1.1--tot number of unique orders placed so far
select count(distinct order_id ) from orders;
-- ------------------------------------------------------------------------------
-- 1.2--order vol change month-over-month and year-over-year
-- breakdown orders by month and year

-- month over month 
with monthly_orders as (
	select month (order_date) as ord_month,
    count(order_id) as monthly_count
    from orders
    group by month(order_date)
    )
        
select ord_month,monthly_count,
    lag(monthly_count) over(order by ord_month) as prev_count,
    ((monthly_count - lag(monthly_count) over(order by ord_month))/lag(monthly_count) over(order by ord_month)) * 100 as  monthly_growth
	from monthly_orders
    order by ord_month;
    
    
-- year-over_year growth
    
with yearly_orders as(
    select year(order_date) as ord_year,
    count(order_id) as yearly_count
    from orders
    group by year(order_date)
    )
select ord_year,yearly_count,
lag(yearly_count) over(order by ord_year) as prev_year,
100 * ((yearly_count-lag(yearly_count) over(order by ord_year))/lag(yearly_count) over(order by ord_year)) as yearly_growth
from yearly_orders
order by ord_year;
-- ------------------------------------------------------------------------------
-- 1.3 -- identify peak and off-peak ordering days

select dayname(order_date) as weekday,
count(distinct order_id) as tot_orders
from orders
group by  dayname(order_date)
order by tot_orders desc;
 -- ------------------------------------------------------------------------------
 -- 1.4-- order vol variation over the week and weekends
 
 -- ---------------------------------------------------------------------------
 -- 1.5-- avg number of orders per customer
 select count(*)/count(distinct custid) as avg_order
 from orders;
 
 -- -----------------------------------------------------------------------
 -- 1.6 -- top repeat customers driving the order vol
 select c.custid,c.first_name,c.email,count(o.order_id) as tot_ord
 from customers as c
 left join orders as o
 on c.custid=o.custid
 group by c.custid
 order by tot_ord desc;
 -- -----------------------------------------------------
-- 1.7--project the expected order growth trend based on historical data 
-- part 1 -- month over month 
with monthly_orders as (
	select month (order_date) as ord_month,
    count(order_id) as monthly_count
    from orders
    group by month(order_date)
    )
        
select ord_month,monthly_count,
    lag(monthly_count) over(order by ord_month) as prev_count,
    ((monthly_count - lag(monthly_count) over(order by ord_month))/lag(monthly_count) over(order by ord_month)) * 100 as  monthly_growth
	from monthly_orders
    order by ord_month;
    
-- part 2-- cumulative order (running total)
-- cumulative_order shows how many total orders have happened up to that date
-- You normally cannot directly combine an aggregate function (SUM) over another aggregate (COUNT) unless using a window function.
-- A window function allows this by treating the grouped result as rows.

select order_date,count(order_id) as daily_order,
sum(count(order_id)) over(order by order_date) as cumulative_order
from orders
group by order_date
order by order_date;

    

    
    
    
    
    
    
    
    
    