Find Rolling aggregates


######################## Problem statement #####################################################
## Find the rolling sum and average of sales. for instance find running 3 month sales
################################################################################################

Input:

create table order_details (
year int,
month int,
sales int
);

insert into order_details(year,month,sales) values (2022,1,1000);