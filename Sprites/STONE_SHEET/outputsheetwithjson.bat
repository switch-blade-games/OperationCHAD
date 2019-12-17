@echo off
set aseprite="C:\Users\Johnny B\Downloads\Aseprite.v1.2.9.x64.APP-DARKSiDERS\Aseprite.exe"
set project="C:\Users\Johnny B\Desktop\Operation CHAD\100-Character Sprites\100-Stone_test.aseprite"

%aseprite% %project% -b --sheet STONE_TEST.png --sheet-type rows --sheet-width 1000 --data sheetinfo.json --list-tags