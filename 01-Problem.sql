######################################################################################
## Create ICC Table points based on given based ICC match resuls
# input : team1,team2,winner
# output: team,match played,no win & no of lose
###################################################################################

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


solution:

with tot_played as (

select b.team_1 as team, count(team_1) as total_played
 from (select team_1 from icc_world_cup union all select team_2 from icc_world_cup) as b
group by b.team_1
),
winner_list as (

select winner as team, count(winner) as tot_win
from icc_world_cup
group by winner
)

select a.team, a.total_played, case when b.tot_win is null then 0 else b.tot_win end as tot_win, 
 case when b.tot_win is null then 0 else a.total_played - b.tot_win end as tot_los
from tot_played a left join winner_list b on a.team = b.team


