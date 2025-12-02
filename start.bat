@ECHO OFF
SETLOCAL

:: --- 1. Check if xmlui is in the path ---

CD /d "%~dp0"

WHERE xmlui >NUL 2>NUL
IF ERRORLEVEL 1 (
    ECHO.
    ECHO 'xmlui' not found in PATH.
    ECHO.
    ECHO xmlui-invoice demonstrates a full-stack application.
    ECHO It relies on a server that talks to a local database.
    ECHO The 'xmlui' CLI does exaclty that.
    ECHO.
    ECHO Please ensure the 'xmlui' CLI is installed and available in your system PATH.
    ECHO Download the self-contaied executable from https://xmlui.org/download/xmlui-cli
    ECHO.
    ECHO If you don't want to do that, but you can already start
    ECHO a local http server, check out our other demo applications
    ECHO at https://xmlui.org/download/apps

    EXIT /B 1
)

:: --- 2. Execute the serve command ---

xmlui serve --db .\data.db --api .\api.json .\client

ENDLOCAL
