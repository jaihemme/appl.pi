FROM python:3-alpine

LABEL org.opencontainers.image.title="Ansible pour installation des raspberries"
LABEL org.opencontainers.image.source="https://github.com/jaihemme/appl.pi"

ARG GIT_VERSION=unknown
ARG GIT_COMMIT=unknown
ARG BUILD_DATE=unknown

# Configure le répertoire d'application
ENV APPL=/appl
ENV HOME=/home/tools

LABEL org.opencontainers.image.version="${GIT_VERSION}"
LABEL org.opencontainers.image.revision="${GIT_COMMIT}"
LABEL org.opencontainers.image.created="${BUILD_DATE}"

# Installer bash + dépendances
RUN apk add --no-cache \
    bash openssh-client \
    && rm -rf /var/cache/apk/*

RUN addgroup -g 1001 tools && \
    adduser -D -G tools -u 1001 tools --home $HOME && \
    mkdir -p $APPL && \
    chown -R tools:tools $APPL

RUN pip install ansible

# localtime est une copie de /usr/share/zoneinfo/Europe/Zurich
COPY localtime /etc/

# COPY --chown=tools:tools ...
# RUN chmod +x ...

# user environment
COPY --chown=tools:tools --chmod=640 files_home/ $HOME

WORKDIR $APPL
USER tools

ENTRYPOINT ["/bin/bash"]
