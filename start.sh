#!/usr/bin/env bash
set -e

ARCH=$(uname -m)

case "$(uname -s)" in
    Linux)
        cd xmlui-invoice
        exec "../test-server/xmlui-test-server-linux-amd64" -db ../private/data.db -api ../private/api.json
        ;;
    Darwin)
        if [ "$ARCH" = "arm64" ]; then
            # Remove quarantine on macOS
            xattr -d com.apple.quarantine test-server/xmlui-test-server-macos-arm64 2>/dev/null || true
            cd xmlui-invoice
            exec "../test-server/xmlui-test-server-macos-arm64" -db ../private/data.db -api ../private/api.json
        else
            xattr -d com.apple.quarantine test-server/xmlui-test-server-macos-intel 2>/dev/null || true
            cd xmlui-invoice
            exec "../test-server/xmlui-test-server-macos-intel" -db ../private/data.db -api ../private/api.json
        fi
        ;;
    *)
        echo "Unsupported platform. Windows users: run start.bat"
        exit 1
        ;;
esac
