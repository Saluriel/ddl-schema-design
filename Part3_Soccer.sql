DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Age int NOT NULL,
    Number int NOT NULL,
    Team INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE season_dates (
    id SERIAL PRIMARY KEY,
    Starting date,
    Ending date
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    Team_1 INT REFERENCES teams(id) ON DELETE SET NULL,
    Team_2 INT REFERENCES teams(id) ON DELETE SET NULL,
    Referee INT REFERENCES referees(id) ON DELETE SET NULL,
    Season INT REFERENCES season_dates(id) ON DELETE SET NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    Player_ID INTEGER REFERENCES players(id) ON DELETE CASCADE,
    Match_ID INTEGER REFERENCES matches(id) ON DELETE CASCADE
);

CREATE TABLE  results (
    id SERIAL PRIMARY KEY,
    Match_ID INTEGER REFERENCES matches(id) ON DELETE CASCADE,
    Team_ID INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    Outcome TEXT NOT NULL
);

insert into teams (name, ranking) values
('the winners', 3),
('cool guys', 1),
('godzilla', 2);

insert into referees (name) values
('ol ref joe'),
('Abraham'),
('Angry Jim'),
('Regular Jim');

insert into players (name, age, number, team) values
('bob', 8, 14, 1),
('little timmy', 10, 8, 3),
('carol', 9, 73, 2);

insert into season_dates (starting, ending) values('2011-03-03', '2011-07-08'),
('2012-03-08', '2012-07-08');

insert into matches (team_1, team_2, referee, season) values
(1, 2, 1, 1),
(3, 2, 4, 2);

insert into goals (player_id, match_id) values
(1, 1),
(2, 1),
(3, 2);

insert into results (match_id, team_id, outcome) values
(1, 1, 'win'), 
(2, 2, 'lose');
