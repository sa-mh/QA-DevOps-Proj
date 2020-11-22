#!/bin/bash
cd frontend
sudo docker build -t horners/frontend:latest .
cd ../backend
sudo docker build -t horners/backend:latest .