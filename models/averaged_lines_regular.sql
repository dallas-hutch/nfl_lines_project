{{ config(materialized='view') }}

SELECT
  schedule_season,
  AVG(spread_favorite) AS avg_spread_favorite
FROM {{ ref('cleaned_games') }}
WHERE schedule_playoff = FALSE
GROUP BY schedule_season
ORDER BY schedule_season
