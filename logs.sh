log_directory="/home-ec2-user/logs"

# Number of days
days=7

# Delete .log files older than the specified number of days
find "$log_directory" -name "*.log" -type f -mtime +$days -delete