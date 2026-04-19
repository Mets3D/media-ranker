@echo off
cd /d "%~dp0"
start "Media Ranker Server" python -m http.server 8080
timeout /t 1 /nobreak >nul
start "" "http://localhost:8080/media-ranker.html"