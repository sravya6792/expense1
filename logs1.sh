#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/home/ec2-user/logs"   # Change to your source directory
DEST_DIR="/mnt/backup/documents"    # Change to your destination directory
LOG_FILE="/var/log/backup.log"      # Path to the log file

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Get current date and time for backup filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
BACKUP_FILE="$DEST_DIR/$BACKUP_NAME"

# Start logging
echo "Backup started at $(date)" >> "$LOG_FILE"

# Perform the backup
if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
    echo "Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "Backup failed" >> "$LOG_FILE"
fi

# End logging
echo "Backup finished at $(date)" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"
