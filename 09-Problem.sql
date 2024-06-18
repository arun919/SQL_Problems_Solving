######################################################################################
# Write an sql query to find 3rd highest salary in the department. If department has
# less than 3 employee then return employee details with lowest salary
######################################################################################

CREATE TABLE emp(
 emp_id int NULL,
 emp_name varchar(50) NULL,
 salary int NULL,
 manager_id int NULL,
 emp_age int NULL,
 dep_id int NULL,
 dep_name varchar(20) NULL,
 gender varchar(10) NULL
) ;

insert into emp values(1,'Ankit',14300,4,39,100,'Analytics','Female');
insert into emp values(2,'Mohit',14000,5,48,200,'IT','Male');
insert into emp values(3,'Vikas',12100,4,37,100,'Analytics','Female');
insert into emp values(4,'Rohit',7260,2,16,100,'Analytics','Female');
insert into emp values(5,'Mudit',15000,6,55,200,'IT','Male');
insert into emp values(6,'Agam',15600,2,14,200,'IT','Male');
insert into emp values(7,'Sanjay',12000,2,13,200,'IT','Male');
insert into emp values(8,'Ashish',7200,2,12,200,'IT','Male');
insert into emp values(9,'Mukesh',7000,6,51,300,'HR','Male');
insert into emp values(10,'Rakesh',8000,6,50,300,'HR','Male');
insert into emp values(11,'Akhil',4000,1,31,500,'Ops','Male');

#solution1:

with cte as(
select *, dense_rank() over (partition by dep_name order by salary desc) as emp_rnk
from emp
)

select dep_name,emp_id,salary from cte
where emp_rnk =3
union all
select e.dep_name,e.emp_id,e.salary from emp e
inner join (
select dep_name, min(emp_id) as emp_id, min(salary) as salary from emp
group by dep_name
having count(dep_name) < 3 
) m on e.emp_id = m.emp_id

solution2:
with cte as(
select *, dense_rank() over (partition by dep_name order by salary desc) as emp_rnk,
          count(dep_name) over (partiton by dep_name order by salary desc) as emp_cnt
from emp
)
select * from cte
where emp_rnk = 3 or (emp_cnt < 3 and emp_rnk = emp_cnt)
