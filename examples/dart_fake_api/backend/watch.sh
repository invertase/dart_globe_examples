#!/bin/bash

# Define directory to watch
WATCH_DIR="$PWD/bin"

# Start watching the directory
if ! watchman watch "$WATCH_DIR"; then
    echo "Failed to set watch on $WATCH_DIR"
    exit 1
fi

# Create and set a trigger
if ! watchman trigger -j <<-EOT
["trigger", "$WATCH_DIR", {
    "name": "run",
    "command": ["bash", "run.sh"],
    "append_files": false
}]
EOT
then
    echo "Failed to create trigger"
    exit 1
fi

# Tail the server log file
if ! tail -f server.log; then
    echo "Failed to tail server.log"
    exit 1
fi
