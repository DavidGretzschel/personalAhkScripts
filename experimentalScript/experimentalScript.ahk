#SingleInstance, Force
#Persistent
Menu, Tray, Icon, %A_ScriptDir%\..\icons\experiment_icon.png


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
       if !ProcessExist(pid) {
           MsgBox, % "Script launched but may have encountered an error: " . scriptPath
           return false
       }
   }
   return true
}

ShowLaunchAnimation(scriptName) {
   ToolTip, % "Launching " . scriptName . "..."
   Sleep, 1000  ; Adjust sleep time to control how long the tooltip shows
   ToolTip  ; Turn off the tooltip
}

ProcessExist(pid) {
   Process, Exist, %pid%
   return ErrorLevel ? true : false
}