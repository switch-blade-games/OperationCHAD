@echo off

REM ---ASEPRITE EXECUTABLE PATH---
set aseprite="F:\Gamedev\GameMaker\Tools\Aseprite\Aseprite.exe"

REM ---STONETOSS ASE PROJECT PATH---
set ase101="D:\Git\OperationCHAD\Sprites\characters\aseprite_files\101-Stone_sheet.aseprite"
REM ---PUMPKINFACE ASE PROJECT PATH---
set ase102="D:\Git\OperationCHAD\Sprites\characters\aseprite_files\102-Pumpkin_sheet.aseprite"
REM ---FOXFORD ASE PROJECT PATH---
set ase103="D:\Git\OperationCHAD\Sprites\characters\aseprite_files\103-Fox_sheet.aseprite"
REM ---YOLOSWAG ASE PROJECT PATH---
set ase104="D:\Git\OperationCHAD\Sprites\characters\aseprite_files\104-Yolo_sheet.aseprite"

REM ---EXPORT ALL FOUR CHARACTERS---
%aseprite% %ase101% -b --sheet 101-Stone_sheet.png --sheet-type rows --sheet-width 1000 --data 101-Stone_info.json --list-tags
%aseprite% %ase102% -b --sheet 102-Pumpkin_sheet.png --sheet-type rows --sheet-width 1000 --data 102-Pumpkin_info.json --list-tags
%aseprite% %ase103% -b --sheet 103-Fox_sheet.png --sheet-type rows --sheet-width 1000 --data 103-Fox_info.json --list-tags
%aseprite% %ase104% -b --sheet 104-Yolo_sheet.png --sheet-type rows --sheet-width 1000 --data 104-Yolo_info.json --list-tags