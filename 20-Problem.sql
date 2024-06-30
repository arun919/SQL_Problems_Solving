######################################################################################
# Write an sql query to pivot the players based on their location
#########################################################################################


/* input */

create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

/* solution */

select t.rnk,
max(case when t.city = 'Bangalore' then t.name end) as Bangalore,
max(case when t.city = 'Delhi' then t.name end) as Delhi,
max(case when t.city = 'Mumbai' then t.name end) as Mumbai
from 
(select *, rank() over (partition by city order by name asc) as rnk
from players_location) t
group by rnk
order by rnk