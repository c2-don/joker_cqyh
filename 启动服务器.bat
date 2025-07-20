@echo off
chcp 65001 >nul
echo ==========================================
echo         Game Server Launcher
echo ==========================================
echo.

title Game Server Manager

:: Get current script directory
set "BASE_DIR=%~dp0"

echo Checking files...
echo.

:: Check if files exist
set "WEB_EXE=%BASE_DIR%WEB服务器\EasyWebSvr.exe"
set "ACC_EXE=%BASE_DIR%账号服务器\账号服务器.exe"
set "GAME_EXE=%BASE_DIR%游戏服务器\游戏服务器.exe"

if not exist "%WEB_EXE%" (
    echo ERROR: WEB Server not found: %WEB_EXE%
    pause
    exit /b 1
)

if not exist "%ACC_EXE%" (
    echo ERROR: Account Server not found: %ACC_EXE%
    pause
    exit /b 1
)

if not exist "%GAME_EXE%" (
    echo ERROR: Game Server not found: %GAME_EXE%
    pause
    exit /b 1
)

echo All files found! Starting servers...
echo.

:: Start WEB Server
echo [1/3] Starting WEB Server...
start "EasyWebSvr" /D "%BASE_DIR%WEB服务器" "%WEB_EXE%"
timeout /t 3 /nobreak >nul

:: Start Account Server
echo [2/3] Starting Account Server...
start "AccountServer" /D "%BASE_DIR%账号服务器" "%ACC_EXE%"
timeout /t 3 /nobreak >nul

:: Start Game Server
echo [3/3] Starting Game Server...
start "GameServer" /D "%BASE_DIR%游戏服务器" "%GAME_EXE%"
timeout /t 3 /nobreak >nul

echo.
echo ==========================================
echo All servers started successfully!
echo ==========================================
echo.
echo Running processes:
echo - EasyWebSvr (WEB Server)
echo - Account Server
echo - Game Server
echo.
echo You can safely close this window.
echo To stop servers, use the stop script or close server windows manually.
echo.
pause 