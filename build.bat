@echo off
setlocal

cd /d %~dp0

set image=pihome

docker build -t %image% .
