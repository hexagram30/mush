FROM postgres:12.4

RUN apt-get update -y && apt-get install postgresql-12-wal2json
COPY hxgm30-mush.conf /etc/postgresql/postgresql.conf
RUN chown postgres /etc/postgresql/postgresql.conf
