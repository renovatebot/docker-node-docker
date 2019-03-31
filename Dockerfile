FROM renovate/node:10@sha256:ff7a2cd06b3b7e02fd1be02dc3343fb4cf4ff2298ff227c11b1dfc99231c751a

USER root

RUN groupadd -g 999 docker
RUN usermod -aG docker ubuntu

ENV DOCKER_VERSION=18.09.2

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 \
  -C /usr/local/bin docker/docker \
  && rm docker-${DOCKER_VERSION}.tgz

# npm

ENV NPM_VERSION=6.9.0

RUN npm install -g npm@$NPM_VERSION

# Yarn

ENV YARN_VERSION=1.15.2

RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

ENV PATH="/home/ubuntu/.yarn/bin:/home/ubuntu/.config/yarn/global/node_modules/.bin:$PATH"

USER ubuntu
