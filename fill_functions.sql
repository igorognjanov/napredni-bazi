-- CREATE OR REPLACE FUNCTION fill_random_person_data()
--     RETURNS VOID AS
-- $$
-- DECLARE
--     first_names VARCHAR[] := ARRAY ['Eliot', 'John', 'Emma', 'Sophia', 'Michael', 'Olivia', 'William', 'Ava'];
--     last_names  VARCHAR[] := ARRAY ['Doull', 'Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller'];
--     genders     VARCHAR[] := ARRAY ['Male', 'Female'];
-- BEGIN
--     FOR i IN 1..100 -- Change the loop count based on your needs
--         LOOP
--             INSERT INTO person(first_name, last_name, date_of_birth, email, gender_id, location_id)
--             VALUES (first_names[1 + floor(random() * array_length(first_names, 1))],
--                     last_names[1 + floor(random() * array_length(last_names, 1))],
--                     '2/6/1998',
--                     'email@example.com', -- Replace with a proper email generation logic
--                     (select id from gender where name = 'Male'), (select id from location order by random() limit 1));
--         END LOOP;
-- END;
-- $$
--     LANGUAGE plpgsql;
-- select * from fill_random_person_data();
-- select * from person;

insert into bettingcombinations(name)
values ('1'),
       ('x'),
       ('2'),
       ('1-1'),
       ('2-2'),
       ('x-x'),
       ('x-1'),
       ('x-x'),
       ('1-x'),
       ('1-2'),
       ('2-1'),
       ('2-2'),
       ('2-x');


insert into role
values (1, 'user');



CREATE OR REPLACE FUNCTION fill_person_data(num_rows integer)
    RETURNS void AS
$$
DECLARE
    first_name_chars text[] := ARRAY ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    last_name_chars  text[] := ARRAY ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Person (first_name, last_name, date_of_birth, email, location_id, gender_id)
            VALUES ((SELECT array_to_string(
                                    ARRAY(SELECT first_name_chars[1 + (random() * 26)] FROM generate_series(1, 5)),
                                    '')),
                    (SELECT array_to_string(
                                    ARRAY(SELECT last_name_chars[1 + (random() * 26)] FROM generate_series(1, 5)), '')),
                    (SELECT to_date(to_char((date_trunc('year', now()) +
                                             (random() * (now()::date - date_trunc('year', now())))), 'YYYY-MM-DD'),
                                    'YYYY-MM-DD')),
                    (SELECT array_to_string(ARRAY(SELECT substring(md5(random()::text) from 1 for 5)
                                                  FROM generate_series(1, 2)), '') || '@example.com'),
                    (SELECT id FROM Location ORDER BY random() LIMIT 1),
                    (SELECT id FROM Gender ORDER BY random() LIMIT 1));
        END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fill_person_data(1000);
select * from person;


CREATE OR REPLACE FUNCTION fill_random_data_for_team()
    RETURNS VOID AS
$$
DECLARE
    team_name   TEXT;
    location_id BIGINT;
    league_id   BIGINT;
    stadium_id  BIGINT;
BEGIN
    FOR i IN 1..1000
        LOOP
            team_name := (select Name from TeamNames order by random() limit 1);
            location_id := (SELECT id FROM Location ORDER BY random() LIMIT 1);
            league_id := (SELECT id FROM League ORDER BY random() LIMIT 1);
            stadium_id := (SELECT id FROM Stadium ORDER BY random() LIMIT 1);

            INSERT INTO Team (Name, location_id, league_id, StadiumId)
            VALUES (team_name, location_id, league_id, stadium_id);
        END LOOP;
END;
$$
    LANGUAGE plpgsql;



select fill_random_data_for_team();
select *
from team;

--------------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION fill_random_data_for_judge()
    RETURNS VOID AS
$$
DECLARE
    person_id BIGINT;
