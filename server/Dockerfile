FROM node:18-bookworm

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN npm ci

RUN chmod u+x src/scripts/*.sh

# MariaDB Client needed for check if db has to be initialized. see scripts/try-init-db.sh
RUN apt-get update && apt-get install -y mariadb-client

ENTRYPOINT ["src/scripts/docker-start-web.sh"]