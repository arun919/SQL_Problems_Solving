winner 
############################### Problem Statement ###############################################
# find the winner in each group based on the score. 
# Incase score is tie, select lowest id as winner
#################################################################################################

# Input :

create table players
(player_id int,
group_id int)


insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);


create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)



insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);

-- Solution:

select * from players;

select * from matches;

-- combine socre of all player
with score1 as 
(
select first_player as player_id,first_score as score from matches
union all 
select second_player as player_id,second_score as score from matches
),
-- find the final score
 final_score as 
(
select p.group_id, p.player_id,sum(score) as total_score 
from score1 s inner join players p on s.player_id = p.player_id
group by p.group_id, p.player_id
),
-- find rank for each player within group
final_ranking as 
(
select *,dense_rank() over (partition by group_id order by total_score desc ,player_id asc) as player_rank
from final_score
)
--  select  top player from each group
select * 
from final_ranking where player_rank = 1