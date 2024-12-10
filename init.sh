#!/bin/bash

set -e

# Create an empty crontab file if it doesn't exist
touch crontab

# Where your scripts go
mkdir -p scripts

# Where your logs go
mkdir -p logs

# apk package list to install at container creation
touch apk-requirements.txt

# If using SSH
mkdir -p .ssh
