#!/bin/sh

# This is the sample script.

# The /logs directory is bound to <project root>/logs
mkdir -p /logs/test
LOG_FILE=/logs/test/test.log
touch ${LOG_FILE}

# Print a command to the log file
echo "$(date '+%Y-%m-%d %H:%M:%S') -- This is a test." >> ${LOG_FILE}

# You can use the docker command
echo "$(docker ps)" >> ${LOG_FILE}
