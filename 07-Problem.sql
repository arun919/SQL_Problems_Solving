######################################################################################
# Write an sql query to find students who has same mark in both subject
###################################################################################


#Input:
create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);

Solution1:

with cte1  as (
select *,dense_rank() over (partition by student_id order by marks desc) as mark_rank
from exams
)

select student_id
from cte1
group by student_id
having sum(mark_rank) = 2

Solution2:
select student_id
from exams  where subject in ('physics','chemistry')
group by student_id
having count(disticnt subject) =2  and count(distinct marks) = 1