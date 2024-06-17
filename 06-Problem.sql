######################################################################################
# Write an sql query to find total sales by product between given dates
###################################################################################

Input:
create and insert script for this problem. Do try yourself without using CTE.

create table sales (
product_id int,
period_start date,
period_end date,
average_daily_sales int
);

insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);

solution:
cte1 as (
select min(period_start) as start_date, max(perio_end) as end_date
from sales
union all
select  dateadd(day,1,start_date) as start_date, max(perio_end) as end_date
from cte1
where start_date < end_date
)

select s.prodcut_id,year(c.start_date) as report_year,sum(average_daily_sales) as tot_sale
from cte1 c inner join sales s on c.start_date  between s.period_start and s.period_end
group by s.product_id,year(c.start_date)
order by s.product_id,year(c.start_date)