#!/bin/zsh

# Timeout in seconds
timeout=10

while true; do
    # Check if Plex Media Server process is running
    if pgrep -x "Plex Media Server" > /dev/null; then
        # Get the PID of the Plex Media Server process
        pid=$(pgrep -x "Plex Media Server")
        
        # Check if the process is hung
        if ! ps -p $pid > /dev/null; then
            echo "Plex Media Server process is hung. Restarting..."
            # Restart Plex Media Server
            /Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Server
        else
            echo "Plex Media Server is running."
        fi
    else
        echo "Plex Media Server is not running. Starting..."
        # Start Plex Media Server
        /Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Server
    fi
    
    # Sleep for a specified time before checking again
    sleep 60  # Sleep for 60 seconds (adjust as needed)
done
