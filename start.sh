#!/bin/bash

echo "XMLUI Invoice Server"
echo "===================="
echo ""
echo "Please select your platform:"
echo "1) macOS ARM64 (Apple Silicon)"
echo "2) macOS Intel"
echo "3) Linux AMD64"
echo ""
read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        echo "Starting macOS ARM64 server..."
        ./test-server/start-macos-arm64.sh
        ;;
    2)
        echo "Starting macOS Intel server..."
        ./test-server/start-macos-intel.sh
        ;;
    3)
        echo "Starting Linux AMD64 server..."
        ./test-server/start-linux.sh
        ;;
    *)
        echo "Invalid choice. Please run again and select 1-3."
        exit 1
        ;;
esac
