######################################################################################
# Write an sql query to find the  missing quarter for each store
#######################################################################################

CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);


Solution:
with cte as (
select distinct a.store,b.quarter
from stores a cross join stores b 
order by store
)
select c.*
from cte c left join stores s
on c.store = s.store and  c.quarter = s.quarter
where s.quarter is null

