@echo off
rem Obtiene fecha/hora formateada vía PowerShell
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "(Get-Date).ToString('yyyy-MM-dd HH:mm:ss')"`) do set "GITDATE=%%i"
set "MSG=Primer commit con todo el contenido - %GITDATE%"

git add .
git commit -m "%MSG%"
if errorlevel 1 (
  echo Commit falló o no había cambios.
  pause
  exit /b 1
)

git branch -M main
git push -u origin main
pause
