@echo off
set "DIR=%~dp0"
set "PROFILE_DIR=%DIR%browser-profile"
cd /d "%DIR%"

set "CHROME_PATH="
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    set "CHROME_PATH=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
) else if exist "C:\Program Files\Microsoft\Edge\Application\msedge.exe" (
    set "CHROME_PATH=C:\Program Files\Microsoft\Edge\Application\msedge.exe"
) else if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    set "CHROME_PATH=C:\Program Files\Google\Chrome\Application\chrome.exe"
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    set "CHROME_PATH=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
)

if "%CHROME_PATH%"=="" (
    echo Chrome or Edge not found! Please install Microsoft Edge or Google Chrome.
    pause
    exit /b
)

if exist "%DIR%server.info" del "%DIR%server.info"

echo Starting local server using PowerShell...
start /B /MIN powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%DIR%server.ps1"

set WAIT_COUNT=0
:wait_loop
if exist "%DIR%server.info" goto read_info
timeout /t 1 >nul
set /a WAIT_COUNT+=1
if %WAIT_COUNT% geq 10 (
    echo Server did not start in time.
    pause
    exit /b
)
goto wait_loop

:read_info
<"%DIR%server.info" (
    set /p SERVER_PID=
    set /p SERVER_PORT=
)

"%CHROME_PATH%" --app="http://localhost:%SERVER_PORT%/index.html" --user-data-dir="%PROFILE_DIR%" --ignore-gpu-blocklist --enable-gpu-rasterization

taskkill /F /PID %SERVER_PID% /T >nul 2>&1
if exist "%DIR%server.info" del "%DIR%server.info"
