#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

# Check if xmlui is in the path
if ! command -v xmlui &> /dev/null; then
    cat <<EOF

'xmlui' not found in PATH.

xmlui-invoice demonstrates a full-stack application.
It relies on a server that talks to a local database.
The 'xmlui' CLI does exaclty that.

Please ensure the 'xmlui' CLI is installed and available in your system PATH.
Download the self-contaied executable from https://xmlui.org/download/xmlui-cli

If you don't want to do that, but you can already start
a local http server, check out our other demo applications
at https://xmlui.org/download/apps

EOF
    exit 1
fi

exec xmlui serve --db ./data.db --api ./api.json ./client
