#!/bin/bash

# Process identifier for the Dart server
SERVER_PROCESS="dart run bin/server.dart"

# Log current Dart processes before attempting to stop
echo "Current Dart processes:"
pgrep -fl dart

echo "Stopping any existing server processes..."
pkill -f "$SERVER_PROCESS"

# Sleep for a short time to ensure the process has been terminated
sleep 1

echo "Starting the server..."
nohup dart run bin/server.dart > server.log 2>&1 &

# Get the PID of the last background process
PID=$!

# Wait for a few seconds and check if the process is still running
sleep 2

if ps -p $PID > /dev/null
then
   echo "Server started successfully with PID $PID."
else
   echo "Failed to start the server. Check server.log for details."
fi