# Node File Uploads Server - Docker Container

This is a Docker setup for my [Node File Uploads Server](https://github.com/davwheat/node-js-file-uploads-server).

## Setup

1. Clone this repository
2. Edit the `env.jsonc` as needed
3. `docker-compose up -d`
4. Server should be accessible on port 4749

## Introduction

Docker will automatically clone the latest version of the uploads server, and install dependencies with Yarn.

The `uploads` folder will be added as a Docker volume and mounted within the container at `/uploads`.

The `env.jsonc` and will be copied to the container automatically as well.

## Editing configuration

When you edit your server configuration, you need to restart the Docker container for the changes to take effect.

A simple `docker-compose up -d` should recreate the container and update the config used for it internally. If it doesn't, check out the [updating documentation](#updating-the-server)

## Updating the server

The uploads server should automatically update when restarted, due to the [custom entrypoint file](docker-entrypoint.sh) used for the container.

If it doesn't, you can force a rebuild and update with the `restart-uncached.sh` script in the repo root.

## FAQs

### Using another port

The default port of `4749` has no significance and can be easily changed.

**Do not edit the port in the `env.jsonc`!** Instead, change the port in the `docker-compose.yml`.
