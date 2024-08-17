# Real-Time Data Capture Streaming

This project is concerned with real-time data streaming using a powerful tech stack, integrating Docker, Postgres, Debezium, Kafka and Control Center. Through this combination an efficient and responsive data pipeline is achieved, that has the capacity of managing large volumes of data.

![Architecture](readme-material/architecture.PNG)


I worked on this project from 16th to 17th June 2024 and treated this as a mini project that would satisfy two things:
1. Learn:
    - Get practical hands-on experience with SQL + Kafka + Zookeeper

2. Demonstrate my abilities:
    - Implement SQL functionality (due to my previously attended course about theoretical data management)
    - Familiarize myself with new software engineering concepts and bring working code implementations within the span of a couple of days


This project could be done within 2 days by virtue of the following reasons:
1. Previous knowledge & understanding:
    - [Data Management](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/1.%20courses/year-1/6.%20Data%20Management?ref_type=heads) --> SQL, Data entity relationships
    - [Web Development](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/1.%20courses/year-2/1.%20Web%20Development?ref_type=heads) --> Localhost debugging, APIs, Backend & Frontend
    - [Cyber Physical Systems of Systems](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/1.%20courses/year-2/7.%20Cyber%20Physical%20Systems%20and%20Sytems%20of%20Systems?ref_type=heads) --> Docker, Linux, Shell scripts

2. Problem Solving on the go:
    - "Breadth-First-Search" researching is a term I use to describe an approach to actively pursuing knowledge about "unknown unknowns". I adapted it during the [Distributed Systems](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/1.%20courses/year-2/3.%20Distributed%20Systems?ref_type=heads) course, as my ambition of integrating an additional responsive server to my microservice [Clinic Service](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/1.%20courses/year-2/3.%20Distributed%20Systems/dentanoid-project/3.%20services/clinic-service?ref_type=heads) turned out to be a more complex solution than I thought. Or at least, I was operating on uncharted territory of knowledge in the sense that my mind lacked the context of the possibility of combining a Nodejs client with GoogleAPI and shell scripts. It took me some time to figure out this combination. What naturally happened when I entered this vast problem space was that I started researching solution after solution by browsing 10+ tabs in a fast yet brief overlooking way without going to deep on the content. I applied the same principle of researching to attain new knowledge in a fast-paced intense environment in this project, the only difference being the technologies to utilize. This time, I was dealing with Kafka + Postgres + Debezium as the unfamiliar combination in the context of my programming experience. In case you are curious about my other projects where I appled this speed-learning technique, checkout the links below:
        - [Product Demand Prediction](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/2.%20spare-time/3.%20Product-Demand-Prediction?ref_type=heads)
        - [Global City Streaming](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/2.%20spare-time/6.%20City%20Streaming%20Project?ref_type=heads)
        - [Kubernetes Learning](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/2.%20spare-time/7.%20Kubernetes%20Learning?ref_type=heads)
        - [Sagemaker AWS Prediction](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/2.%20spare-time/8.%20Sagemaker%20AWS%20Prediction?ref_type=heads)
        - [Tableau Visualization](https://gitlab.com/jex-projects/mrjex/-/tree/main/projects/2.%20spare-time/9.%20Tableau-Visualization?ref_type=heads)

3. Youtube Tutorials, Stack Overflow & Github repositories
    - There has never been as many humans in the world, all of who are continiously acquiring knowledge. Inevitably, using other individuals' published resources is deemed as a way of working with leverage to optimize the efficiency of learning


## Run

**1. Insert New Instance:**

![Insert-New-Instance](readme-material/1. Insert-New-Instance.mp4)


**2. Change DB-Instance value:**

![Change-DB-Instance](readme-material/2. Change db-instance value.mp4)


1. Enter venv environment

2. docker-compose up -d



## Interact


1. Start the project (replicate the steps in ##Run)

2. Enter 'postgres' container shell

```

docker exec -it postgres /bin/bash

```


3. Enter the PostgreSQL database environment

```

psql -U postgres -d {MY_DB_NAME}

```

If you want to interact with the existing database that I used for this project:


```

psql -U postgres -d financial_db

```


### Interactive commands


#### Check all instances

```

select * from transactions;

```


#### Set an instance

```

update transactions set amount = 1000 where transaction_id = 'MY_DB_INSTANCE_ID_HERE';

```


#### Update an instance
update transactions set amount = amount + 100 where transaction_id = 'MY_DB_INSTANCE_ID_HERE';




## Backend API Interactions

As you've already seen, launching the docker-compose yields 2 interactive UI clients through your localhost. However, if you want to automate the process or replace the act of pressing visual buttons with CLI commands, then this section is for you.



### POST request

```
curl -H 'Content-Type: application/json' localhost:8083/connectors --data '
{
  "name": "NEW_POSTGRESS_CONNECTOR_NAME_HERE",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "topic.prefix": "cdc",
    "database.user": "POSTGRES_USERNAME_HERE",
    "database.dbname": "DATABASE_NAME_HERE",
    "database.hostname": "DATABASE_HOST_NAME_HERE",
    "database.password": "DATABASE_PASSWORD_HERE",
    "plugin.name": "pgoutput"
  }
}'
```
