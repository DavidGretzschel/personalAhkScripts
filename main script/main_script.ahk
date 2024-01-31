; preamble stuff
#SingleInstance, Force ; only one instance at a time
Menu, Tray, Icon, %A_ScriptDir%\script_icon.png ; loading a script icon
; prefix titlematch, unless otherwise specified
SetTitleMatchMode, 2
; include section
#include, %A_ScriptDir%\..\shared utilities\sharedUtilities.ahk
#include, %A_ScriptDir%\classes\programClass.ahk
#include, %A_ScriptDir%\classes\folderClass.ahk
#include, %A_ScriptDir%\classes\oneNoteClass.ahk
#Include, %A_ScriptDir%\customHotkeys\F13OneNote.ahk
#include, %A_ScriptDir%\customHotkeys\F14Programs.ahk
#Include, %A_ScriptDir%\customHotkeys\F15Folders.ahk
; F16 is reserved for named windows of all kinds