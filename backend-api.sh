# You can interact with this project in 2 ways:
#   - Frontend: Localhosts
#   - Backend: Issue API calls to the container's apis



# The backend part is done in this script:


###   WORKS!!!   ###

# ATTRIBUTE NOTES:
#   - "name" has to be unique to the aleady existing Postgres-connectors


# SYSTEM NOTES:
#   - All containers must be up and running, start with "docker-compose up -d"

# EXECUTION NOTES:
#   - Before running the commands below, make sure to enter the shell of the 'debezium' container. This can
#     be done in 2 ways:
#       1) UI Approach: Docker Desktop --> Debezium Container --> Exec
#       2) Backed Approach: Run "docker exec -it debezium /bin/bash" in the command line


# TODO: Research postgresSQL 0 Debezium API documentaiton and find the API reqs/responses like the one below


# POST request
curl -H 'Content-Type: application/json' localhost:8083/connectors --data '
{
  "name": "postgres-fin-connector4",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "topic.prefix": "cdc",
    "database.user": "postgres",
    "database.dbname": "financial_db",
    "database.hostname": "postgres",
    "database.password": "postgres",
    "plugin.name": "pgoutput",
    "decimal.handling.mode": "string"
  }
}'



curl -H 'Content-Type: application/json' localhost:8083/connectors --data '
{
  "name": "postgres-new-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "topic.prefix": "cdc",
    "database.user": "postgres",
    "database.dbname": "financial_db",
    "database.hostname": "postgres",
    "database.password": "postgres",
    "plugin.name": "pgoutput",
    "decimal.handling.mode": "string"
  }
}'