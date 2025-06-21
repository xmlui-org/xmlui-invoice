#!/bin/bash
set -e

ARCH=$(uname -m)

case "$(uname -s)" in
    Linux)
        exec "./test-server/xmlui-test-server-linux-amd64" -api api.json
        ;;
    Darwin)
        if [ "$ARCH" = "arm64" ]; then
            # Remove quarantine on macOS
            xattr -d com.apple.quarantine test-server/xmlui-test-server-macos-arm64 2>/dev/null || true
            exec "./test-server/xmlui-test-server-macos-arm64" -api api.json
        else
            xattr -d com.apple.quarantine test-server/xmlui-test-server-macos-intel 2>/dev/null || true
            exec "./test-server/xmlui-test-server-macos-intel" -api api.json
        fi
        ;;
    *)
        echo "Unsupported platform. Windows users: run start.bat"
        exit 1
        ;;
esac
