@echo off
title Telegraph Secure Desktop Lab
cd /d "%~dp0"

echo Starting backend server...
start "Telemetry Backend" cmd /k "cd /d "%~dp0backend" && npm run dev"

echo Starting frontend website...
start "Telegraph Frontend" cmd /k "cd /d "%~dp0frontend" && npm run dev"

echo Waiting for local servers...
timeout /t 4 /nobreak >nul

echo Opening website...
start "" "http://127.0.0.1:5173"

echo.
echo Demo started.
echo Website: http://127.0.0.1:5173
echo Backend logs: http://localhost:5000/logs
echo.
pause
