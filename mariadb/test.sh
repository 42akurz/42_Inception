#!/bin/bash

# kill and remove previous container
sudo docker kill mdb_cnt
sudo docker container rm -f mdb_cnt

# remove previous image
sudo docker image rm -f mdb_img

# build new image
sudo docker build -t mdb_img .

# run new image detached and give it a name
sudo docker run -t --name mdb_cnt mdb_img