@echo off
setlocal

echo Compilando libyaml...
cl.exe /c /MT /DYAML_DECLARE_STATIC /D_CRT_SECURE_NO_WARNINGS /I include src\api.c src\reader.c src\scanner.c src\parser.c src\loader.c src\writer.c src\emitter.c src\dumper.c

if errorlevel 1 (
    echo.
    echo Fallo la compilacion. Revisa los errores arriba.
    exit /b 1
)

echo.
echo Generando yaml.lib...
lib.exe /OUT:lib/yaml.lib api.obj reader.obj scanner.obj parser.obj loader.obj writer.obj emitter.obj dumper.obj

if errorlevel 1 (
    echo.
    echo Fallo al generar la lib.
    exit /b 1
)

echo.
echo lib\yaml.lib generado correctamente.

del *.obj

endlocal
