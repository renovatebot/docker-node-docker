# Base image
#============
FROM renovate/buildpack:4@sha256:6fc047a6e19cbc4207a261e91a0fd113e598a20701d096d28ea24365275fbd50

# needed for node-gyp npm install
RUN install-apt build-essential

# renovate: datasource=docker versioning=node
RUN install-tool node 14.16.0

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.1

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.15

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
