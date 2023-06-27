# Base image
#============
FROM ghcr.io/containerbase/base:9.0.6@sha256:e7829f6069ff91fb1ae3d7094bd1b4b1aa333edd5e368532e76ed5e29b071a9f

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 18.16.1

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
