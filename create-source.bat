@echo off
setlocal

cd %~dp0

rem pihome original source in source\pihome
if not exist source md source
if     exist source\pihome git submodule update
if not exist source\pihome git submodule add http://githiub.com/pihome-shc/pihome source\pihome

rem copy apache folders to www\pihome
set src=source\pihome
set dst=www\pihome
if not exist %dst% md %dst%

set e=php txt json py
for %%e in ( %e% ) do xcopy /y/d %src%\*.%%e %dst%
set d=cron api css fonts images js languages st_inc MySQL_Database
for %%d in ( %d% ) do xcopy /y/d/s %src%\%%d %dst%\%%d\
