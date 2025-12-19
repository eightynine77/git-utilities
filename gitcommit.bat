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
) else if "%arg%"=="--help" (
call :helpmsg
goto :end
) else if "%arg%"=="-h" (
call :helpmsg
goto :end
)

if "%arg:~0,1%"=="-" (
    echo Unknown argument: %arg%
    echo.
    echo.
    call :helpmsg
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
goto end

:helpmsg
echo usage
echo ====================
echo if you want to make a commit with a commit message, use: 
echo gitcommit [your git commit message]
echo.
echo for example: gitcommit fixed the UI
echo.
echo.
echo if you want to only make a commit and nothing else, use:
echo gitcommit [-p ^| --push]
echo.
echo for example: gitcommit --push
echo gitcommit -p

:helppopup
echo type --help or -h to see the list of commands for this script

:end
