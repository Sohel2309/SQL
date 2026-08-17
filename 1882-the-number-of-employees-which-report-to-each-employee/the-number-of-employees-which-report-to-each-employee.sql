# Write your MySQL query statement below
SELECT m.employee_id , m.name , count(m.employee_id) as reports_count ,round(avg(e.age)) as average_age 
FROM employees e
JOIN employees m
    ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
order by m.employee_id asc
