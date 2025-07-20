@echo off
chcp 65001 >nul
echo ==========================================
echo         Game Server Stopper
echo ==========================================
echo.

title Game Server Stop Manager

echo Stopping game servers...
echo.

:: Stop EasyWebSvr
echo [1/3] Stopping WEB Server...
taskkill /f /im "EasyWebSvr.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✓ WEB Server stopped
) else (
    echo   - WEB Server not running
)

:: Stop Account Server
echo [2/3] Stopping Account Server...
taskkill /f /im "账号服务器.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✓ Account Server stopped
) else (
    echo   - Account Server not running
)

:: Stop Game Server
echo [3/3] Stopping Game Server...
taskkill /f /im "游戏服务器.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✓ Game Server stopped
) else (
    echo   - Game Server not running
)

echo.
echo ==========================================
echo Server stop operation completed!
echo ==========================================
echo.
pause 