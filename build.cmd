@echo off
setlocal

set PROJECT_DIR=D:\OS\Lab-1
set BUILD_DIR=%PROJECT_DIR%\build

cd /d "%PROJECT_DIR%"

git fetch origin
git reset --hard origin/main

if exist "%BUILD_DIR%" rd /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"
cd /d "%BUILD_DIR%"

rem Генерация проекта (определение компилятора, путей к библиотекам и т. д.)
cmake -G "MinGW Makefiles" ..

rem Сборка проекта (компиляция)
mingw32-make -j4

if errorlevel 1 (
    echo Fail!
) else (
    echo Success!
)

pause