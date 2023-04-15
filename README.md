![level](https://img.shields.io/badge/level-beginner-brightgreen?style=flat-square)

![MongoDB Single-node Replica Set Logo Image](./docs/img/logo.png "Docker MongoDB - Single-node Replica Set Logo")

# 🐋 Docker MongoDB - Single-node Replica Set

This is a simplistic project just to show how one can run the MongoDB with Replica Set turned on.
It sounds trivial but many are struggling to do that when running only one instance, usually
during the development process.

## Running examples

💡 [docker-compose.yaml](./docker-compose.yaml) based - this runs the MongoDB using standard `docker-compose` configuration.
  
```bash
docker-compose up -d
```

💡 [Dockerfile](./Dockerfile) based - this runs the MongoDB configured via the [Dockerfile](./Dockerfile).
This is for those who would like to run single-node replica set using plain `docker` instead of `docker-compose`.
The whole configuration / scripts are moved from the [docker-compose.yaml](./docker-compose.yaml) to the [Dockerfile](./Dockerfile).

```bash
docker build . -t mogno-rs0-image
docker run -d mogno-rs0-image
```

## How it works?

When the MongoDB container starts it runs the script [2-init-replica-set.sh](./data/scripts/2-init-replica-set.sh).
The script is responsible for initiating the replica set mode through the execution of the followin command on the mongo instace:

```javascript
rs.initiate()
```

You can read that procedure in the [MongoDB documentation](https://www.mongodb.com/docs/manual/tutorial/convert-standalone-to-replica-set/). However, the procedure is manual. Meaning one have to connect to the `mongod` using `mongosh` tool and execute the `rs.initiate()` manually.

The [2-init-replica-set.sh](./data/scripts/2-init-replica-set.sh) script executes exactly that command
but automatically, during the container initialization phase.

---

👍 Like it\
🌠 Star it\
📥 Take it
