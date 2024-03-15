#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\icons\launcherIcon.png
DetectHiddenWindows, On
SetTitleMatchMode, 2

; starting/ending main-drag script
; reserves F17 number-row, F-keys, enter, backspace and 
; kill-script does not work, odd

F17 & 1::launchScript(A_ScriptDir . "\mainScript\mainScript.ahk")
    F17 & F1::WinClose, mainScript.ahk - AutoHotkey
F17 & 2::launchScript(A_ScriptDir . "\dragScript\windowDrag.ahk")
    F17 & F2::WinClose, windowDrag.ahk - AutoHotkey
F17 & 3::launchScript(A_ScriptDir . "\windowSpyScript\windowSpy.exe")
    F17 & F3::WinClose, Window Spy
F17 & 4::launchScript(A_ScriptDir . "\experimental script\experimentalScript.ahk")
    F17 & F4::WinClose, experimentalScript.ahk - AutoHotkey
F17 & 5::launchScript(A_ScriptDir . "\oneNoteScript\oneNoteScript.ahk")
    F17 & F5::WinClose, oneNoteScript.ahk - AutoHotkey
F17 & 6::launchScript(A_ScriptDir . "\superMemoScript\superMemoScript.ahk")
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

launchScript(scriptPath) {
   Run, % scriptPath,, UseErrorLevel, pid
   if ErrorLevel {
       MsgBox, % "Failed to launch script: " . scriptPath
       return false
   } else {
       ShowLaunchAnimation(scriptPath)
       ; Wait a moment for any potential error dialogs to appear
       Sleep, 1000
       ; Check if the script's process is still running
       if (!ProcessExist(pid)) {
           ;MsgBox, % "Script launched but may have encountered an error: " . scriptPath
           return false
       }
   }
   return true
}
; Function to show a visual indication for script launch
ShowLaunchAnimation(scriptName) {
   ToolTip, % "Launching " . scriptName . "..."
   Sleep, 1000  ; Adjust sleep time to control how long the tooltip shows
   ToolTip  ; Turn off the tooltip
}

ProcessExist(pid) {
   Process, Exist, %pid%
   return ErrorLevel ? true : false
}