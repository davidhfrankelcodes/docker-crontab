#!/bin/sh

# Remove the existing crontab if it exists and is not busy
if [ -f /etc/crontabs/root ]; then
    rm -f /etc/crontabs/root
fi

# Copy the crontab from the temporary location
cp /tmp/crontab /etc/crontabs/root
chown root:root /etc/crontabs/root
chmod 644 /etc/crontabs/root

# Start the cron daemon
exec crond -f -l 2
