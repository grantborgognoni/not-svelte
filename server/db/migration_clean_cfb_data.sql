ATTACH DATABASE 'server/db/cfb.db' AS old;

DROP TABLE IF EXISTS cfb_team_stats;

CREATE TABLE cfb_team_stats (
    season INTEGER NOT NULL,
    team TEXT NOT NULL,
    games INTEGER,
    wins INTEGER,
    losses INTEGER,
    points_per_game REAL,
    total_points INTEGER,
    offense_rank INTEGER,
    offense_plays INTEGER,
    offense_yards INTEGER,
    offense_yards_per_play REAL,
    offense_touchdowns INTEGER,
    offense_yards_per_game REAL,
    defense_rank INTEGER,
    defense_plays INTEGER,
    yards_allowed INTEGER,
    yards_per_play_allowed REAL,
    total_touchdowns_allowed INTEGER,
    points_allowed INTEGER,
    avg_points_per_game_allowed REAL,
    pass_attempts INTEGER,
    pass_completions INTEGER,
    pass_yards INTEGER,
    pass_touchdowns INTEGER,
    interceptions_thrown INTEGER,
    pass_yards_per_attempt REAL,
    rush_attempts INTEGER,
    rush_yards INTEGER,
    rush_touchdowns INTEGER,
    yards_per_rush REAL,
    fumbles_recovered INTEGER,
    interceptions_gained INTEGER,
    turnovers_lost INTEGER,
    turnover_margin INTEGER,
    PRIMARY KEY (season, team)
);

-- Insert and transform data from cfb2013 to cfb2020
INSERT INTO cfb_team_stats
SELECT
  2013 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2013
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2014 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2014
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2015 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2015
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2016 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2016
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2017 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2017
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2018 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2018
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2019 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2019
WHERE "Team" IS NOT NULL;

INSERT INTO cfb_team_stats
SELECT
  2020 AS season,
  "Team" AS team,
  CAST(NULLIF("Games", '') AS INTEGER) AS games,
  CAST(NULLIF("Win", '') AS INTEGER) AS wins,
  CAST(NULLIF("Loss", '') AS INTEGER) AS losses,
  CAST(NULLIF("Points.Per.Game", '') AS REAL) AS points_per_game,
  CAST(NULLIF("Total.Points", '') AS INTEGER) AS total_points,
  CAST(NULLIF("Off.Rank", '') AS INTEGER) AS offense_rank,
  CAST(NULLIF("Off.Plays", '') AS INTEGER) AS offense_plays,
  CAST(NULLIF("Off.Yards", '') AS INTEGER) AS offense_yards,
  CAST(NULLIF("Off.Yards.Play", '') AS REAL) AS offense_yards_per_play,
  CAST(NULLIF("Off.TDs", '') AS INTEGER) AS offense_touchdowns,
  CAST(NULLIF("Off.Yards.per.Game", '') AS REAL) AS offense_yards_per_game,
  CAST(NULLIF("Def.Rank", '') AS INTEGER) AS defense_rank,
  CAST(NULLIF("Def.Plays", '') AS INTEGER) AS defense_plays,
  CAST(NULLIF("Yards.Allowed", '') AS INTEGER) AS yards_allowed,
  CAST(NULLIF("Yards.Play.Allowed", '') AS REAL) AS yards_per_play_allowed,
  CAST(NULLIF("Total.TDs.Allowed", '') AS INTEGER) AS total_touchdowns_allowed,
  CAST(NULLIF("Points.Allowed", '') AS INTEGER) AS points_allowed,
  CAST(NULLIF("Avg.Points.per.Game.Allowed", '') AS REAL) AS avg_points_per_game_allowed,
  CAST(NULLIF("Pass.Attempts", '') AS INTEGER) AS pass_attempts,
  CAST(NULLIF("Pass.Completions", '') AS INTEGER) AS pass_completions,
  CAST(NULLIF("Pass.Yards", '') AS INTEGER) AS pass_yards,
  CAST(NULLIF("Pass.Touchdowns", '') AS INTEGER) AS pass_touchdowns,
  CAST(NULLIF("Interceptions.Thrown.x", '') AS INTEGER) AS interceptions_thrown,
  CAST(NULLIF("Pass.Yards.Attempt", '') AS REAL) AS pass_yards_per_attempt,
  CAST(NULLIF("Rush.Attempts", '') AS INTEGER) AS rush_attempts,
  CAST(NULLIF("Rush.Yds", '') AS INTEGER) AS rush_yards,
  CAST(NULLIF("Rushing.TD", '') AS INTEGER) AS rush_touchdowns,
  CAST(NULLIF("Yards.Rush", '') AS REAL) AS yards_per_rush,
  CAST(NULLIF("Fumbles.Recovered", '') AS INTEGER) AS fumbles_recovered,
  CAST(NULLIF("Opponents.Intercepted", '') AS INTEGER) AS interceptions_gained,
  CAST(NULLIF("Turnovers.Lost", '') AS INTEGER) AS turnovers_lost,
  CAST(NULLIF("Turnover.Margin", '') AS INTEGER) AS turnover_margin
FROM old.cfb2020
WHERE "Team" IS NOT NULL;

DROP TABLE IF EXISTS cfb_team_stats_fts;
CREATE VIRTUAL TABLE cfb_team_stats_fts USING fts5(
  team,
  content='cfb_team_stats',
  content_rowid='rowid'
);
INSERT INTO cfb_team_stats_fts(rowid, team)
SELECT rowid, team FROM cfb_team_stats;