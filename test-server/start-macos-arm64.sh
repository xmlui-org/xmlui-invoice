#!/usr/bin/env bash
set -e

# Remove quarantine attribute for Gatekeeper, if present
xattr -d com.apple.quarantine test-server/xmlui-test-server-macos-arm64 2>/dev/null || true

# Run
./test-server/xmlui-test-server-macos-arm64 -api api.json


