#!/usr/bin/env bash
set -e

ARCH=$(uname -m)

# Check if xmlui is in the path
if ! command -v xmlui &> /dev/null; then
    echo "xmlui CLI not found in PATH."
    echo "Please ensure the xmlui CLI is installed and available in your system PATH."
    echo "You can download it from: https://xmlui.org/link-goes-here"
    exit 1
fi

case "$(uname -s)" in
    Linux)
        exec xmlui serve --db ./private/data.db --api ./private/api.json --client ./xmlui-invoice
        ;;
    Darwin)
        exec xmlui serve --db ./private/data.db --api ./private/api.json --client ./xmlui-invoice
        ;;
    *)
        echo "Unsupported platform. Windows users: run start.bat"
        exit 1
        ;;
esac
