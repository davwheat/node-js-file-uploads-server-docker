#!/bin/sh

cd /usr/app

if [ -d "./.git" ]; then
  echo "Pulling latest updates"
  git pull
else
  echo "Cloning repo"
  git clone https://github.com/davwheat/node-js-file-uploads-server.git .
fi

# Install dependencies
yarn install

# Link mounted config files
ln -s /auth.json .
ln -s /env.jsonc .

# Start server
if [ "$ENVIRONMENT" == "development" ]; then
  yarn dev
else
  yarn start
fi
