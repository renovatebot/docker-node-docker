# Base image
#============
FROM ghcr.io/containerbase/buildpack:6.3.2@sha256:f9fe56e4efa9ec2a05f529c1e4bee8a6a066fe791949fb8726be3b90cb53fe1b

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
