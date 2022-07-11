

all:
	sudo docker-compose up

clean:
	sudo docker-compose down

re: clean delete all

stop:
	sudo docker kill $$(sudo docker ps -q)

delete:
	sudo docker container prune -f
	sudo docker rmi $$(sudo docker images -q)

show:
	sudo docker image ls -a
	sudo docker container ls -a