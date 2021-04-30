@echo off
setlocal

cd %~dp0

if not exist source md source
git submodule add http://githiub.com/pihome-shc/pihome source\pihome
