#!/bin/bash

# Start the server in the background
node ./build/index.js &
SERVER_PID=$!

# Wait for the server to start (adjust the sleep time if needed)
sleep 2

# Function to make SSE requests (not used in this updated version)
# sse_request() {
#   curl -s http://localhost:3001/sse
# }

# Function to send a message to the server
send_message() {
  curl -X POST -H "Content-Type: application/json" -d "$1" http://localhost:3001/messages
}

# Example usage:

echo "Starting weather demo..."

# Get alerts for a state
echo "Getting alerts for CA..."
send_message '{"tool": "get-alerts", "arguments": {"state": "CA"}}'
sleep 1

# Get forecast for a location
echo "Getting forecast for San Francisco..."
send_message '{"tool": "get-forecast", "arguments": {"latitude": 37.7749, "longitude": -122.4194}}'
sleep 1

echo "Weather demo complete."

# Clean up: Kill the server process
echo "Killing server process..."
kill $SERVER_PID
