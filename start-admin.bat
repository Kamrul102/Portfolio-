@echo off
title Portfolio Admin Dashboard
echo.
echo  ============================================
echo   Kamrul Hassan - Portfolio Admin Dashboard
echo  ============================================
echo.
echo  Starting local server...
echo  Admin will open automatically in your browser.
echo.
echo  Press Ctrl+C to stop the server when done.
echo.

cd /d "%~dp0"
start "" "http://localhost:5500/admin.html"
python -m http.server 5500

pause
