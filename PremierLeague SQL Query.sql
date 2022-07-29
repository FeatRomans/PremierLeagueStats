
--Check table can be found
select *
from PremierLeague..PremierLeague

-- Sort table by goals scored

select *
from PremierLeague..PremierLeague
order by goals_scored desc

-- Players with the most goal involvements

select Player, Team, Position, goals_scored, assists, (goals_scored+assists) as goal_involvements
from PremierLeague..PremierLeague
--where Position like '%MF%' and Team like '%Chelsea%'
order by goal_involvements desc

-- xG vs Goals

select Player, Team, Position, goals_scored, xG, goals_scored/NULLIF (xG, 0) as Efficiency
from PremierLeague..PremierLeague
where Position like '%MF%' and goals_scored >5
order by Efficiency desc

-- Accumilation of goals per team

select Team, SUM(goals_scored) as goals_team
from PremierLeague..PremierLeague
group by Team
order by goals_team desc

-- accumilation of assists per team

select Team, SUM(assists) as assists_team
from PremierLeague..PremierLeague
group by Team
order by assists_team desc

-- goals by nation

select Nation, SUM(goals_scored) as goals_nation
from PremierLeague..PremierLeague
group by nation
order by goals_nation desc

-- goals scored per minute on the pitch

select Player, Team, minutes, goals_scored, NULLIF (minutes,0) / NULLIF (goals_scored, 0) as goals_minutes
from PremierLeague..PremierLeague
where minutes >1000 and goals_scored >8
order by goals_minutes asc
