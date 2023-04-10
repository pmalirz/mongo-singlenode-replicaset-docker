FROM mongo:6.0.5

ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=root
ENV MONGO_INITDB_DATABASE=vshop

COPY ./data/replica.key /data/replica.key.dev
COPY ./data/scripts /docker-entrypoint-initdb.d

RUN cp /data/replica.key.dev /data/replica.key
RUN chmod 400 /data/replica.key
RUN chown 999:999 /data/replica.key

EXPOSE 27017

CMD ["--replSet", "rs0", "--keyFile", "/data/replica.key", "--bind_ip_all", "--auth"]