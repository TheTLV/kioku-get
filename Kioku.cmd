@echo off
cd /d "%~dp0"
start "" "%~dp0Kioku.exe"
set /a n=0
:wait
timeout /t 1 /nobreak >nul
set /a n+=1
curl -fsS -o NUL --max-time 1 http://127.0.0.1:5184/ >nul 2>&1 && goto open
if %n% LSS 40 goto wait
:open
start "" http://127.0.0.1:5184
