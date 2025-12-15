@echo off
rem gitutils
title gitrepo

if "%1"=="" (
    echo No arguments provided.
    call :commands
    goto :end
)

:commands
echo.
echo usage: gitrepo [-cc ^| --contributor-clone ^| --contrib-clone]
echo.
echo clone a repository you have permission
echo    -cc ^| --contributor-clone ^| --contrib-clone
echo.
echo how to use:
echo gitrepo -cc [your github username] [the repository's name]
echo.
echo for example:
echo gitrepo -cc linus-torvalds linux
echo gitrepo -cc emacs-mirror emacs.git

:loop
if "%1"=="" goto :end

if "%1"=="--contributor-clone" (
    call :contrib_clone %2 %3
    goto :end
) else if "%1"=="--contrib-clone" (
    call :contrib_clone %2 %3
    goto :end
) else if "%1"=="-cc" (
    call :contrib_clone %2 %3
    goto :end
) else (
    echo Unknown argument: %1
    call :commands 
    goto end
)
goto :loop

:contrib_clone
echo.
echo cloning repository: %1/%2
echo.
git clone git@%1:%1/%2
echo.
echo.
echo cloning complete
echo.
goto :end

:end
