ALL='docker ps -ap'


network:
	docker network create --subnet=172.0.0.0/24 minibanknet
	
sqlserver:
	docker run -d --net minibanknet --ip 172.0.0.5 mysql:latest 

minibankapp:
	docker run -p 80:8080 -d --net minibanknet minibank

clean:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)
	# docker container prune
	docker network prune


run: network sqlserver minibankapp
