::文件路径：D:\sdk\cmake_build\vs2019\folly-v2021.04.26.00
@echo off
rm _build_ -fr

cmake  -B  _build_\Win32       -G "Visual Studio 16 2019"  -A Win32
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32    --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32    --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

cmake  -B  _build_\x64         -G "Visual Studio 16 2019"  -A x64
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64      --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64      --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

::=====================================
::file end
::=====================================
GOTO END

:STOP_JOB
echo "***********error***********"
pause

:END
echo "***********success***********"
pause

