create table Gender
(
    id   serial not null primary key ,
    name text

);

CREATE TABLE Location
(
    Id      BIGSERIAL NOT NULL,
    Country text,
    City    text,
    Address text,
    PRIMARY KEY (Id)
);

create table Person
(
    id            bigserial not null primary key ,
    first_name    text,
    last_name     text,
    date_of_birth date,
    email         text,
    location_id   bigint not null references Location(id),
    gender_id     int    not null references Gender (id)
);

CREATE TABLE BettingCard
(
    Id         BIGSERIAL NOT NULL,
    TotalMoney bigint,
    DebitCardId bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE BettingCoefficients
(
    Id                    BIGSERIAL NOT NULL,
    Coefficient           text,
    State                 text,
    MatchesId             bigint    NOT NULL,
    BettingCombinationsId bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE BettingCombinations
(
    Id                    BIGSERIAL NOT NULL,
    Name                  text,
    BettingCoefficientsId bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Coach
(
    Id        BIGSERIAL NOT NULL,
    person_id bigint    not null references Person (id),
    Title     text,
    PRIMARY KEY (Id)
);
CREATE TABLE Coach_Team
(
    CoachId bigint NOT NULL,
    TeamId  bigint NOT NULL,
    "From"  date,
    "To"    date,
    PRIMARY KEY (CoachId, TeamId)
);
CREATE TABLE DebitCard
(
    Id               BIGSERIAL NOT NULL,
    Issue            bigint,
    DateOfExpire     date,
    "Column"         bigint,
--     "Betting CardId" bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Judge
(
    Id        BIGSERIAL NOT NULL,
    person_id bigint    not null references Person (id),
    PRIMARY KEY (Id)
);
CREATE TABLE Judge_Matches
(
    JudgeId   bigint NOT NULL,
    MatchesId bigint NOT NULL,
    PRIMARY KEY (JudgeId, MatchesId)
);
CREATE TABLE League
(
    Id      BIGSERIAL NOT NULL,
    Name    text,
    SportId bigint    NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Matches
(
    Id        BIGSERIAL NOT NULL,
    Result    text,
    JudgeId   bigint    NOT NULL,
    StadiumId bigint    NOT NULL,
    SeasonId  bigint    NOT NULL,
    HomeTeam  bigint    NOT NULL,
    AwayTeam  bigint    NOT NULL,
    "Date"    date      NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Player
(
    Id         BIGSERIAL NOT NULL,
    person_id  bigint    not null references Person (id),
    TeamId     bigint    NOT NULL,
    PositionId text    NOT NULL,
    LocationId bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Player_Team
(
    PlayerId bigint NOT NULL,
    TeamId   bigint NOT NULL,
    "From"   date   NOT NULL,
    "To"     date,
    PRIMARY KEY (PlayerId, TeamId)
);
CREATE TABLE Role
(
    Id   BIGSERIAL NOT NULL,
    Name text,
    PRIMARY KEY (Id)
);
CREATE TABLE Season
(
    Id             BIGSERIAL NOT NULL,
    Name           text,
    Country        bigint not null references Location(id),
    "Year started" date,
    LeagueId       bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Sport
(
    Id   BIGSERIAL NOT NULL,
    Name text,
    PRIMARY KEY (Id)
);
CREATE TABLE Stadium
(
    Id       BIGSERIAL NOT NULL,
    Name     text,
    Location text,
    PRIMARY KEY (Id)
);
CREATE TABLE Team
(
    Id          BIGSERIAL NOT NULL,
    Name        text,
    location_id bigint    not null references Location (id),
    league_id   bigint    not null references League (id),
    StadiumId   bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE Team_Season
(
    TeamId   bigint NOT NULL,
    SeasonId bigint NOT NULL,
    PRIMARY KEY (TeamId, SeasonId)
);
CREATE TABLE Tiket
(
    Id       BIGSERIAL NOT NULL,
    Stake    text,
    "Return" text,
    Odd      text,
    State    text,
    UserId   bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE TiketBet
(
    Id                    BIGSERIAL NOT NULL,
    "Betting coefficient" text,
    TiketId               bigint    NOT NULL,
    BettingCoefficientsId bigint    NOT NULL,
    PRIMARY KEY (Id)
);
CREATE TABLE "User"
(
    Id               BIGSERIAL NOT NULL,
    username         text,
    password         text,
    person_id        bigint    not null references Person (id),
    LocationId       bigint    NOT NULL,
    RoleId           bigint    NOT NULL,
    "Betting CardId" bigint    NOT NULL,
    PRIMARY KEY (Id)
);


ALTER TABLE Team
    ADD CONSTRAINT FKTeam662608 FOREIGN KEY (StadiumId) REFERENCES Stadium (Id);
ALTER TABLE Team_Season
    ADD CONSTRAINT FKTeam_Seaso18809 FOREIGN KEY (TeamId) REFERENCES Team (Id);
ALTER TABLE Team_Season
    ADD CONSTRAINT FKTeam_Seaso600934 FOREIGN KEY (SeasonId) REFERENCES Season (Id);
ALTER TABLE Season
    ADD CONSTRAINT FKSeason512757 FOREIGN KEY (LeagueId) REFERENCES League (Id);
ALTER TABLE League
    ADD CONSTRAINT FKLeague67023 FOREIGN KEY (SportId) REFERENCES Sport (Id);
ALTER TABLE Player
    ADD CONSTRAINT FKPlayer861974 FOREIGN KEY (LocationId) REFERENCES Location (Id);
ALTER TABLE Matches
    ADD CONSTRAINT FKMatches252556 FOREIGN KEY (StadiumId) REFERENCES Stadium (Id);
ALTER TABLE "User"
    ADD CONSTRAINT FKUser671619 FOREIGN KEY (LocationId) REFERENCES Location (Id);
ALTER TABLE "User"
    ADD CONSTRAINT FKUser349727 FOREIGN KEY (RoleId) REFERENCES Role (Id);
ALTER TABLE "User"
    ADD CONSTRAINT FKUser237501 FOREIGN KEY ("Betting CardId") REFERENCES BettingCard (Id);
ALTER TABLE DebitCard
    ADD CONSTRAINT FKDebitCard219565 FOREIGN KEY ("Betting CardId") REFERENCES BettingCard (Id);
ALTER TABLE TiketBet
    ADD CONSTRAINT FKTiketBet355195 FOREIGN KEY (TiketId) REFERENCES Tiket (Id);
ALTER TABLE TiketBet
    ADD CONSTRAINT FKTiketBet122048 FOREIGN KEY (BettingCoefficientsId) REFERENCES BettingCoefficients (Id);
ALTER TABLE BettingCoefficients
    ADD CONSTRAINT FKBettingCoe364559 FOREIGN KEY (MatchesId) REFERENCES Matches (Id);
ALTER TABLE Matches
    ADD CONSTRAINT FKMatches626676 FOREIGN KEY (SeasonId) REFERENCES Season (Id);
ALTER TABLE Matches
    ADD CONSTRAINT FKMatches564077 FOREIGN KEY (HomeTeam) REFERENCES Team (Id);
ALTER TABLE Matches
    ADD CONSTRAINT FKMatches807954 FOREIGN KEY (AwayTeam) REFERENCES Team (Id);
ALTER TABLE Tiket
    ADD CONSTRAINT FKTiket707155 FOREIGN KEY (UserId) REFERENCES "User" (Id);
ALTER TABLE BettingCoefficients
    ADD CONSTRAINT FKBettingCoe175407 FOREIGN KEY (BettingCombinationsId) REFERENCES BettingCombinations (Id);
ALTER TABLE Judge_Matches
    ADD CONSTRAINT FKJudge_Matc390198 FOREIGN KEY (JudgeId) REFERENCES Judge (Id);
ALTER TABLE Judge_Matches
    ADD CONSTRAINT FKJudge_Matc190106 FOREIGN KEY (MatchesId) REFERENCES Matches (Id);
ALTER TABLE Coach_Team
    ADD CONSTRAINT FKCoach_Team701721 FOREIGN KEY (CoachId) REFERENCES Coach (Id);
ALTER TABLE Coach_Team
    ADD CONSTRAINT FKCoach_Team472826 FOREIGN KEY (TeamId) REFERENCES Team (Id);
ALTER TABLE Player_Team
    ADD CONSTRAINT FKPlayer_Tea896953 FOREIGN KEY (PlayerId) REFERENCES Player (Id);
ALTER TABLE Player_Team
    ADD CONSTRAINT FKPlayer_Tea797403 FOREIGN KEY (TeamId) REFERENCES Team (Id);


create table TeamNames
(
    Id   BIGSERIAL NOT NULL PRIMARY KEY,
    Name text
);
