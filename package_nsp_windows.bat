@echo off
setlocal EnableExtensions
cd /d "%~dp0"

set "PACKER="
if exist "hacbrewpack.exe" set "PACKER=hacbrewpack.exe"
if exist "hacBrewPack.exe" set "PACKER=hacBrewPack.exe"

if not defined PACKER (
    echo ERROR: hacbrewpack.exe was not found in this folder.
    echo Put your locally obtained hacBrewPack executable here.
    pause
    exit /b 1
)

if not exist "keys.dat" (
    echo ERROR: keys.dat was not found in this folder.
    echo Keep your own keyset local. Do not upload it to GitHub.
    pause
    exit /b 1
)

if not exist "exefs\main" (
    echo ERROR: exefs\main is missing.
    pause
    exit /b 1
)

if not exist "exefs\main.npdm" (
    echo ERROR: exefs\main.npdm is missing.
    pause
    exit /b 1
)

if not exist "control\control.nacp" (
    echo ERROR: control\control.nacp is missing.
    pause
    exit /b 1
)

rmdir /s /q hacbrewpack_temp 2>nul
rmdir /s /q hacbrewpack_nca 2>nul
rmdir /s /q hacbrewpack_nsp 2>nul

"%PACKER%" -k keys.dat ^
  --exefsdir exefs ^
  --romfsdir romfs ^
  --controldir control ^
  --nologo ^
  --tempdir hacbrewpack_temp ^
  --ncadir hacbrewpack_nca ^
  --nspdir hacbrewpack_nsp

if errorlevel 1 (
    echo.
    echo ERROR: NSP packaging failed.
    pause
    exit /b 1
)

echo.
echo Completed. Check the hacbrewpack_nsp folder.
pause
