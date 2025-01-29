#!/bin/bash

DATE_STRING=$(date)
echo ${DATE_STRING}
echo "Begin jenkins-rebuild.sh"
FULL_CMD="export GIT_HOME=/home/david/Git && cd /home/david/Git/docker-jenkins && docker compose pull && docker compose up -d --force-recreate && docker system prune -af"

ssh david@optiplex.local.davidhfrankel.com "${FULL_CMD}"
echo "Complete"
