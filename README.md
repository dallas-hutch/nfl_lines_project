
https://app.snowflake.com/etevmba/cb78544/#/nfl-betting-dashboard-dTwv50f1
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
│   ├── season_averages.sql  
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
- Created two dbt models:  
- cleaned_games – cleaned, filtered game results with team info  
- averaged_lines_regular – grouped and averaged betting metrics by season for regular season games
- averaged_lines_playoffs - grouped and averaged betting metrics by season for playoff games  
Materialized these models as views in Snowflake
