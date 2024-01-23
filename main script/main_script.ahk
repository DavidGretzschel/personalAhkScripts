; preamble stuff
   #SingleInstance, Force ; only one instance at a time
   Menu, Tray, Icon, %A_ScriptDir%\script_icon.png ; loading a script icon
; include section
   #include, %A_ScriptDir%\classes.ahk
   #include, %A_ScriptDir%\classes\programClass.ahk
   #include, %A_ScriptDir%\classes\webPageClass.ahk
   #include, %A_ScriptDir%\classes\folderClass.ahk
   #include, %A_ScriptDir%\classes\oneNoteClass.ahk
   #Include, %A_ScriptDir%\customHotkeys\F13OneNote.ahk
   #include, %A_ScriptDir%\customHotkeys\F14Programs.ahk
   #Include, %A_ScriptDir%\customHotkeys\F15Folders.ahk
   #Include, %A_ScriptDir%\customHotkeys\F16winTitleSetter.ahk
   #Include, %A_ScriptDir%\other_programs.ahk