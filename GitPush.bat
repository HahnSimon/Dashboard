@echo off

REM Skift automatisk til mappen, hvor GitPush.bat ligger
cd /d "%~dp0"

REM Tilføj ændringer
git add .

REM Opret commit
git commit -m "Dashboard update"

REM Send ændringerne til GitHub
git push

pause