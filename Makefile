all:
	mkdir -p /home/akurz/data/mariadb
	mkdir -p /home/akurz/data/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml up

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf /home/akurz/data

re: fclean all

nginx:
	sudo docker-compose -f ./srcs/docker-compose.yml build nginx

wordpress:
	sudo docker-compose -f ./srcs/docker-compose.yml build wordpress

mariadb:
	sudo docker-compose -f ./srcs/docker-compose.yml build mariadb

delete:
	sudo docker container prune -f
	sudo docker rmi $$(sudo docker images -q)

show:
	sudo docker container ls -a
	sudo docker image ls -a