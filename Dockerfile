# Base image
#============
FROM ghcr.io/containerbase/base:8.0.5@sha256:21e5c15a0764f0692756e7b38c15c00cf9b53f8bbbbe5b8af2ab1674ca88c3f0

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 18.16.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
