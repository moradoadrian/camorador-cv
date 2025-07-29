@echo off
setlocal enabledelayedexpansion

:: Nombre del commit (puedes editarlo aquí si quieres)
set COMMIT_MESSAGE=🚀 Deploy automático a GitHub Pages

echo 🔨 Generando build de producción...
call ng build --output-path=docs --base-href=./

if errorlevel 1 (
  echo ❌ Error al compilar el proyecto. Revisa los errores de Angular.
  pause
  exit /b
)

echo 📦 Copiando archivos desde docs\browser a docs\...
xcopy /E /Y /I docs\browser\* docs\

echo 🗑️ Eliminando carpeta docs\browser...
rmdir /S /Q docs\browser

echo 📂 Preparando commit para GitHub...
git add docs
git commit -m "%COMMIT_MESSAGE%"
git push

echo ✅ ¡Listo! Cambios publicados en GitHub Pages.
pause
