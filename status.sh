#!/bin/bash

# the docker compose way doesn't work for sandboxed network config
# docker compose logs -f nanobot-gateway

docker run -v ~/.nanobot:/root/.nanobot --rm nanobot status

