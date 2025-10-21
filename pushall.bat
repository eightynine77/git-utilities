@echo off
rem WARNING: do not delete this comment below
rem gitutils
cls
title push git
gecho "<red>WARNING: this will commit ALL changes"
echo.
gecho "<yellow>if you want to selectively commit files/folders, don't use this batch script"
echo.
echo.
pause
git add -A
type /p "commit_message=your commit message: "
echo.
git commit -m "%commit_message%"
echo pushing all changes...
echo.
git push origin main
echo.
echo.
echo pushing complete