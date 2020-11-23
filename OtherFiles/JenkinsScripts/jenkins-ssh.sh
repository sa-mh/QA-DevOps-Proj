#!/bin/bash

ssh -i /home/jenkins/.ssh/id_rsa ubuntu@3.249.1.144 << EOF
git clone https://github.com/sa-mh/Project-Flask-App
cp run-tests.sh Project-Flask-App
cp docker-compose.yaml Project-Flask-App
cd Project-Flask-App
cd frontend
sudo docker login -u horners -p ProjectPassword
sudo docker build -t horners/frontend:latest .
cd ../backend
sudo docker build -t horners/backend:latest .
cd ..
sudo docker push horners/backend:latest
sudo docker push horners/frontend:latest
ls
bash run-tests.sh
cd ..
sudo rm -r Project-Flask-App
EOF