# Write your MySQL query statement below
with first_login as (select player_id , min(event_date) as min_date
from activity 
group by player_id ) ,

cons_login as (
    select distinct a.player_id
    from activity a
    left join first_login
    on a.player_id = first_login.player_id
    where datediff(a.event_date,first_login.min_date) = 1
)
SELECT round(count(distinct cons_login.player_id)/count(distinct first_login.player_id),2) as fraction
FROM first_login
LEFT JOIN cons_login
on first_login.player_id = cons_login.player_id

