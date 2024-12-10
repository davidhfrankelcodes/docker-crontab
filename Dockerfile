FROM alpine:latest

# Leave this blank. `nano` is default in `docker-compose.yaml`
ENV EDITOR=

# Install necessary packages
RUN apk add --no-cache \
    bash \
    docker-cli \
    nano

# Copy apk-requirements.txt and install packages listed in it
COPY apk-requirements.txt /tmp/apk-requirements.txt
RUN sed -i '/^#/d' /tmp/apk-requirements.txt
RUN apk update && xargs -a /tmp/apk-requirements.txt apk add --no-cache

# Add custom scripts
COPY scripts/ /scripts
RUN chmod +x /scripts/*

# Ensure the crontabs directory exists
RUN mkdir -p /etc/crontabs

# Copy the host crontab file to a temporary location
COPY crontab /tmp/crontab

# Entry point script to set correct permissions and start crond
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]
