# node-fontnik-docker-runner

Docker environment & scripts to execute [node-fontnik](https://github.com/mapbox/node-fontnik) v0.6.0.

## Usage

Build docker container.

```
$ ./build.sh
```

Place your ttf fonts.

```
$ mkdir data
$ cp <font>.ttf data/<font>.ttf
```

Run docker container to generate `data/<font>/*.pbf` files.

```
$ ./run.sh
```
