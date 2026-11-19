FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/mysql/*

COPY conf/99-inception.cnf /etc/mysql/mariadb.conf.d/99-inception.cnf

COPY tools/mariadb-entrypoint.sh /usr/local/bin/mariadb-entrypoint.sh

RUN chmod +x /usr/local/bin/mariadb-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/mariadb-entrypoint.sh" ] 
