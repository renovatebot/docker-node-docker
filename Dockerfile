# Base image
#============
FROM renovate/buildpack:5@sha256:c08da7660715a53d15c18d0ebb62f13eb5b2d0204610f17163e8efb193c91f65

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 14.16.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.2

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
