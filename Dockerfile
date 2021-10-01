# Base image
#============
FROM renovate/buildpack:5@sha256:4f0d2d1489f5f46bc1eaa662935af526e028e9498eb57735938102683c21c811

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 14.18.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.11

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
