# Base image
#============
FROM renovate/buildpack:4

# renovate: datasource=docker versioning=docker
RUN install-tool node 14.15.5

# renovate: datasource=github-tags lookupName=renovatebot/python
RUN install-tool python 3.9.1

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.13

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
