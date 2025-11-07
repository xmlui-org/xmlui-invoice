@echo off
setlocal

REM Check if xmlui is in the path
where xmlui >nul 2>&1
if %errorlevel% neq 0 (
    echo xmlui CLI not found in PATH.
    echo Please ensure the xmlui CLI is installed and available in your system PATH.
    echo You can download it from: https://xmlui.org/link-goes-here
    exit /b 1
)

REM Run the xmlui serve command with the same parameters as Linux version
xmlui serve --db ./private/data.db --api ./private/api.json --client ./xmlui-invoice
