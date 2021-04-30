@echo off
setlocal

cd /d %~dp0

set image=pihome

docker run -it -p 7802:80 -p 7803:3306 pihome2
