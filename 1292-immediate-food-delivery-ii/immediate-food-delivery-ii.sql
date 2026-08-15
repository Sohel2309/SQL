# Write your MySQL query statement below

select round((sum(if (o=c , 1,0))/count(*))*100,2) as immediate_percentage 
from (select delivery_id ,customer_id ,min(order_date) as o,
 min(customer_pref_delivery_date) as c
from delivery
group by customer_id) as n
