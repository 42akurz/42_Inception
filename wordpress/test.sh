#!/bin/bash

# kill and remove previous container
sudo docker kill wp_cnt
sudo docker container rm -f wp_cnt

# remove previous image
sudo docker image rm -f wp_img

# build new image
sudo docker build -t wp_img .

# run new image detached and give it a name
sudo docker run -t --name wp_cnt wp_img