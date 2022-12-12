FROM postgres:15.1-alpine
ENV POSTGRES_USER="admin"
ENV POSTGRES_PASSWORD="546*&LKMllaw432&^"
ENV POSTGRES_DB=online_kart
COPY init.sql /docker-entrypoint-initdb.d/

# docker build -t customer_db_image .
# docker run -d --name customer_db_container -p 5432:5432 customer_db_image
