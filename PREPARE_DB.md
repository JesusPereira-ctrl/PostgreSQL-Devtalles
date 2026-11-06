# Instructions for DB Local with Docker

## Run Docker Compose

- Run `docker compose up -d`

## Connect in PgAdmin

- Connect with PgAdmin in `http://localhost:8080`

- Credentials PgAdmin
  - email: alumno@google.com
  - password: 123456

- add server

- Credentials Server
  - local address: my-database
  - maintenance Db: course-db
  - password: 123456

## Restart Docker Compose

- Run `docker compose down`
- delete folder `pgadmin` and `postgres`
- Run `docker compose up -d`

## Shutdown Docker Compose

- Run `docker compose down`

## Connect with GUI of database

- host: localhost
- port: 5432
- username: alumno
- password: 123456
- db: course-db
