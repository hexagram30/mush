DOCKER_ORG = hexagram30
DOCKER_PROJ = postgres
DOCKER_TAG = $(DOCKER_ORG)/$(DOCKER_PROJ)
CONTAINER_NAME = hxgm30-postgres
DB_NAME = mush
DB_USER = root
DB_PASS = abc123
DATA_DIR = /var/lib/postgresql/data
LOCAL_DATA_DIR = data

default: run

build:
	docker build -t $(DOCKER_TAG) .

run: build
	docker run \
	-it \
	--name $(CONTAINER_NAME) \
	-v `pwd`/$(LOCAL_DATA_DIR):$(DATA_DIR) \
	-p 5432:5432 \
	-e POSTGRES_DB=$(DB_NAME) \
	-e POSTGRES_USER=$(DB_USER) \
	-e POSTGRES_PASSWORD=$(DB_PASS) \
	$(DOCKER_TAG) \
	-c 'config_file=/etc/postgresql/postgresql.conf'

sh:
	docker exec -it $(CONTAINER_NAME) sh

psql:
	docker exec -it $(CONTAINER_NAME) psql --dbname=$(DB_NAME)

version:
	@docker exec -it $(CONTAINER_NAME) psql \
	--dbname=$(DB_NAME) \
	--command="SELECT version();" | head -3 | tail -1

create-db:
	docker exec -i $(CONTAINER_NAME) createdb $(DB_NAME)

stop:
	docker stop $(CONTAINER_NAME)

clean: stop
	docker rm $(CONTAINER_NAME)

clean-all: clean
	rm -rf $(LOCAL_DATA_DIR)

publish:
	docker push -t $(DOCKER_TAG):latest
