#!/bin/bash
cd cne-sfia2-brief/frontend
docker build -t horners/frontend:latest .
docker push horners/frontend:latest
cd ../backend
docker build -t horners/backend:latest .
docker push horners/backend:latest