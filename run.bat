@echo off
setlocal

cd /d %~dp0

set image=pihome2

docker run -it -p 7802:80 -p 7803:3306 %image%
