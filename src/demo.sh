#!/bin/bash

# Start the server in the background
node ./build/index.js &
SERVER_PID=$!

# Wait for the server to start (adjust the sleep time if needed)
sleep 2

# Function to make SSE requests
sse_request() {
  curl -s http://localhost:3001/sse
}

# Function to send a message to the server
send_message() {
  curl -X POST -d "$1" http://localhost:3001/messages
}

# Example usage:

echo "Starting SSE demo..."

echo "Subscribing to SSE events..."
# Run the SSE request in a separate terminal or use a tool like 'watch'
# sse_request | grep "Event:"  # Example: to filter for events

# Example: Send a message to the server (this part is currently not implemented in the server)
# echo "Sending a message..."
# send_message "Hello from the demo script!"

echo "SSE demo complete."

# Clean up: Kill the server process
echo "Killing server process..."
kill $SERVER_PID
