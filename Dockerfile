# Base image
#============
FROM ghcr.io/containerbase/base:7.6.0@sha256:c1851c3e4f3d7596f536b3c037c5d62241b4713ce0dfa2b301687ef33e5d7b1b

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 16.20.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
