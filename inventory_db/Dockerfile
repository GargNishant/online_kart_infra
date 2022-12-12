FROM postgres:15.1-alpine
ENV POSTGRES_USER="admin"
ENV POSTGRES_PASSWORD="1^&sdfoij&^%4546"
ENV POSTGRES_DB=online_kart
COPY init.sql /docker-entrypoint-initdb.d/

# docker build -t inventory_db_image .
# docker run -d --name inventory_db_container -p 5432:5432 inventory_db_image
