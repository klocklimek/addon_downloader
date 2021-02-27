ECHO OFF
cls
echo Pobieram skrypt...
powershell -ExecutionPolicy bypass -Command "wget \"https://raw.githubusercontent.com/klocklimek/addon_downloader/main/addons.ps1\" -useBasicParsing -OutFile \"addons.ps1\""
echo Uruchamiam skrypt...
powershell -ExecutionPolicy bypass -Command "./addons.ps1"
echo Usuwam skrypt...
powershell -ExecutionPolicy bypass -Command "Remove-Item -Path \"addons.ps1\""
echo Dziekuje :)
pause

