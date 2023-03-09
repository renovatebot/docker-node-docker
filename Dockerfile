# Base image
#============
FROM ghcr.io/containerbase/buildpack:6.3.7@sha256:6e93c9ab5d9c0f11688f1eedec8eed37afc4681cd243a857a53e8701bc7f6485

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 16.19.1

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
