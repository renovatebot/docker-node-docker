# Base image
#============
FROM renovate/buildpack:2@sha256:c431f9429c2f442cf9ad1de3c0d8ba07098f30f40b14bb6a572d4382bdf8292f

# renovate: datasource=docker versioning=docker
RUN install-tool node 12.19.1

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.13

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
