@echo off
rem gitutils

if not exist ".git\" (
    echo you are not in a github repo...
    goto :end
)

set "arg=%~1"

if "%arg%"=="--push" (
    git push origin main
    goto :end
) else if "%arg%"=="-p" (
    git push origin main
    goto :end
)

if "%arg:~0,1%"=="-" (
    echo Unknown argument: %arg%
    goto :end
)

git add -A
git commit -m "%*"
echo.
git pull origin main
git push origin main
echo.
echo.
echo ==================================
echo done! a commit with message has been pushed
echo ==================================

:end
