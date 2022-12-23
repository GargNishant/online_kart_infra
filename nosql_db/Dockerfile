FROM mongo:6.0.3-focal
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD="as78KLM&*^2345"
ENV MONGO_INITDB_DATABASE=online_kart
COPY init.js ./docker-entrypoint-initdb.d/

# docker build -t mongo_db_image .
# docker run -d -p 27017:27017 --name mongo_db_container mongo_db_image