log_directory="/home/ec2-user/logs"

# Number of days
days=7

# Delete .log files older than the specified number of days
find "$log_directory" -name "*.log" -type f -mtime +$days -delete




#!/bin/bash

# Define the path to the log files
log_directory="/home/ec2-user/logs"

# List log files and prompt for confirmation before deletion
echo "The following log files will be deleted:"
ls "$log_directory"/*.log
read -p "Are you sure you want to delete these files? (y/n): " confirm

if [ "$confirm" = "y" ]; then
  rm "$log_directory"/*.log
  echo "Log files deleted."
else
  echo "Operation canceled."
fi
