#!/bin/bash

# Can no longer start with docker compose if using the sandboxed network 
# docker compose up -d nanobot-gateway

# PREREQ - make sure this docker command ran to set up the sandboxed network
# which relies on proxmox bridge vmbr1 aka net1, which shows up in ubuntu as ens19
# docker network create -d macvlan \
#  --subnet=10.99.99.0/24 \
#  --gateway=10.99.99.1 \
#  -o parent=ens19 \
#  nanobot-sandbox

# using nanobot-sandbox, the AI can only see the public internet and its own sandbox.
# docker run -d -v ~/.nanobot:/root/.nanobot --network nanobot-sandbox -p 18790:18790 --name nanobot-gateway nanobot gateway

# according to the Google AI, the -p flag is ignored whne connecting to a macvlan setup like this
docker run -d -v ~/.nanobot:/root/.nanobot --restart unless-stopped --network nanobot-sandbox -p 10.99.99.2:18790:18790 --name nanobot-gateway nanobot gateway
