# ironic-containerize
Containerize services of ironic

## Build images
``` bash
$ cd ironic-api
$ docker build .
```

## Run containers
``` bash
# API service
$ docker run -it -e "RABBIT_PASS=RABBIT_PASS" -e "RABBIT_SERVER=172.23.59.133" -e "IRONICDB_PASS=IRONIC_DBPASSWORD" -e "MARIADB_SERVER=172.23.59.133" -p 6385:6385 016d31205dd4

# Conductor service, nostalgic_banach is the container id of api serivce container.
$ docker run -it -e "RABBIT_PASS=RABBIT_PASS" -e "RABBIT_SERVER=172.23.59.133" -e "IRONICDB_PASS=IRONIC_DBPASSWORD" -e "MARIADB_SERVER=172.23.59.133" --link nostalgic_banach:ironic-api 72b110017163
```

