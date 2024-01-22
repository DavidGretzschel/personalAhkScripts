#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\launcher_icon.png
DetectHiddenWindows, On
SetTitleMatchMode, 2

; starting/ending main-drag script
; reserves F17 number-row, F-keys, enter, backspace and 
; kill-script does not work, odd

F17 & 1::Run, C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\main script\main_script.ahk
    F17 & F1::WinClose, main_script.ahk - AutoHotkey
F17 & 2::Run, C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\window_drag.ahk
    F17 & F2::WinClose, window_drag.ahk - AutoHotkey
F17 & 3::Run, C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\windowSpy.exe
    F17 & F3::WinClose, Window Spy

F17 & 4::Run, C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\experimental.ahk
    F17 & F4::WinClose, experimental.ahk - AutoHotkey

F17 & 5::Run, C:\Program Files\Alt-Tab Terminator\AltTabTer.exe
   F17 & F5::WinClose, ahk_pid 1072





   ;F17 & F5::WinClose, C:\Program Files\Alt-Tab Terminator\AltTabTer.exe
   

;F17 & 4::Run, C:\Users\david\OneDrive\scripts\main script\old v1 script\TheBrain12_assistant\keystroke visualization\KEYSTROKE_VIZ.ahk
    ;F17 & F4::WinClose, KEYSTROKE_VIZ.ahk - AutoHotkey */

; self-kill and self-reload
F17 & Enter::Reload,
F17 & Backspace::ExitApp