#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Platform: macOS Intel vs ARM
if [[ "$(uname)" == "Darwin" ]]; then
  ARCH="$(uname -m)"
  if [[ "$ARCH" == "arm64" ]]; then
    BINARY="$SCRIPT_DIR/tiny-httpd-mac-arm"
  else
    BINARY="$SCRIPT_DIR/tiny-httpd-mac-intel"
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  BINARY="$SCRIPT_DIR/tiny-httpd-linux"
else
  echo "Unsupported platform: $(uname)"
  exit 1
fi

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

