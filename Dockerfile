FROM node:16-alpine

WORKDIR /usr/app

# Install git, nano
RUN apk add --no-cache git nano

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# CMD ["sleep", "infinity"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
