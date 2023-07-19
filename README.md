# docker-sourceknight

This repository defines the unofficial [sourceknight](https://github.com/tmick0/sourceknight) docker image.

* [python 3.10-slim](python/3.10-slim)

which are published to [ghcr.io](https://github.com/srcdslab/docker-sourceknight/pkgs/container/docker-sourceknight).


__note__ - requires latest docker to be installed and available

## Using Images

We have two versions of the sourceknight image:
- `root` mainly used for github actions
- `rootless` mainly used to compile locally

### pull docker image

```bash
docker pull ghcr.io/srcdslab/docker-sourceknight:0.3.0-rootless
```

### run docker image

```bash
docker run --rm \
	ghcr.io/srcdslab/docker-sourceknight:0.3.0-rootless \
	--help
```

### build plugins
```bash
docker run --rm \
	-v $PWD:/app \
	ghcr.io/srcdslab/docker-sourceknight:0.3.0-rootless \
	build
```

### building docker image

```bash
export SOURCEKNIGHT_VERSION="0.3.0"
docker build --build-arg SOURCEKNIGHT_VERSION=$SOURCEKNIGHT_VERSION -t sourceknight:$SOURCEKNIGHT_VERSION python/3.10-slim --target rootless
```
