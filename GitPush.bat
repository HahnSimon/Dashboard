@echo off
cd /d "%~dp0"

set "GITEXE=%LOCALAPPDATA%\Programs\Git\cmd\git.exe"

if not exist "%GITEXE%" (
    echo FEJL: Git blev ikke fundet her:
    echo %GITEXE%
    echo.
    echo Installer Git for Windows paa denne computer.
    exit /b 10
)

echo Arbejdsmappe: %CD%
echo.

"%GITEXE%" add .
if errorlevel 1 (
    echo FEJL: git add mislykkedes.
    exit /b 11
)

"%GITEXE%" diff --cached --quiet
if %errorlevel%==0 (
    echo Ingen nye dashboard-aendringer.
    exit /b 0
)

"%GITEXE%" commit -m "Dashboard update"
if errorlevel 1 (
    echo FEJL: git commit mislykkedes.
    exit /b 12
)

"%GITEXE%" push
if errorlevel 1 (
    echo FEJL: git push mislykkedes.
    exit /b 13
)

echo Dashboard udgivet korrekt.
exit /b 0