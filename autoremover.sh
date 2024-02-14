#!/bin/bash

# This is to help cleaning up older files in the uploads directory, run this e.g. in cron

# Define the target directory for uploads
TARGET_DIR="/path/to/your/folder"

# Find and delete files older than 7 days exclude the  .gitignore
find "$TARGET_DIR" -type f -mtime +7 ! -name '.gitignore' -exec rm -f {} +

