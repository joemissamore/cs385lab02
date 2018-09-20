.PHONY: mysql minibank 

network:
	docker network create --subnet=172.0.0.0/24 minibanknet

mysql:
	docker build -t mysql:latest ./mysql/.
	docker run -d --net minibanknet --ip 172.0.0.5 mysql:latest 

minibank:
	docker build -t minibank:latest ./minibank/.
	docker run -p 80:8080 -d --net minibanknet minibank:latest



clean:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)
	# docker container prune
	docker network prune


run: network mysql minibank
