#!/bin/bash

docker pull horners/frontend:latest
docker pull horners/backend:latest

mysql -h terraform-20201121232139161400000002.cml50gxwj1hn.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppassword < database/Create.sql
mysql -h terraform-20201121232139163200000003.cml50gxwj1hn.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppassword < database/Create.sql

docker-compose up -d
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
docker-compose down

docker rmi horners/frontend
docker rmi horners/backend

