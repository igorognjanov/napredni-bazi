CREATE OR REPLACE FUNCTION insert_team_function(p_result text, p_judgeId int, p_stadiumId int, p_seasonId int,
                                                p_homeTeamId int, p_awayTeamId int, p_date date)
    RETURNS VOID AS
$$
BEGIN
    insert into matches(result, judgeid, stadiumid, seasonid, hometeam, awayteam, match_date)
    values (p_result, p_judgeId, p_stadiumId, p_seasonId, p_homeTeamId, p_awayTeamId, p_date);
END
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_ticket_function(p_stake int, p_return int, p_odd int, p_userid int)
    RETURNS INT AS
$$
DECLARE
    new_ticket_id INT;
BEGIN
    INSERT INTO tiket(stake, "Return", odd, state, userid)
    VALUES (p_stake, 0, p_odd, 'Created', p_userid)
    RETURNING id INTO new_ticket_id;

    RETURN new_ticket_id;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_ticketBet_function(p_tiketId int, p_betId int)
    RETURNS VOID AS
$$
BEGIN
    insert into tiketbet(tiketid, bettingcoefficientsid) 
    VALUES (p_tiketId, p_betId); 
END
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_bet_function(p_coefficiten text, p_state int, p_match int, p_combination int)
    RETURNS VOID AS
$$
BEGIN
    insert into bettingcoefficients(coefficient, state, matchesid, bettingcombinationsid)
    values (p_coefficiten, p_state, p_match, p_combination);
END
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_bet_function(p_betId text, p_state text)
    RETURNS VOID AS
$$
BEGIN
    update bettingcoefficients
    set state=p_state
    where id = p_betId;
END
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_user_function(p_first_name text, p_last_name text, p_date_of_birth date, p_email text,
                                                p_location_id int,
                                                p_gender_id int, p_username text, p_password text, p_locationId int,
                                                p_roleId int, p_cardIssue int, p_expire date)
    RETURNS VOID AS
$$
BEGIN
    insert into person(first_name, last_name, date_of_birth, email, location_id, gender_id)
    values (p_first_name, p_last_name, p_date_of_birth, p_email, p_location_id, p_gender_id);
    insert into debitcard(issue, dateofexpire, "Column")
    values (p_cardIssue, p_expire, 0);
    insert into bettingcard(totalmoney, debitcardid)
    values (0, (select id from debitcard where issue = p_cardIssue));
    insert into "User"(username, password, person_id, locationid, roleid, "Betting CardId")
    VALUES (p_username, p_password, (select id from person where last_name = p_last_name and first_name = p_first_name),
            p_locationId, p_roleId,
            (select id from bettingcard where debitcardid = (select id from debitcard where issue = p_cardIssue)));
END
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_match_function(p_judgeid int, p_stadiumid int, p_seasonid int, p_hometeam int,
                                                 p_awayteam int, p_date date)
    RETURNS VOID AS
$$
BEGIN
    insert into matches (result, judgeid, stadiumid, seasonid, hometeam, awayteam, match_date)
    values (null, p_judgeid, p_stadiumid, p_seasonid, p_hometeam, p_awayteam, p_date);
END
$$
    LANGUAGE plpgsql;