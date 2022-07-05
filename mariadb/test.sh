#!/bin/bash

sudo docker build -t mymariadb .
sudo docker container rm mdb
# sudo docker run --name mdb mymariadb
sudo docker run -t -d --name mdb mymariadb