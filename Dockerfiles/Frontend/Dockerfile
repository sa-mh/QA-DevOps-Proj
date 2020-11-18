FROM ubuntu:18.04
ARG TEST_DATABASE_URI
ARG SECRET_KEY
ARG DATABSE_URI
RUN apt-get update -y
WORKDIR /flaskApp
ADD . /flaskApp
RUN apt-get install -y python3-pip
RUN pip3 install -r requirements.txt
RUN python3 app.py
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]