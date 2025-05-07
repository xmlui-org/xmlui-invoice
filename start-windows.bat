@echo off
setlocal

REM Set binary name
set "BINARY=tiny-httpd-windows.exe"

REM Use npx if available
where npx >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Running http-server with npx...
    npx -y http-server -p 8080 -o
    goto :EOF
)

REM Use Python if available
where python >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Running Python HTTP server...
    python -m http.server 8080
    goto :EOF
)

REM Fallback: use bundled binary
if exist "%~dp0%BINARY%" (
    echo Running fallback binary: %BINARY%
    "%~dp0%BINARY%"
) else (
    echo No HTTP server found and fallback binary not found: %~dp0%BINARY%
    exit /b 1
)

endlocal
