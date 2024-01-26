#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\icons\launcher_icon.png
DetectHiddenWindows, On
SetTitleMatchMode, 2

; starting/ending main-drag script
; reserves F17 number-row, F-keys, enter, backspace and 
; kill-script does not work, odd

F17 & 1::Run, %A_ScriptDir%\main script\main_script.ahk
    F17 & F1::WinClose, main_script.ahk - AutoHotkey
F17 & 2::Run, %A_ScriptDir%\drag script\window_drag.ahk
    F17 & F2::WinClose, window_drag.ahk - AutoHotkey
F17 & 3::Run, %A_ScriptDir%\window spy script\windowSpy.exe
    F17 & F3::WinClose, Window Spy
F17 & 4::Run, %A_ScriptDir%\experimental script\experimentalScript.ahk
    F17 & F4::WinClose, experimentalScript.ahk - AutoHotkey
F17 & 5::Run, %A_ScriptDir%\oneNote Script\oneNoteScript.ahk
    F17 & F5::WinClose, oneNoteScript.ahk - AutoHotkey
F17 & 6::Run, %A_ScriptDir%\superMemo Script\superMemoScript.ahk
    F17 & F6::WinClose, superMemoScript.ahk - AutoHotkey
;F17 & 5::Run, C:\Program Files\Alt-Tab Terminator\AltTabTer.exe
;   F17 & F5::WinClose, ahk_pid 1072

; Run Alt-Tab Terminator
F17 & 9::Run, "C:\Program Files\Alt-Tab Terminator\AltTabTer.exe"

; Close Alt-Tab Terminator
; currently won't work unless I run the metaScript as an admin.
F17 & F9::
    ; Find the window associated with Alt-Tab Terminator
    Process, Exist, AltTabTer.exe
    ; The PID of the process is stored in the built-in variable ErrorLevel
    pid := ErrorLevel
    if (pid != 0) ; If the PID is found
    {
        ; Use the PID to close the window
        WinClose, ahk_pid %pid%
    }
return

; self-kill and self-reload
F17 & Enter::Reload,
F17 & Backspace::ExitApp

; Age2
#If WinActive("Age of Empires II: Definitive Edition")
      F4::F5
#If