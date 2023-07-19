# syntax = docker/dockerfile:1.4
FROM python:3.10-slim as root

ARG SOURCEKNIGHT_VERSION

RUN apt update && apt install git jq -y --no-install-recommends

RUN pip install git+https://github.com/maxime1907/sourceknight@fixrequirements yq

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--help"]

FROM root as rootless
RUN groupadd -g 1000 rootless && \
    useradd -r -u 1000 -g rootless rootless

RUN mkdir -p /app && chown 1000:1000 /app

USER 1000

WORKDIR /app
