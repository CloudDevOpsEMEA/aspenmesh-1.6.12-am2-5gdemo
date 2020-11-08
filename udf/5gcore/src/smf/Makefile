VER=v1.0.1

all: build
build:
	docker build -t mangarcg/smf:${VER} .
	docker push mangarcg/smf:${VER}
run:
	docker stop smf; docker rm smf; docker run -d --restart=always --name smf --hostname smf -p 2000:2000 mangarcg/smf:${VER}

clean:
	docker stop `docker  ps -aq`
	docker rm `docker  ps -aq`
	docker image rm `docker image ls -qa`
	npm install
install:
	rm -rf node_modules
	npm install
