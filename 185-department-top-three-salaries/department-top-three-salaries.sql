# Write your MySQL query statement below
with x as (
    select d.name as Department ,e.name as Employee ,e.salary as salary,
dense_rank() over(partition by e.departmentid order by e.salary desc) as rnk
from employee e
left join department d
on e.departmentid=d.id
)

select Department,Employee,salary
from x
where rnk <=3