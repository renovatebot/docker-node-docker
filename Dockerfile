# Base image
#============
FROM ghcr.io/containerbase/buildpack:6.1.2@sha256:e6d1b05ed124560a1b9b4b2b6d0beb0734c1e8908b19eb7b54d0bcf44e607c19

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 16.19.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
