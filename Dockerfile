# Base image
#============
FROM renovate/buildpack:2@sha256:386149aa474a6e0df1f1cea77377a9230d80bb531fced10032acbe3859fe9edd

# renovate: datasource=docker versioning=docker
RUN install-tool node 12.19.1

# renovate: datasource=npm versioning=npm
RUN install-tool yarn 1.22.10

# renovate: datasource=docker versioning=docker
RUN install-tool docker 19.03.13

# Numeric user ID for the ubuntu user. Used to indicate a non-root user to OpenShift
USER 1000
