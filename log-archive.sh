#!/bin/bash

if [ -z "$1" ] || [ ! -d "$1" ]; then
	echo "Error: Directory not exist or you did not enter the directory!"
	echo "Correct way: $0 <Compress-Directory>"
	exit 1
fi 

TARGET_DIR="$1"

ARCHIVE_STORE="archived_logs"
mkdir -p "$ARCHIVE_STORE"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

echo "Starting to archive directory: $TARGET_DIR..."
echo "Saving to: $ARCHIVE_STORE/$ARCHIVE_NAME"
echo "-------------------------------------------------"

tar -czvf "$ARCHIVE_STORE/$ARCHIVE_NAME" "$TARGET_DIR"

echo "-------------------------------------------------"
echo "SUCCESS: Archive created successfully!"

echo "[$(date)] Archived $TARGET_DIR to $ARCHIVE_STORE/$ARCHIVE_NAME" >> "$ARCHIVE_STORE/archive_log.log"
