#!/bin/bash

docker pull horners/frontend:latest
docker pull horners/backend:latest

mysql -h ${DB_END} -P 3306 -u ${DB_USER} -p${DB_PASS} < database/Create.sql
mysql -h ${TDB_END} -P 3306 -u ${DB_USER} -p${DB_PASS} < database/Create.sql

docker-compose up -d
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
docker-compose down

docker rmi horners/frontend
docker rmi horners/backend

