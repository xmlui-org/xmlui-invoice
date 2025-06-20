@echo off
setlocal

REM Run the server with the API configuration
test-server\xmlui-test-server-windows-amd64.exe -api api.json
