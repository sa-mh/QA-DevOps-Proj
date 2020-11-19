#!/bin/bash
docker pull horners/frontend:latest
docker pull horners/backend:latest

mysql -h endpoint -P 3306 -u root -p password < database/Create.sql
mysql -h endpoint -P 3306 -u root -p password < database/Create.sql

docker compose up -d
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
docker-compose down