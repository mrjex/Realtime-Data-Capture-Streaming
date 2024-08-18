# Real-Time Data Capture Streaming

> An efficient data pipeline using Postgres, Kafka, Debezium and Control Center

[![Docker](https://img.shields.io/badge/Docker-Containerized-blue)](https://www.docker.com/)
[![Kafka](https://img.shields.io/badge/Kafka-Streaming-red)](https://kafka.apache.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-lightblue)](https://www.postgresql.org/)
[![Debezium](https://img.shields.io/badge/Debezium-CDC-green)](https://debezium.io/)
[![Status](https://img.shields.io/badge/Status-Completed-success)](https://github.com/yourusername/Realtime-Data-Capture-Streaming)

## Table of Contents

- [Real-Time Data Capture Streaming](#real-time-data-capture-streaming)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
    - [Setup and Deployment](#setup-and-deployment)
  - [Demo](#demo)
    - [1. Inserting New Data](#1-inserting-new-data)
    - [2. Updating Existing Records](#2-updating-existing-records)
  - [Database Interaction](#database-interaction)
  - [API Integration](#api-integration)

## Overview

This project implements a real-time data streaming pipeline that captures, processes, and visualizes data changes as they occur, and it was built over an intensive 2-day development sprint in June 2024

The solution integrates multiple technologies:
- **PostgreSQL** for transactional data storage
- **Debezium** for change data capture (CDC)
- **Apache Kafka** for event streaming
- **Docker** for containerization and deployment
- **Control Center** for monitoring and management

![Architecture](readme-material/architecture.PNG)


## Getting Started


### Setup and Deployment

1. **Clone repository**

2. **Enter virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   venv\Scripts\activate     # Windows
   ```

3. **Launch the system**
   ```bash
   docker-compose up -d
   ```

## Demo

### 1. Inserting New Data

Watch how new data instantaneously flows through the system:

![Insert-New-Instance](readme-material/1.%20Insert-New-Instance.mp4)


### 2. Updating Existing Records

Observe changes propagating through the pipeline:

![Change-DB-Instance](readme-material/2.%20Change%20db-instance%20value.mp4)


## Database Interaction

1. **Connect to PostgreSQL container**
   ```bash
   docker exec -it postgres /bin/bash
   ```

2. **Access the PostgreSQL CLI**
   ```bash
   psql -U postgres -d financial_db
   ```

## API Integration

For automated interaction, the system exposes RESTful endpoints:

```bash
curl -H 'Content-Type: application/json' localhost:8083/connectors --data '
{
  "name": "financial_connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "topic.prefix": "cdc",
    "database.user": "postgres",
    "database.dbname": "financial_db",
    "database.hostname": "postgres",
    "database.password": "postgres",
    "plugin.name": "pgoutput"
  }
}'
```