BEGIN
    FOR i IN 1..1000
        LOOP
            person_id := (Select id from person order by random() limit 1);
            INSERT INTO Judge (person_id)
            values (person_id);
        END LOOP;
END;
$$
    LANGUAGE plpgsql;

select fill_random_data_for_judge();
select * from judge;

-------------------------------------------------------------

CREATE OR REPLACE FUNCTION fill_random_data_for_coach()
    RETURNS VOID AS
$$
DECLARE
    person_id BIGINT;
BEGIN
    FOR i IN 1..1000
        LOOP
            person_id := (Select id from person order by random() limit 1);
            INSERT INTO coach(person_id, title)
            values (person_id, 'judge');
        end loop;
END;
$$
    LANGUAGE plpgsql;

select fill_random_data_for_coach();
select *
from coach;

---


CREATE OR REPLACE FUNCTION fill_random_data_for_team()
    RETURNS VOID AS
$$
DECLARE
    team_name   TEXT;
    location_id BIGINT;
    league_id   BIGINT;
    stadium_id  BIGINT;
BEGIN
    FOR i IN 1..1000
        LOOP
            team_name := (select Name from TeamNames order by random() limit 1);
            location_id := (SELECT id FROM Location ORDER BY random() LIMIT 1);
            league_id := (SELECT id FROM League ORDER BY random() LIMIT 1);
            stadium_id := (SELECT id FROM Stadium ORDER BY random() LIMIT 1);

            INSERT INTO Team (Name, location_id, league_id, StadiumId)
            VALUES (team_name, location_id, league_id, stadium_id);
        END LOOP;
END;
$$
    LANGUAGE plpgsql;

select fill_random_data_for_team();
select *
from team;


CREATE OR REPLACE FUNCTION fill_random_data_for_judge()
    RETURNS VOID AS
$$
DECLARE
    person_id BIGINT;
BEGIN
    FOR i IN 1..1000
        LOOP
            person_id := (Select id from person order by random() limit 1);
            INSERT INTO Judge (person_id)
            values (person_id);
        END LOOP;
END;
$$
    LANGUAGE plpgsql;

select fill_random_data_for_judge();
select *
from judge;



CREATE OR REPLACE FUNCTION fill_coach_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Coach (person_id, Title)
            VALUES ((SELECT id FROM Person ORDER BY random() LIMIT 1),
                    CASE floor(random() * 2)
                        WHEN 0 THEN 'HEAD COACH'
                        WHEN 1 THEN 'ASSISTANT COACH'
                        END);
        END LOOP;
END;
$$ LANGUAGE plpgsql;

select fill_coach_data(1000);
select * from coach;



CREATE OR REPLACE FUNCTION fill_coach_team_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Coach_Team (CoachId, TeamId, "From", "To")
            VALUES ((SELECT id FROM Coach ORDER BY random() LIMIT 1),
                    (SELECT id FROM Team ORDER BY random() LIMIT 1),
                    (SELECT to_date(to_char((date_trunc('year', now() - interval '10 years') + (random() *
                                                                                                (now()::date - date_trunc('year', now() - interval '10 years')))),
                                            'YYYY-MM-DD'), 'YYYY-MM-DD')),
                    (SELECT to_date(to_char((date_trunc('year', now()) +
                                             (random() * (now()::date - date_trunc('year', now())))), 'YYYY-MM-DD'),
                                    'YYYY-MM-DD')));
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_coach_team_data(1000);
select *
from coach_team;


CREATE OR REPLACE FUNCTION fill_data_season()
    RETURNS VOID AS
$$
DECLARE
    l_id bigint;
    i    int;
BEGIN
    FOR l_id IN (select id from league)
        LOOP
            for i in 1980..2022
                loop
                    insert into season("Year started", leagueid)
                    values (i::text, l_id);
                end loop;
        end loop;
end;
$$ LANGUAGE plpgsql;

select fill_data_season();
select *
from season;


CREATE OR REPLACE FUNCTION fill_matches_data(num_rows integer)
    RETURNS void AS
