FROM mysql/mysql-server

ENV MYSQL_ROOT_PASSWORD secretadmin

COPY db.sql /docker-entrypoint-initdb.d
