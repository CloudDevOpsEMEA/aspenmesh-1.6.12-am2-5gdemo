VER=v1.0.1

all: build
build:
	docker build -t mangarcg/ausf:${VER} .
	docker push mangarcg/ausf:${VER}
run:
	docker stop ausf; docker rm ausf; docker run -d --restart=always --name ausf --hostname ausf -p 2000:80 mangarcg/ausf:${VER}

clean:
	docker stop `docker  ps -aq`
	docker rm `docker  ps -aq`
	docker image rm `docker image ls -qa`
	npm install
install:
	rm -rf node_modules
	npm install