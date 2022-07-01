sudo docker build -t mynginx .
sudo docker container rm test
sudo docker run  --name test -p 443:443 mynginx