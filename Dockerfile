# Base image
#============
FROM renovate/buildpack:4@sha256:97936e9f9708d6de85e666095f04a13f6c9f8fc717e861ecd494d2c2b7353354

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
