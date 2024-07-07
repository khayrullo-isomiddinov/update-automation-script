# Backup Script

## Overview

`backup.sh` is a simple Bash script for creating compressed backups of files from a source directory to a destination directory. It automates the process of archiving files modified in the last 24 hours and moves the backup to a specified location.

## Features

- **Checks** if source and destination directories exist.
- **Creates** a timestamped `.tar.gz` archive of files modified in the last 24 hours.
- **Moves** the backup file to the destination directory.

## Usage

Run the script with:

```bash
./backup.sh target_directory_name destination_directory_name

./backup.sh /home/user/documents /home/user/backups

