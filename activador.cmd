@echo off
:menu
cls
echo ============================================
echo          Activar Minecraft
echo ============================================
echo 1) Instalar el juego de la tienda
echo 2) Activar el juego
echo 3) Desactivar el juego
echo 4) Descargar y actualizar archivos
echo ============================================
echo.
set /p option="Seleccione una opcion: "

if "%option%" == "1" goto instalar
if "%option%" == "2" goto activar
if "%option%" == "3" goto desactivar
if "%option%" == "4" goto descargar_actualizar

echo Opcion invalida. Intente de nuevo.
pause
goto menu

:instalar
start ms-windows-store://pdp/?ProductId=9NBLGGH2JHXJ
echo Enviado a la tienda de Microsoft.
pause
goto menu

:activar
cls
echo Activando el juego...
set "scriptPath=%~dp0"

:: Activador 32bits
if exist "%scriptPath%Activador\32bits\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Activador\32bits\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)

:: Activador 64bits
if exist "%scriptPath%Activador\64bits\System32\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Activador\64bits\System32\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)
if exist "%scriptPath%Activador\64bits\SysWOW64\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Activador\64bits\SysWOW64\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll"
)

echo Activacion completada.
pause
goto menu

:desactivar
cls
echo Desactivando el juego...
set "scriptPath=%~dp0"

:: Desactivador 32bits
if exist "%scriptPath%Desactivador\32bits\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Desactivador\32bits\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)

:: Desactivador 64bits
if exist "%scriptPath%Desactivador\64bits\System32\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Desactivador\64bits\System32\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)
if exist "%scriptPath%Desactivador\64bits\SysWOW64\Windows.ApplicationModel.Store.dll" (
    copy /y "%scriptPath%Desactivador\64bits\SysWOW64\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll"
)

echo Desactivacion completada.
pause
goto menu

:descargar_actualizar
cls
echo Descargando y actualizando archivos necesarios...
set "scriptPath=%~dp0"
REM Sustituye los enlaces por los correctos cuando los tengas.
REM Por ejemplo:
REM curl -o "%scriptPath%Activador.zip" [Enlace_GitHub_Activador]
REM curl -o "%scriptPath%Desactivador.zip" [Enlace_GitHub_Desactivador]
echo Descarga y actualizacion completadas.
pause
goto menu
