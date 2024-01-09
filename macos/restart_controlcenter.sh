#!/bin/bash

# Get the process ID (PID) of 'Control Center'
pid=$(pgrep -f "ControlCenter")

# Check if the process is running
if [ ! -z "$pid" ]; then
    echo "Restarting 'Control Center' with PID: $pid"
    kill $pid
else
    echo "'Control Center' is not running."
fi
