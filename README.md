# Node File Uploads Server - Docker Container

This is a Docker setup for my [Node File Uploads Server](https://github.com/davwheat/node-js-file-uploads-server).

## Setup

1. Clone this repository
2. Edit the `env.jsonc` as needed
3. `docker-compose up -d`
4. Server should be accessible on port 4749

## Introduction

This container takes away almost all the effort required to deploy this uploads server to a device. I personally use this container on my Raspberry Pi.

When starting the container, Docker will automatically pull the lastest Node 16 Docker image to use, as well as cloning the most up-to-date version of the uploads server. Subsequent runs will only call `git pull` instead of performing a full clone. Dependencies are automatically installed using Yarn within the container.

The `uploads` folder in this directory will be added as a Docker volume and mounted within the container at `/usr/uploads`. Compared to a normal hosting setup, this reduces the risks (but does not eliminate) of access to files outside the uploads folder.

The `env.jsonc` and `auth.json` are linked to the container bi-directionally, meaning that changes to these files will be synced between the host system and the container. Note that modifying the `env.jsonc` **does** require a restart of the container (`docker-compose restart`) due to caching.

## Editing configuration

When you edit your server configuration, you need to restart the Docker container for the changes to take effect.

A simple `docker-compose restart` should recreate the container if it's already running.

## Updating the server

The uploads server should automatically update when restarted, due to the [custom entrypoint file](docker-entrypoint.sh) used for the container.

If it doesn't, you can force a rebuild and update with the `restart-uncached.sh` script in the repo root.

## FAQs

### Using another port

The default port of `4749` has no significance and can be easily changed.

**Do not edit the port in the `env.jsonc`!** Instead, change the port in the `docker-compose.yml`.
