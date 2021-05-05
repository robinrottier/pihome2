@echo off
setlocal

cd /d %~dp0

set image=pihome2
set name=pihome2

set options=--rm --name %name% -h %name% -p 7802:80 -p 7803:3306

docker run -it %options% %image%
