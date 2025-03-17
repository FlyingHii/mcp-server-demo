#!/bin/bash

# Function to send a request to the server and print the response
send_request() {
  local request_json="$1"
  echo "Sending request:"
  echo "$request_json"
  echo "$request_json" | jq .  # Optional: pretty print the JSON request

  response=$(echo "$request_json" | pnpm start 2>/dev/null ) # Redirect stderr to /dev/null

  echo -e "\nResponse received:"
  echo "$response" | jq .    # Optional: pretty print the JSON response
  echo "---"
}

# Request 1: Get alerts for California (CA)
alerts_request='{
  "type": "request",
  "requestId": "1",
  "toolCall": {
    "toolName": "get-alerts",
    "arguments": {
      "state": "CA"
    }
  }
}'
send_request "$alerts_request"

# Request 2: Get forecast for Los Angeles, CA
forecast_request='{
  "type": "request",
  "requestId": "2",
  "toolCall": {
    "toolName": "get-forecast",
    "arguments": {
      "latitude": 34.0522,
      "longitude": -118.2437
    }
  }
}'
send_request "$forecast_request"

echo "Demo finished."
