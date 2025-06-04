-- models/cleaned_games.sql
{{ config(materialized='view') }}

SELECT
  schedule_date::DATE AS game_date,
  schedule_season,
  schedule_playoff,
  team_favorite_id,
  spread_favorite,
  team_home,
  team_away,
  score_home,
  score_away,
  home_team_conference,
  away_team_conference
FROM {{ source('nfl_source', 'games_with_team_info') }}
WHERE score_home IS NOT NULL AND score_away IS NOT NULL AND 
team_favorite_id IS NOT NULL AND spread_favorite IS NOT NULL AND
schedule_season >= 1979
