
####################################### problem statement ################################################
# find sellers who's second sold item wheather favorite or not
# if the seller sold less than two item, then consider as no
###########################################################################################################

-- input:

create table users (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );

 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );
 
 insert into users values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');
 
 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);


 select * from users

 select * from items

 select * from orders


 Solution:

 with item_list as (
select o.*, u.favorite_brand,i.item_brand
from
(
(select *, dense_rank() over (partition  by seller_id order by order_date asc) as ord_rank
from orders ) o inner join users u on o.seller_id = u.user_id
 inner join items i on o.item_id = i.item_id)
),
second_list as (
select order_date,seller_id,ord_rank,favorite_brand,item_brand,
 case when ord_rank = 2 and favorite_brand = item_brand then 'yes' else 'no' end as second_item
from item_list
where ord_rank = 2
)
select u.user_id as seller_id, case when seller_id is null then 'no' else second_item end as item_fav_brand 
from users u  left join second_list i on u.user_id = i.seller_id 