$$
DECLARE
    HomeTeam BIGINT;
    AWAYTEAM BIGINT;
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Matches (Result, JudgeId, StadiumId, SeasonId, HomeTeam, AwayTeam, match_date, Status)
            SELECT CASE floor(random() * 3)
                       WHEN 0 THEN 'Home Team Wins'
                       WHEN 1 THEN 'Away Team Wins'
                       WHEN 2 THEN 'Draw'
                       END,
                   (SELECT id FROM Judge ORDER BY random() LIMIT 1),
                   (SELECT id FROM Stadium ORDER BY random() LIMIT 1),
                   (SELECT id FROM Season ORDER BY random() LIMIT 1),
                   (SELECT id FROM Team ORDER BY random() LIMIT 1),
                   (SELECT id FROM Team ORDER BY random() LIMIT 1),
                   (SELECT to_date(to_char((date_trunc('year', now() - interval '10 years') + (random() *
                                                                                               (now()::date - date_trunc('year', now() - interval '10 years')))),
                                           'YYYY-MM-DD'), 'YYYY-MM-DD')),
                   'Finished'
            FROM generate_series(1, 1);
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_matches_data(1000);
select *
from matches;



CREATE OR REPLACE FUNCTION fill_player_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Player (person_id, TeamId, PositionId, LocationId)
            VALUES ((SELECT id FROM Person ORDER BY random() LIMIT 1),
                    (SELECT id FROM Team ORDER BY random() LIMIT 1),
                    CASE floor(random() * 4)
                        WHEN 0 THEN 'GK'
                        WHEN 1 THEN 'D'
                        WHEN 2 THEN 'M'
                        WHEN 3 THEN 'S'
                        END,
                    (SELECT id FROM Location ORDER BY random() LIMIT 1));
        END LOOP;
END;
$$ LANGUAGE plpgsql;

select fill_player_data(1000);
select *
from player;



CREATE OR REPLACE FUNCTION fill_player_team_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO Player_Team (PlayerId, TeamId, "From", "To")
            VALUES ((SELECT id FROM Player ORDER BY random() LIMIT 1),
                    (SELECT id FROM Team ORDER BY random() LIMIT 1),
                    (SELECT date_trunc('day', now()) - CAST(floor(random() * 365 * 10) || ' days' as interval)),
                    (SELECT nullif(date_trunc('day', now()) + CAST(floor(random() * 365 * 3) || ' days' as interval),
                                   date_trunc('day', now()))));
        END LOOP;
END;
$$ LANGUAGE plpgsql;

select fill_player_team_data(1000);
select *
from player_team;



CREATE OR REPLACE FUNCTION fill_debit_card_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO DebitCard (Issue, DateOfExpire, "Column")
            VALUES (floor(random() * 10000000000000000)::bigint,
                    (now() + (interval '1 year' * (floor(random() * 5) + 1)))::date,
                    floor(random() * 10000000000000000)::bigint);
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_debit_card_data(100);
select *
from debitcard;



CREATE OR REPLACE FUNCTION fill_betting_card_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO BettingCard (TotalMoney, DebitCardId)
            VALUES ((SELECT floor(random() * 10000)::bigint),
                    (SELECT id FROM DebitCard ORDER BY random() LIMIT 1));
        END LOOP;
END;
$$ LANGUAGE plpgsql;

select fill_betting_card_data(100);
select *
from bettingcard;



CREATE OR REPLACE FUNCTION fill_user_data(num_users INTEGER)
    RETURNS VOID AS
$$
DECLARE
    p_id   INTEGER;
    l_id   INTEGER;
    r_id   INTEGER;
    b_id   INTEGER;
    u_name TEXT;
    p_word TEXT;
