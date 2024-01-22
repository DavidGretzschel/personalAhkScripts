; preamble stuff
   #SingleInstance, Force ; only one instance at a time
   Menu, Tray, Icon, %A_ScriptDir%\script_icon.png ; loading a script icon
; include section
   #include, %A_ScriptDir%\objects.ahk
   #include, %A_ScriptDir%\classes.ahk
   #Include, %A_ScriptDir%\F13OneNote.ahk
   #include, %A_ScriptDir%\F14Programs.ahk
   #Include, %A_ScriptDir%\F15Folders.ahk
   #Include, %A_ScriptDir%\F16winTitleSetter.ahk
   #Include, %A_ScriptDir%\F19experimental.ahk
   #Include, %A_ScriptDir%\other_programs.ahk