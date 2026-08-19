# Write your MySQL query statement below

with cte as (select a.*, b.banned, b.role from Trips a
inner join Users b
on a.client_id = b.users_id
where a.request_at between "2013-10-01" and "2013-10-03")

, cte1 as (select a.*, b.banned as ban, b.role as ro from cte a
inner join Users b
on a.driver_id = b.users_id
where a.banned = 'No' and b.banned='No')

select request_at as Day , round(sum(case when status='cancelled_by_driver' then 1 when status = 'cancelled_by_client' then 1 else 0 end) / count(request_at),2) as 'Cancellation Rate'
from cte1
group by request_at
order by day asc