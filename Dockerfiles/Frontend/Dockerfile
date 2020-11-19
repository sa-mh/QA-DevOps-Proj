FROM ubuntu:18.04
RUN apt-get update -y
WORKDIR /flaskApp
ADD . /flaskApp
RUN apt-get install -y python3-pip
RUN pip3 install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python3", "app.py"]