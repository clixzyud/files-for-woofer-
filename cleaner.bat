@echo off
@echo off
:: BatchGotAdmin
:-------------------------------------

REM --> Check for permissions
"%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting Admin...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
setlocal DisabledelayedExpansion
set "batchPath=%~f0"
setlocal EnabledelayedExpansion
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""!batchPath!"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

:: Your code that needs administrative privileges goes here
title Deep Trace Cleaner
echo Administrative privileges granted.


REM --> kill shit
taskkill /f /im epicgameslauncher.exe > nul
taskkill /f /im EpicWebHelper.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping_EAC.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping_BE.exe > nul
taskkill /f /im FortniteLauncher.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping.exe > nul
taskkill /f /im EpicGamesLauncher.exe > nul
taskkill /f /im EasyAntiCheat.exe > nul
taskkill /f /im BEService.exe > nul
taskkill /f /im BEServices.exe > nul
taskkill /f /im BattleEye.exe > nul
taskkill /f /im epicgameslauncher.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping_EAC.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping_BE.exe >nul
taskkill /f /im FortniteLauncher.exe >nul
taskkill /f /im OneDrive.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping.exe >nul
taskkill /f /im UnrealCEFSubProcess.exe >nul
taskkill /f /im CEFProcess.exe >nul
taskkill /f /im EasyAntiCheat.exe >nul
taskkill /f /im BEService.exe >nul
taskkill /f /im BEServices.exe 
taskkill /f /im BattleEye.exe
taskkill /f /im PerfWatson2.exe
taskkill /f /im vgtray.exe
taskkill /f /im smartscreen.exe
taskkill /f /im EasyAntiCheat.exe
taskkill /f /im dnf.exe
taskkill /f /im CrossProxy.exe
taskkill /f /im tensafe_1.exe
taskkill /f /im tensafe_2.exe
taskkill /f /im tencentdl.exe
taskkill /f /im TenioDL.exe
taskkill /f /im uishell.exe
taskkill /f /im BackgroundDownloader.exe
taskkill /f /im conime.exe
taskkill /f /im QQDL.EXE
taskkill /f /im qqlogin.exe
taskkill /f /im dnfchina.exe
taskkill /f /im dnfchinatest.exe
taskkill /f /im txplatform.exe
taskkill /f /im OriginWebHelperService.exe
taskkill /f /im Origin.exe
taskkill /f /im OriginClientService.exe
taskkill /f /im OriginER.exe
taskkill /f /im OriginThinSetupInternal.exe
taskkill /f /im OriginLegacyCLI.exe
taskkill /f /im Agent.exe
taskkill /f /im Client.exe
sc stop EasyAntiCheat
sc stop FortniteClient-Win64-Shipping_EAC
sc stop BattleEye
sc stop FortniteClient-Win64-Shipping_BE

del /f /s /q /a "*.log" >nul
del /f /s /q /a "*.tmp" >nul
del /f /s /q /a "*.init" >nul


if not exist %windir%\Prefetch md %windir%\Prefetch

del %windir%\KB*.log /f /q
:: Clear event logs
for /f "tokens=*" %%a in ('wevtutil.exe el') do (
    wevtutil.exe cl "%%a"
    if %errorlevel% neq 0 (
        echo Failed to clear event log "%%a"
    )
)

for %%A in (
    "log", "tmp", "chk", "dlf", "old", "etl",
    "bak", "bac", "bup", "dmp", "temp"
) do (
    del /f /s /q %systemdrive%\*.%%A
)
cls
echo Deep Cleaning Successful.
exit
