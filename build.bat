@echo off
setlocal

cd /d %~dp0

set image=pihome2

docker build -t %image% . 

if "%1" == "-r" run.bat
