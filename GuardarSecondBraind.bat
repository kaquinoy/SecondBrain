@echo off
setlocal enabledelayedexpansion
color 0A

echo =============================================
echo  SecondBrain - Sincronizar con GitHub
echo =============================================
echo.

rem Verifica que git esté instalado
git --version >nul 2>&1
if errorlevel 1 (
  color 0C
  echo ERROR: Git no está instalado o no es accesible.
  pause
  exit /b 1
)

rem Obtiene fecha/hora formateada vía PowerShell
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "(Get-Date).ToString('yyyy-MM-dd HH:mm:ss')"`) do set "GITDATE=%%i"
set "MSG=[kelvin] actualización de contenido - %GITDATE%"

echo [%GITDATE%] Iniciando sincronización...
echo.

rem Verificar estado del repositorio
git status --short >nul 2>&1
if errorlevel 1 (
  color 0C
  echo ERROR: No estamos dentro de un repositorio Git válido.
  pause
  exit /b 1
)

rem Agregar todos los cambios
echo Agregando cambios...
git add .
if errorlevel 1 (
  color 0C
  echo ERROR: No se pudieron agregar los cambios.
  pause
  exit /b 1
)

rem Crear commit
echo Creando commit...
git commit -m "%MSG%"
if errorlevel 1 (
  color 0F
  echo INFO: No había cambios para commitear (repositorio al día).
  pause
  exit /b 0
)

rem Hacer push a main
echo Enviando cambios a GitHub...
git push origin main
if errorlevel 1 (
  color 0C
  echo ERROR: Falló el push a GitHub. Verifica tu conexión y permisos.
  pause
  exit /b 1
)

color 0B
echo.
echo ✓ Sincronización completada exitosamente
echo ✓ Los cambios se han enviado a: https://github.com/kaquinoy/SecondBrain
echo.
pause
