# Base image
#============
FROM renovate/buildpack:6@sha256:5c288f957d5141042941d261e727fd9fdb7e2d42c44ab78f2ceee3e030a0bbf8

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 14.19.3

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
