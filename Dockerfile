# Base image
#============
FROM renovate/buildpack:4@sha256:311ab6e3d11a1589b31b436f3f67267a2c5ea430d06390413f4682a6a9816112

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
