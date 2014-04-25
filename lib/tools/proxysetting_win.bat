%discard: need to restart ie to take effect%
@echo off
color 1f
echo %1
echo %2
if "%1"=="on" goto proxyon
if "%1"=="off" goto proxyoff

:proxyon

cls
echo setting ie proxy "%2" ...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:%2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "127.0.0.1;localhost;" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /d "" /f
echo flush dns...
ipconfig /flushdns
goto exit

:proxyoff

cls
echo clear ie proxy...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 0 /f
echo ie proxy is cleared...
echo flush dns...
ipconfig /flushdns
goto exit

:exit
cls
echo.
echo restart ie to take effect
echo.
pause