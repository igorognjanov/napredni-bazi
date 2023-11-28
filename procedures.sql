CREATE PROCEDURE ticket_bets_search(ticketid BIGINT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    update tiket
    set state = (select count(case
                                  when (m.result = 'Home Team Wins' and bc.name not like '%1') then true
                                  when (m.result = 'Away Team Wins' and bc.name not like '%2') then true
                                  when (m.result = 'Draw' and bc.name not like '%x') then true
        end) = 0
                 from tiketbet tb
                          join bettingcoefficients b on tb.bettingcoefficientsid = b.id
                          join matches m on b.matchesid = m.id
                          join bettingcombinations bc on b.bettingcombinationsid = bc.id
                 where tiketid = ticketid)
    where id = ticketid;
END
$$;



select *
from tiket;
CALL ticket_bets_search(409409);

select * from tiket where id = 409409;
select * from tiketbet where tiketid = 409409;
select * from tiketbet where id in (1085721,1085722,1085723);
select * from bettingcoefficients where id in (58791,29209,111888);



--
-- SELECT *
-- FROM ticket_bet_view as tb
-- WHERE tb.ticketId = ticket;

$$;

CREATE PROCEDURE ticket_user_search(userId BIGSERIAL)
    LANGUAGE SQL
AS
$$

SELECT *
FROM tikets_status as ts
WHERE ts.user_id = userId;

$$;

CREATE PROCEDURE player_team_search(team BIGSERIAL)
    LANGUAGE SQL
AS
$$

SELECT *
FROM players as p
WHERE p.team_id = team;

$$;

CREATE PROCEDURE teams_league_search(leagueId BIGSERIAL)
    LANGUAGE SQL
AS
$$

SELECT *
FROM teams as t
WHERE t.league_id = leagueId;

$$;

