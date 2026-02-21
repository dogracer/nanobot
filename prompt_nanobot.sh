#!/bin/bash

# the docker compose way of running doesn't allow for running in sandboxed network
# docker compose run --rm nanobot-cli agent -m $1

docker run -v ~/.nanobot:/root/.nanobot --rm nanobot agent -m $1

