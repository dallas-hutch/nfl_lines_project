# NFL Betting Lines Regular Season vs. Playoffs since 1979

https://app.snowflake.com/etevmba/cb78544/#/nfl-betting-dashboard-dTwv50f1
# 🏈 NFL Betting Analytics Pipeline: S3 → Snowflake → dbt → Dashboard
## This project showcases a complete data engineering pipeline built to process and analyze NFL betting data. It demonstrates how to ingest data from Amazon S3, stage and transform it in Snowflake, model it using dbt, and visualize it with a Snowflake dashboard hosted inside Snowflake.
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
