@echo off
setlocal

REM Change to app directory and run server with secure file paths
cd xmlui-invoice
..\test-server\xmlui-test-server-windows-amd64.exe -db ..\private\data.db -api ..\private\api.json
