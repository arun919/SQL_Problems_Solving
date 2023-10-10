Analytics Function

###################### write query to understand about analytical function ###########################


Input:

create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int
);


insert into employee values(1,'Ankit',100,10000);
insert into employee values(2,'Mohit',100,15000);
insert into employee values(3,'Vikas',100,10000);
insert into employee values(4,'Rohit',100,5000);
insert into employee values(5,'Mudit',200,12000);
insert into employee values(6,'Agam',200,12000);
insert into employee values(7,'Sanjay',200,9000);
insert into employee values(8,'Ashish',200,5000);

# find the salary rank accros department

# please note that rank function and row number will not provide appropriate result
# row_number will provide running number irrespective of both employee has same salary
# ran function will provide same rank if both employee has same rank but it will skip next number

select emp_name
      ,dept_id
      ,salary
      ,rank() over( order by salary desc) as sal_rank
      ,dense_rank() over( order by salary desc) as dense_sal_rank
      ,row_number() over( order by salary desc) as row_sal_rank
from employee;

# find the salary rank within department

select emp_name
      ,dept_id
      ,salary
      ,rank() over (partition by dept_id order by salary desc) as sal_rank
      ,dense_rank() over(partition by dept_id  order by salary desc) as dense_sal_rank
      ,row_number() over(partition by dept_id  order by salary desc) as row_sal_rank
from employee;


# find the nth higheest salary within the department

select * from 
(
select emp_name
      ,dept_id
      ,salary
      ,dense_rank() over(partition by dept_id  order by salary desc) as dense_sal_rank
from employee
) rnk 
where dense_sal_rank = 2

