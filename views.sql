create or replace view matches as
select m.id          as id,
       th.name       as homeTeam,
       ta.name       as awayTeam,
       s.name        as stadium,
       m.result      as result,
       jp.first_name as judge,
       m."Date"      as date
from matches m
         join team th on m.hometeam = th.id
         join team ta on m.awayteam = ta.id
         join stadium s on s.id = th.stadiumid
         join judge j on j.id = m.judgeid
         join person jp on j.person_id = jp.id;


create or replace view tickets as
select t.id           as id,
       bc.coefficient as coefficient,
       th.name        as homeTeam,
       ta.name        as awayTeam,
       m."Date"       as date,
       bcm.name       as combination,
       u.username     as username
from tiket t
         join tiketbet bt on t.id = bt.tiketid
         join "User" u on t.userid = u.id
         join bettingcoefficients bc on bt."Betting coefficient" = bc.id
         join BettingCombinations bcm on bc.BettingCombinationsId = bcm.id
         join matches m on m.id = bc.matchesid
         join team th on th.id = m.hometeam
         join team ta on ta.id = m.awayteam;

create or replace view users as
select u.id            as id,
       p.first_name    as first_name,
       p.last_name     as last_name,
       p.email         as email,
       u.username      as username,
       p.date_of_birth as date_of_birth,
       l.address       as address,
       bc.TotalMoney   as deposit,
       g.name          as gender
from "User" u
         join person p on u.person_id = p.id
         join location l on p.location_id = l.id
         join role r on u.roleid = r.id
         join bettingcard bc on u."Betting CardId" = bc.id
         join gender g on p.gender_id = g.id;

create or replace view players as
select p.id              as id,
       per.first_name    as first_name,
       per.last_name     as last_name,
       per.date_of_birth as date_of_birth,
       t.name            as team_name,
       l.country         as country
from Player p
         join Person per on p.person_id = per.id
         join Location l on l.id = per.location_id
         join player_team pt on p.id = pt.playerid
         join Team t on t.id = pt.teamid;

create or replace view seasons as
select s.id             as id,
       s.name           as name,
       s.country        as country,
       s."Year started" as year_started,
       l.name           as legue_name
from season s
         join league l on s.leagueid = l.id;

create or replace view bets as
select b.id          as id,
       th.name       as home_team,
       ta.name       as away_team,
       bc.name       as combination,
       b.coefficient as coefficient,
       b.state       as state,
       m.result      as result,
       m."Date"      as date
from bettingcoefficients b
         join bettingcombinations bc on b.bettingcombinationsid = bc.id
         join matches m on b.matchesid = m.id
         join team ta on m.awayteam = ta.id
         join team th on m.awayteam = th.id;

create or replace view teams as
select t.id    as id,
       t.name  as name,
       lo.city as locaton,
       l.name  as league,
       s.name  as stadium
from team t
         join league l on t.league_id = l.id
         join location lo on t.location_id = lo.id
         join stadium s on t.stadiumid = s.id;

create or replace view coaches as
select c.id         as id,
       p.first_name as first_name,
       p.last_name  as last_name,
       t.name       as team
from coach c
         join coach_team ct on c.id = ct.coachid
         join team t on ct.teamid = t.id
         join person p on c.person_id = p.id;

create or replace view judges as
select j.id         as id,
       p.last_name  as last_name,
       p.first_name as first_name
from judge j
         join person p on p.id = j.person_id;

create or replace view tikets_status as
select t.id       as id,
       t.state    as state,
       u.username as username,
       t."Return" as return,
       t.odd      as odd,
       t.stake    as stake
from "User" u
         join tiket t on u.username = t.userid
         join tiketbet tb on t.id = tiketid
         join bettingcoefficients b on tb.bettingcoefficientsid = b.id
group by t.id;