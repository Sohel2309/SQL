# Write your MySQL query statement below
with x as (select session_id ,user_id , 
TIMESTAMPDIFF(MINUTE, min(event_timestamp), max(event_timestamp)) as session_duration_minutes ,
sum(case when event_type='scroll' then 1 else 0 end) 
 as scroll_count ,
sum(case when event_type='click' then 1 else 0 end) 
 as click_count ,
sum(case when event_type='purchase' then 1 else 0 end) 
 as purchase_count
from app_events
group by  session_id ,user_id )

select session_id ,user_id ,session_duration_minutes , scroll_count
from x
where purchase_count = 0 and scroll_count >= 5 and click_count/scroll_count < 0.2 and session_duration_minutes  >= 30
order by scroll_count desc, session_id asc
