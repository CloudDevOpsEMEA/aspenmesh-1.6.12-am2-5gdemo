VER=v1.0.1

all: build
build:
	docker build -t mangarcg/amf:${VER} .
	docker push mangarcg/amf:${VER}
run:
	docker stop amf; docker rm amf; docker run -d --restart=always --name amf --hostname amf -p 2000:2000 mangarcg/amf:${VER}

clean:
	docker stop `docker  ps -aq`
	docker rm `docker  ps -aq`
	docker image rm `docker image ls -qa`
	npm install
install:
	rm -rf node_modules
	npm install