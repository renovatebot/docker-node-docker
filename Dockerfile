FROM renovate/node@sha256:665f3ca0226c707eab7c5f2ab074bb61e767547e7bb859733dde4f72251a87b3

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

RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

ENV PATH="/home/ubuntu/.yarn/bin:/home/ubuntu/.config/yarn/global/node_modules/.bin:$PATH"

RUN chown -R ubuntu:root /home/ubuntu

USER ubuntu
