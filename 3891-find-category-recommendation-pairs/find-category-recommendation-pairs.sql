# Write your MySQL query statement below
with x as (
    select distinct p.user_id , p1.category
    from ProductPurchases p
    join ProductInfo p1
    on p.product_id = p1.product_id
)

select x1.category as category1 , x2.category as category2 , count(distinct x1.user_id) as customer_count
from x as x1
join x as x2
on x1.user_id = x2.user_id and x1.category < x2.category
group by x1.category , x2.category
having count(distinct x1.user_id) >= 3
order by customer_count desc , category1 asc , category2 asc