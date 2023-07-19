# docker-sourceknight

[![Actions Status](https://github.com/srcdslab/docker-sourceknight/workflows/Release/badge.svg)](https://github.com/srcdslab/docker-sourceknight/actions)

This repository defines the unofficial [sourceknight](https://github.com/tmick0/sourceknight) docker image.

* [python 3.10-slim](python/3.10-slim)

which are published to [ghcr.io](https://github.com/srcdslab/docker-sourceknight/pkgs/container/sourceknight).


__note__ - requires latest docker to be installed and available

## Using Images

### pull docker image

```bash
docker pull ghcr.io/srcdslab/sourceknight:latest
```

### run docker image

```bash
docker run --rm \
	ghcr.io/srcdslab/sourceknight:latest \
	--help
```

### build plugins
```bash
docker run --rm \
	-v $PWD:/app \
	ghcr.io/srcdslab/sourceknight:latest \
	build
```

### building docker image

```bash
export SOURCEKNIGHT_VERSION="0.3.0"
docker build --build-arg SOURCEKNIGHT_VERSION=$SOURCEKNIGHT_VERSION -t sourceknight:$SOURCEKNIGHT_VERSION python/3.10-slim
```
