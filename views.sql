create or replace view matche as
select th.name  as homeTeam,
      ta.name  as awayTeam,
      s.name   as stadium,
      m.result as result,
      j.name as judge,
      m."Date" as date
from matches m
        join team th on m.hometeam = th.id
        join team ta on m.awayteam = ta.id
        join stadium s on s.id = th.stadiumid
        join judge j on j.id = m.judgeid;


create or replace view tickets as
select bc.coefficient as coefficient,
      th.name        as homeTeam,
      ta.name        as awayTeam,
      m."Date"       as date,
      bcm.name       as combination
from tiketbet bt
        join bettingcoefficients bc on bt."Betting coefficient" = bc.id
        join BettingCombinations bcm on bc.BettingCombinationsId = bcm.id
        join matches m on m.id = bc.matchesid
        join team th on th.id = m.hometeam
        join team ta on ta.id = m.awayteam;

create or replace view users as
select u.Name        as name,
      u.email       as email,
      u.username    as username,
      bc.TotalMoney as deposit
from "User" u
        join bettingcard bc on u."Betting CardId" = bc.id;

CREATE TABLE BettingCard
(
   Id         BIGSERIAL NOT NULL,
   TotalMoney bigint,
   DebitCardId bigint    NOT NULL,
   PRIMARY KEY (Id)
);
