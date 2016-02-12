FROM ubuntu:14.04

MAINTAINER d-abe <abe@flup.jp>

RUN apt-get update && \
    apt-get install -y -q postgresql-9.3 libpq-dev postgresql-client-9.3 postgresql-contrib-9.3 && \
    rm -rf /var/lib/apt/lists/*

USER postgres
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    psql --command "CREATE DATABASE docker WITH OWNER docker TEMPLATE template0 ENCODING 'UTF8';" &&\
    echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf &&\
    echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]