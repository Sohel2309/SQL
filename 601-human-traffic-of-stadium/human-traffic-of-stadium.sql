# Write your MySQL query statement below
with cte as (select id , lag(id) over (order by id) as pre_id , visit_date ,people
from stadium
where people>=100),

cte2 as(
    select id,pre_id ,sum( case when id-1=pre_id then 0 else 1 end ) over (order by id)as grp,visit_date ,people
    from cte
),
cte3 as(
    select id,grp,count(*) over(partition by grp) as grp_size,visit_date ,people
    from cte2
)
select id,visit_date ,people  
from cte3
where grp_size>=3
order by id
