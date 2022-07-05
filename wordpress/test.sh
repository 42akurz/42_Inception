#!/bin/bash

# sudo docker build -t wp_img .
# sudo docker rmi wp_cnt
# sudo docker run -t -d --name wp_cnt wp_img

sudo docker build -t wp_img .
sudo docker container rm wp_cnt
sudo docker run -t -d --name wp_cnt wp_img