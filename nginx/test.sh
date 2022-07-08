#!/bin/bash

# kill and remove previous container
sudo docker kill nginx_cnt
sudo docker container rm -f nginx_cnt

# remove previous image
sudo docker image rm -f nginx_img

# build new image
sudo docker build -t nginx_img .

# run new image detached and give it a name
sudo docker run -t --name nginx_cnt -p 443:443 nginx_img