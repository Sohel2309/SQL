# Write your MySQL query statement below
with x as (select user_id , action_date , action , lag(action) over ( partition by user_id order by action_date) as pre_action
from activity ),

y as (select user_id , action_date , action , pre_action , sum(case when action!=pre_action then 1 else 0 end) over (partition by user_id order by action_date) as gap
from x)

select user_id ,action ,count(gap) as streak_length,min(action_date) as start_date , max(action_date) as end_date
from y
group by user_id,action,gap
having count(gap) >= 5
order by streak_length desc , user_id asc
