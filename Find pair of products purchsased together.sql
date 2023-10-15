
###################################  Problem  Statement ################################################
# Find if pair of products purchased together.
# if more than 2 products purchased, then find the all combination of products
########################################################################################################

Input :
create table orders
(
order_id int,
customer_id int,
product_id int
);

insert into orders VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);

create table products (
id int,
name varchar(10)
);
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');


solution :

select concat(p1.name , p2.name ) as produc_comb, count(1) as total
from orders o1 inner join orders o2 on o1.order_id = o2.order_id
inner join products p1 on o1.product_id = p1.id
inner join products p2 on o2.product_id = p2.id
where o1.product_id > o2.product_id
group by p1.name,p2.name
order by total desc