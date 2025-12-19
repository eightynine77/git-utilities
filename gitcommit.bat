@echo off
rem gitutils

if exist ".git\" (
    if "%~1"=="--push" (
        git push origin main
        goto :end
    ) else if "%~1"=="-p" (
        git push origin main
        goto :end
    )
)

if "%~1"=="" (
    echo No arguments provided.
    echo.
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
    goto :end
)

if exist ".git\" (
git add -A
git commit -m "%*"
echo.
git pull origin main
git push origin main
echo.
echo.
echo done!
exit /b
) else (
echo you are not in a github repo...
)

:end
