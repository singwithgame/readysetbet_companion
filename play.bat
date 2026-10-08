@echo off
set "DIR=%~dp0"
set "INDEX_URL=file:///%DIR:\=/%index.html"
set "PROFILE_DIR=%DIR%browser-profile"

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

start "" "%CHROME_PATH%" --app="%INDEX_URL%" --allow-file-access-from-files --user-data-dir="%PROFILE_DIR%" --ignore-gpu-blocklist --enable-gpu-rasterization
exit /b
