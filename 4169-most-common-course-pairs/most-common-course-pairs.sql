with x as (select user_id ,avg(course_rating) as avg_rat,count(course_id) as no_of_courses
from course_completions 
group by user_id 
having count(course_id)>=5 and avg(course_rating) >=4),

y as (select c.*, lead(course_name) over (partition by user_id order by completion_date ) as second_course
from course_completions c
inner join x
on c.user_id = x.user_id
order by user_id asc ,completion_date asc)

select course_name as first_course, second_course , count(*) as transition_count 
from y 
where second_course is not null
group by course_name,second_course
order by transition_count desc , first_course ,second_course
