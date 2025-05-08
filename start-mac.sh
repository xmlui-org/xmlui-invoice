#!/bin/bash

set -e

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Try Node.js via npx
if command -v npx > /dev/null 2>&1; then
    echo "Running http-server with npx..."
    exec npx -y http-server -p 8080 -o
fi

# Try Python http.server
if command -v python3 > /dev/null 2>&1; then
    echo "Running Python 3 http.server..."
    exec python3 -m http.server 8080
elif command -v python > /dev/null 2>&1; then
    echo "Running Python 2 http.server..."
    exec python -m SimpleHTTPServer 8080
fi
#

# Fallback to binary
if [[ -f "$BINARY" ]]; then
  echo "Ensuring $BINARY is executable and unquarantined..."
  chmod +x "$BINARY"
  xattr -d com.apple.quarantine "$BINARY" 2>/dev/null || true
  echo "Running fallback binary: $BINARY"
  exec "$BINARY"
else
  echo "No valid HTTP server found, and fallback binary not found at $BINARY"
  exit 1
fi

