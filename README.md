# 🏈 NFL Betting Analytics Pipeline: S3 → Snowflake → dbt → Dashboard
## This project showcases a data engineering pipeline built to process and analyze NFL betting data. It demonstrates how to ingest data from Amazon S3, stage and transform it in Snowflake, model it using dbt, and visualize it with a Snowflake dashboard hosted inside Snowflake.
📌 Project Overview
Key Technologies Used:

Amazon S3 – Data storage layer  
Snowflake – Cloud data warehouse for staging and querying  
dbt (Data Build Tool) – SQL-based transformation and modeling  
Dashboard in Snowflake – Native dashboarding interface for interactive data visualization  


📁 Project Structure
nfl_project/  
├── models/  
│   ├── cleaned_games.sql  
│   ├── averaged_lines_regular.sql  
│   ├── averaged_lines_playoffs.sql  
│   ├── schema.yml  
├── dbt_project.yml  
├── profiles.yml (local)  
└── README.md  

🔄 End-to-End Workflow  
1. 🗃️ Data Source: Amazon S3  
Two CSV files were stored in an S3 bucket:  
spreadspoke_scores.csv – historical NFL game results with betting data  
nfl_teams.csv – team metadata including conference info  

Each file was accessed using Snowflake external stages and AWS credentials.  
🔐 IAM policies were configured to allow Snowflake access to the S3 bucket, granting necessary s3:GetObject and s3:ListBucket permissions.

2. 🏗️ Data Warehouse: Snowflake
Using SQL in Snowflake:  

- Created a Snowflake database and schema  
- Created two external stages to read the S3 files  
- Created tables from CSV schemas  
- Used COPY INTO to load raw data into Snowflake tables  

Tables created:  
- spreadspoke_scores  
- nfl_teams  

3. 🧠 Transformations: dbt  

Steps:  
- Created dbt_project.yml and profiles.yml
- Loaded raw tables into dbt as sources
- Created three dbt models:  
- cleaned_games – cleaned, filtered game results with team info  
- averaged_lines_regular – grouped and averaged betting metrics by season for regular season games
- averaged_lines_playoffs - grouped and averaged betting metrics by season for playoff games  
Materialized these models as views in Snowflake

Example transformation logic:  
```
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
```  
4. 📊 Visualization: [Dashboard in Snowflake](https://app.snowflake.com/etevmba/cb78544/#/nfl-betting-dashboard-dTwv50f1) 
A simple dashboard was built inside Snowflake to explore the transformed data interactively.  

Features:  
- Year over year line charts showing season-level averages of closing spreads for regular season and playoff games  
- Scorecards with averaged spreads across full timeframe
