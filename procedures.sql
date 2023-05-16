CREATE PROCEDURE ticket_bets_search(ticket BIGSERIAL)
    LANGUAGE SQL
AS
$$

SELECT *
FROM ticket_bet_view as tb
WHERE tb.ticketId = ticket;

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

