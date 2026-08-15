# Write your MySQL query statement below
select query_name , round(sum(rating/position)/count(rating),2) as quality,
round(((sum(if (rating < 3 ,1,0))/count(position))*100),2) as poor_query_percentage 
from queries
group by query_name