# Write your MySQL query statement below
with x as (select id , num , lag(num) over(order by id) as pre_num
from Logs)

,y as (select  id , num , pre_num ,
sum(case when not num <=> pre_num then 1 else 0 end) over(order by id) as grp
from x)

select distinct num as ConsecutiveNums
from y
group by grp ,num
having count(*) >=3
