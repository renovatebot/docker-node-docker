FROM renovate/node@sha256:8030bbd3088b72e7a3388ada3815e37f4d29deb5b21a22dae18e252e30e1c2bf

USER root

# Docker

RUN groupadd -g 999 docker
RUN usermod -aG docker ubuntu

ENV DOCKER_VERSION=18.09.8

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 \
  -C /usr/local/bin docker/docker \
  && rm docker-${DOCKER_VERSION}.tgz

# Python

RUN apt-get update && apt-get install -y python-minimal build-essential && apt-get clean

# npm

ENV NPM_VERSION=6.13.7

RUN npm install -g npm@$NPM_VERSION

# Yarn

ENV YARN_VERSION=1.22.0

RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

ENV PATH="/home/ubuntu/.yarn/bin:/home/ubuntu/.config/yarn/global/node_modules/.bin:$PATH"

RUN chown -R ubuntu:root /home/ubuntu

USER ubuntu
