image_name='api'

all: dev
	sudo docker run -p 3000:3000 -it $(image_name)

dev: cleanContainer
	sudo docker build -t $(image_name) .

cleanContainer:
	sudo docker container prune -f
