put the 'outputsheetwithjson.bat' where you want aseprite to output the master sheets

it will not work out of the box, you need to change the paths to Aseprite executable and project file. right click on the 'outputsheetwithjson.bat' file, select edit/open with notepad.

there are two lines:

set aseprite="F:\Gamedev\GameMaker\Tools\Aseprite\Aseprite.exe"
set project="F:\Gamedev\GameMaker\Tools\Aseprite\projects\stone.aseprite"

the first is the path to your copy of Aseprite. to find yours, go to where Aseprite is installed, hold shift + right click on it, and select "Copy as path". replace the path in the batch file.

do the same thing with the project file, shift+right click, copy as path, and replace the project path with your own.

save the file, then double click to run it. where ever you put this bat file ('outputsheetwithjson.bat' ) is where the sprite sheet (sheet.png) and the json file (sheetinfo.json) will be output by Aseprite. then just load those into the game