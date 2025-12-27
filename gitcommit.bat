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
) else if "%arg%"=="-ph" (
    git push origin main
    goto :end
) else if "%arg%"=="--pull" (
    git pull origin main
    goto :end
) else if "%arg%"=="-pl" (
    git pull origin main
    goto :end
) else if "%arg%"=="--help" (
call :helpmsg
goto :end
) else if "%arg%"=="-h" (
call :helpmsg
goto :end
) else if "%arg%"=="--comment" (
git add -A
git commit
echo.
echo.
echo ==========================
echo done adding all changes and adding a comment.
echo ==========================
goto :end
) else if "%arg%"=="-c" (
git add -A
git commit
echo.
echo.
echo ==========================
echo done adding all changes and adding a comment.
echo ==========================
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
echo.
echo usage
echo ====================
echo if you want to make a commit with a commit message, use: 
echo gitcommit [your git commit message]
echo for example: gitcommit fixed the UI
echo.
echo if you want to only make a commit and nothing else, use:
echo gitcommit [-ph ^| --push]
echo for example: gitcommit --push
echo.
echo if you want to pull from remote, use:
echo gitcommit [-pl ^| --pull]
echo for example: gitcommit --pull
echo.
echo if you want to only stage stanges and add git comment, use:
echo gitcommit [-c ^| --comment]
echo for example: gitcommit --comment
echo.
echo NOTE: this "gitcommit -c" command will enter git's "git commit" mode that
echo allows you to enter git commit message with description with your default
echo text editor

:helppopup
echo type --help or -h to see the list of commands for this script

:end

