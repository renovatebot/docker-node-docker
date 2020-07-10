FROM renovate/node@sha256:4d07f7b5ba49a1905dc5f822fad5c77b4eef675f4328110aa9f1cf8f91d32f1e

USER root

# Docker

RUN groupadd -g 999 docker
RUN usermod -aG docker ubuntu

ENV DOCKER_VERSION=18.09.8

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 \
  -C /usr/local/bin docker/docker \
  && rm docker-${DOCKER_VERSION}.tgz

# Python 3 and make are required to build node-re2
RUN apt-get update && apt-get install -y python3-minimal build-essential
# force python3 for node-gyp
RUN rm -rf /usr/bin/python && ln /usr/bin/python3 /usr/bin/python

# npm

ENV NPM_VERSION=6.13.7

RUN npm install -g npm@$NPM_VERSION

# Yarn

ENV YARN_VERSION=1.22.0

RUN npm install -g yarn@$YARN_VERSION

ENV PATH="/home/ubuntu/.yarn/bin:/home/ubuntu/.config/yarn/global/node_modules/.bin:$PATH"

RUN chown -R ubuntu:root /home/ubuntu

# Zombie killer: https://github.com/Yelp/dumb-init#readme
RUN apt-get update && \
  apt-get install -y dumb-init && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

USER ubuntu
