@echo off

set STLINKDIR=C:\Users\Massaro\AppData\Local\Arduino15\packages\stm32duino\tools\stm32tools\2021.2.9
set CURDIR=%CD%

call %STLINKDIR%/win/stlink_upload.bat %CD%/blink.bin

cd %CURDIR%
