# Write your MySQL query statement below
with top as (select d.name as Department  , e.name as employee,salary,
dense_rank() over(partition by d.id order by salary desc) as rnk
from employee e
left join department d
on e.departmentId  = d.id)

select Department,employee,salary
from top 
where rnk <=3
order by salary desc