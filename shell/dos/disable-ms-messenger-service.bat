@echo off
echo Removing Microsoft Messenger...
rundll32 advpack.dll,LaunchINFSection %WinDir%\inf\msmsgs.inf,BLC.Remove

echo Disabling it from running in the future...
echo REGEDIT4>%temp%\nomsngr.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client]>>%temp%\nomsngr.reg
echo "PreventRun"=dword:00000001>>%temp%\nomsngr.reg
echo "PreventAutoRun"=dword:00000001>>%temp%\nomsngr.reg
echo "PreventAutoUpdate"=dword:00000001>>%temp%\nomsngr.reg
echo "PreventBackgroundDownload"=dword:00000001>>%temp%\nomsngr.reg
echo "Disabled"=dword:00000001>>%temp%\nomsngr.reg
regedit /s %temp%\nomsngr.reg