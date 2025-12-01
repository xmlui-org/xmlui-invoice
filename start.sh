#!/usr/bin/env bash
set -e

# Check if xmlui is in the path
if ! command -v xmlui &> /dev/null; then
    echo ""
    echo "'xmlui' not found in PATH."
    echo ""
    echo "xmlui-invoice demonstrates a full-stack application."
    echo "It relies on a server that talks to a local database."
    echo "The 'xmlui' CLI does exaclty that."
    echo ""
    echo "Please ensure the 'xmlui' CLI is installed and available in your system PATH."
    echo "Download the self-contaied executable from https://xmlui.org/download/xmlui-cli"
    echo ""
    echo "If you don't want to do that, but you can already start"
    echo "a local http server, check out our other demo applications"
    echo "at https://xmlui.org/download/apps"
    exit 1
fi

exec xmlui serve --db ./data.db --api ./api.json ./client
