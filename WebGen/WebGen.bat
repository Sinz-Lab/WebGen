rem MADE BY koob#8912
@if (@CodeSection == @Batch) @then

@echo off
setlocal EnableDelayedExpansion

set "alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "strLength=68"
set "randomStr="
set "prefix=https://discord.com/api/webhooks/"
set "maxIterations=60"
set "counter=0"

if "%~1" neq "max" (
  start /min cmd /C "%~f0" max
  exit
)

set "message="
set /p message=<Prompt.txt

for /L %%i in (1, 1, %maxIterations%) do (
  if !counter! geq %maxIterations% (
    goto :end
  )

  for /f %%j in ('powershell -Command "Get-Random -Minimum 1 -Maximum 9223372036854775807"') do set "randomNum=%%j"

  for /L %%j in (1, 1, %strLength%) do (
    set /a "randomIndex=!random! %% 62"
    for %%k in (!randomIndex!) do set "randomStr=!randomStr!!alphabet:~%%k,1!"
  )

  curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%message%\"}" %prefix%!randomNum!/!randomStr!
  set /a "counter+=1"
  set "randomStr="
)

:end
start /min cmd /C "%~f0" max
exit

@end

@if (@CodeSection == @VBScript) @then

Set objShell = CreateObject("Shell.Application")
objShell.MinimizeAll

@end