BEGIN
    FOR i IN 1..num_users
        LOOP
            p_id := (SELECT id FROM Person ORDER BY RANDOM() LIMIT 1);
            l_id := (SELECT id FROM Location ORDER BY RANDOM() LIMIT 1);
            r_id := (SELECT id FROM Role ORDER BY RANDOM() LIMIT 1);
            b_id := (SELECT id FROM BettingCard ORDER BY RANDOM() LIMIT 1);
            u_name := (SELECT string_agg(chr((97 + round(random() * 25))::integer), '') FROM generate_series(1, 10));
            p_word := MD5(random()::TEXT);
            INSERT INTO "User" (username, password, person_id, LocationId, RoleId, "Betting CardId")
            VALUES (u_name, p_word, p_id, l_id, r_id, b_id);
        END LOOP;
END;
$$ LANGUAGE plpgsql;
select fill_user_data(100);
select *
from "User";


select *
from season;
select *
from person;



select *
from season;



CREATE OR REPLACE FUNCTION fill_betting_coefficients_data()
    RETURNS void AS
$$
declare
    combination_id bigint;
    match_id       bigint;
BEGIN
    FOR combination_id IN (select id from bettingcombinations)
        LOOP
            for match_id in (select id from matches)
                loop
                    INSERT INTO BettingCoefficients (Coefficient, State, MatchesId, BettingCombinationsId)
                    VALUES (TRUNC((RANDOM() * 10 + 1)::numeric, 2),
                            (CASE TRUNC((RANDOM() * 2 + 1)::numeric, 0) WHEN 1 THEN 'Active' ELSE 'Inactive' END),
                            match_id,
                            combination_id);
                END LOOP;
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_betting_coefficients_data();
select *
from bettingcoefficients;




CREATE OR REPLACE FUNCTION fill_data_team_season()
    RETURNS VOID AS
$$
DECLARE
    team   RECORD;
    season record;
BEGIN
    FOR team IN (select * from team)
        LOOP
            for season in (select * from season where LeagueId = team.league_id)
                loop
                    insert into team_season(teamid, seasonid)
                    values (team.id, season.id);
                end loop;
        end loop;
end;
$$ LANGUAGE plpgsql;

select fill_data_team_season();
select *
from team_season;



CREATE OR REPLACE FUNCTION fill_betting_coefficients_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            INSERT INTO BettingCoefficients (Coefficient, State, MatchesId, BettingCombinationsId)
            VALUES (round((RANDOM() * 10 + 1)::numeric, 2),
                    'NOT YET PLAYED',
                    (SELECT id FROM Matches ORDER BY RANDOM() LIMIT 1),
                    (SELECT id FROM BettingCombinations ORDER BY RANDOM() LIMIT 1));
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_betting_coefficients_data(100);
select *
from bettingcoefficients;

--======================================================

CREATE OR REPLACE FUNCTION fill_judge_matches_data()
    RETURNS void AS
$$
declare
    match_id bigint;
BEGIN
    FOR match_id IN (select id from matches)
        LOOP
            insert into judge_matches(judgeid, matchesid)
            select id, match_id
            from judge
            order by random()
            limit round(random() * 2 + 3);
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_judge_matches_data();
select *
from judge_matches;

--=================================


CREATE OR REPLACE FUNCTION fill_tiket_data(num_rows integer)
    RETURNS void AS
$$
BEGIN
    FOR i IN 1..num_rows
        LOOP
            insert into tiket(stake, "Return", odd, state, userid)
            select random() * 10000 + 10,
                   0,
                   1,
                   (CASE TRUNC((RANDOM() * 2 + 1)::numeric, 0) WHEN 1 THEN 'Won' ELSE 'Lost' END),
                   (select id from "User" order by random() limit 1);
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_tiket_data(10000);
select *
from tiket;

--=====================================


CREATE OR REPLACE FUNCTION fill_tiket_bet_data()
    RETURNS void AS
$$
declare
    tiket_id bigint;
