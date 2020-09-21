CONTAINER_NAME = hxgm30-postgres
DB_VERSION = 12.4-alpine
DB_NAME = mush
DB_USER = root
DB_PASS = abc123
DATA_DIR = /var/lib/postgresql/data
LOCAL_DATA_DIR = data
run:
	docker run \
	--name $(CONTAINER_NAME) \
	-v `pwd`/$(LOCAL_DATA_DIR):$(DATA_DIR) \
	-p 5432:5432 \
	-e POSTGRES_DB=$(DB_NAME) \
	-e POSTGRES_USER=$(DB_USER) \
	-e POSTGRES_PASSWORD=$(DB_PASS) \
	-d \
	postgres:$(DB_VERSION)

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

delete:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean: delete
	rm -rf $(LOCAL_DATA_DIR)
