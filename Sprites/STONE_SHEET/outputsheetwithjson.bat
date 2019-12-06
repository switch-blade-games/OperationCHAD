@echo off
set aseprite="F:\Gamedev\GameMaker\Tools\Aseprite\Aseprite.exe"
set project="F:\Gamedev\GameMaker\Tools\Aseprite\projects\stone.aseprite"

%aseprite% %project% -b --sheet sheet.png --sheet-type packed --data sheetinfo.json --list-tags