BEGIN
    FOR tiket_id IN (select id from tiket)
        LOOP
            insert into tiketbet(tiketid, bettingcoefficientsid)
            select tiket_id, id
            from bettingcoefficients
            order by random()
            limit round(random() * 3 + 4);
        END LOOP;
END;
$$ LANGUAGE plpgsql;


select fill_tiket_bet_data();
select *
from tiketbet;


create or replace function on_tiket_bet_insert() returns trigger AS
$$
declare
    total_coefficient decimal;
    coef              decimal;
    gain              bigint;
    total             bigint;
begin
    coef := (select coefficient from bettingcoefficients where id = new.bettingcoefficientsid);
    total_coefficient := round((select odd from tiket where id = new.tiketid) * coef, 2);
    total := total_coefficient * (select stake from tiket where id = new.tiketid);
    gain := total - round(total * 0.18);
    update tiket set odd = total_coefficient, "Return" = gain where id = new.tiketid;
    return new;
end;
$$ language plpgsql;

create trigger on_tiket_bet_insert
    before insert
    on tiketbet
    for each row
execute function on_tiket_bet_insert();

-- drop trigger on_tiket_bet_insert on tiketbet;


create or replace function on_tiket_bet_delete() returns trigger AS
$$
declare
    total_coefficient decimal;
    coef              decimal;
    gain              bigint;
    total             bigint;
begin
    coef := (select coefficient from bettingcoefficients where id = old.bettingcoefficientsid);
    total_coefficient := round((select odd from tiket where id = old.tiketid) / coef, 2);
    total := total_coefficient * (select stake from tiket where id = old.tiketid);
    if (select count(*) from tiketbet where tiketid = old.tiketid) = 0
    then
        gain := total;
    else
        gain := total - round(total * 0.18);
    end if;

    update tiket set odd = total_coefficient, "Return" = gain where id = old.tiketid;
    return old;
end;
$$ language plpgsql;

create trigger on_tiket_bet_delete
    before delete
    on tiketbet
    for each row
execute function on_tiket_bet_delete();

-- drop trigger on_tiket_bet_delete on tiketbet;


create or replace function on_betting_coefficient_update() returns trigger AS
$$
begin
    update tiket
    set odd      = round(((odd / old.coefficient) * new.coefficient), 2),
        "Return" = odd * stake * 0.82 -- 18% tax
    where id in (select distinct tiketid
                 from tiketbet
                 where bettingcoefficientsid = old.id);
    return new;
end;
$$ language plpgsql;

create trigger on_betting_coefficient_update
    after update
    on bettingcoefficients
    for each row
execute function on_betting_coefficient_update();

-- drop trigger on_betting_coefficient_update on bettingcoefficients;



CREATE OR REPLACE FUNCTION on_matches_update()
RETURNS TRIGGER AS
$$
DECLARE
    ticket_bet RECORD;
    result     TEXT;
BEGIN
    IF (OLD.result != NEW.result) THEN
        FOR ticket_bet IN (SELECT tb.*
                           FROM bettingcoefficients bc
                                    JOIN ticketbet tb ON bc.id = tb.bettingcoefficientsid
                           WHERE bc.matchesid = OLD.id)
        LOOP
            result := (SELECT m.result
                       FROM bettingcoefficients bc
                                JOIN matches m ON m.id = bc.matchesid
                       WHERE bc.id = ticket_bet.bettingcoefficientsid);
            

            UPDATE ticket
            SET state = 
                CASE result
                    WHEN 'Home Team Wins' THEN 'SomeState1'
                    WHEN 'Away Team Wins' THEN 'SomeState2'
                    WHEN 'Draw' THEN 'SomeState3'
                    ELSE 'SomeDefaultState'
                END
            WHERE id = ticket_bet.ticketid;
        END LOOP;
    END IF;
    RETURN NEW;
EXCEPTION
    WHEN others THEN
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER on_matches_update
AFTER UPDATE ON matches
FOR EACH ROW
EXECUTE FUNCTION on_matches_update();


