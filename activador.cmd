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
if exist "Activador\32bits\AT1\Windows.ApplicationModel.Store.dll" (
    copy /y "Activador\32bits\AT1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)
if exist "Activador\64bits\AT1\Windows.ApplicationModel.Store.dll" (
    copy /y "Activador\64bits\AT1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll"
)
echo Activacion completada.
pause
goto menu

:desactivar
cls
echo Desactivando el juego...
if exist "Desactivador\32bits\DC1\Windows.ApplicationModel.Store.dll" (
    copy /y "Desactivador\32bits\DC1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll"
)
if exist "Desactivador\64bits\DC1\Windows.ApplicationModel.Store.dll" (
    copy /y "Desactivador\64bits\DC1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll"
)
echo Desactivacion completada.
pause
goto menu

:descargar_actualizar
cls
echo Descargando y actualizando archivos necesarios...
REM Sustituye los enlaces por los correctos cuando los tengas.
REM Por ejemplo:
REM curl -o Activador.zip [Enlace_GitHub_Activador]
REM curl -o Desactivador.zip [Enlace_GitHub_Desactivador]
echo Descarga y actualizacion completadas.
pause
goto menu
