# Base image
#============
FROM renovate/buildpack:4

# renovate: datasource=docker versioning=docker
RUN install-tool node 12.19.1

RUN install-apt build-essential python3

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.13

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
