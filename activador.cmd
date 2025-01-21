@echo off
:: Verificar si se ejecuta como administrador
openfiles >nul 2>&1 || (
    echo Este script requiere permisos de administrador. Por favor, ejecúte nuevamente como administrador.
    pause
    exit /b
)

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
cls
echo Seleccione la arquitectura de su sistema:
echo 1) 32 bits
echo 2) 64 bits
echo ============================================
set /p arch="Seleccione una opcion: "

if "%arch%" == "1" goto instalar_32bits
if "%arch%" == "2" goto instalar_64bits

echo Opcion invalida. Intente de nuevo.
pause
goto instalar

:instalar_32bits
start ms-windows-store://pdp/?ProductId=9NBLGGH2JHXJ
echo Instalando en un sistema de 32 bits.
pause
goto menu

:instalar_64bits
start ms-windows-store://pdp/?ProductId=9NBLGGH2JHXJ
echo Instalando en un sistema de 64 bits.
pause
goto menu

:activar
cls
echo Seleccione la arquitectura de su sistema:
echo 1) 32 bits
echo 2) 64 bits
echo ============================================
set /p arch="Seleccione una opcion: "

if "%arch%" == "1" goto activar_32bits
if "%arch%" == "2" goto activar_64bits

echo Opcion invalida. Intente de nuevo.
pause
goto activar

:activar_32bits
cls
echo Activando el juego para 32 bits...
if exist "Activador\32bits\AT1\Windows.ApplicationModel.Store.dll" (
    copy /y "Activador\32bits\AT1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll" >nul 2>&1
    if errorlevel 1 (
        echo Error al copiar archivos. Verifique los permisos.
        pause
        goto menu
    )
)
echo Activacion completada para 32 bits.
pause
goto menu

:activar_64bits
cls
echo Activando el juego para 64 bits...
if exist "Activador\64bits\AT1\Windows.ApplicationModel.Store.dll" (
    copy /y "Activador\64bits\AT1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll" >nul 2>&1
    if errorlevel 1 (
        echo Error al copiar archivos. Verifique los permisos.
        pause
        goto menu
    )
)
echo Activacion completada para 64 bits.
pause
goto menu

:desactivar
cls
echo Desactivando el juego...
if exist "Desactivador\32bits\DC1\Windows.ApplicationModel.Store.dll" (
    copy /y "Desactivador\32bits\DC1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\System32\Windows.ApplicationModel.Store.dll" >nul 2>&1
    if errorlevel 1 (
        echo Error al copiar archivos. Verifique los permisos.
        pause
        goto menu
    )
)
if exist "Desactivador\64bits\DC1\Windows.ApplicationModel.Store.dll" (
    copy /y "Desactivador\64bits\DC1\Windows.ApplicationModel.Store.dll" "%SystemRoot%\SysWOW64\Windows.ApplicationModel.Store.dll" >nul 2>&1
    if errorlevel 1 (
        echo Error al copiar archivos. Verifique los permisos.
        pause
        goto menu
    )
)
echo Desactivacion completada.
pause
goto menu

:descargar_actualizar
cls
echo Seleccione el metodo de descarga:
echo 1) Descargar ZIP del repositorio
echo 2) Usar Git para clonar el repositorio
echo ============================================
set /p metodo="Seleccione una opcion: "

if "%metodo%" == "1" goto descargar_zip
if "%metodo%" == "2" goto clonar_git

echo Opcion invalida. Intente de nuevo.
pause
goto descargar_actualizar

:descargar_zip
cls
echo Descargando ZIP del repositorio...
if exist "Activador-minecraft-main.zip" del "Activador-minecraft-main.zip"
curl -L -o Activador-minecraft-main.zip https://github.com/CarlosSTWR/Activador-minecraft/archive/refs/heads/main.zip
if errorlevel 1 (
    echo Error al descargar el ZIP del repositorio.
    pause
    goto menu
)
echo ZIP descargado correctamente.
echo.
echo Manteniendo el archivo ZIP sin extraer en la carpeta actual.
pause
goto menu

:clonar_git
cls
echo Clonando repositorio con Git...
if exist "Activador-minecraft" (
    rmdir /s /q "Activador-minecraft"
)
git clone https://github.com/CarlosSTWR/Activador-minecraft.git
if errorlevel 1 (
    echo Error al clonar el repositorio.
    pause
    goto menu
)
echo Clonacion completada.
pause
goto menu
