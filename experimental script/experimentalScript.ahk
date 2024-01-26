#`::SwitchToNextWindowInApp()

SwitchToNextWindowInApp() {
    WinGet, active_id, ID, A
    if (active_id = "")
        return

    ; Corrected syntax for WinExist and WinGet commands
    if !WinExist("ahk_id " . active_id)
        return

    WinGet, active_pid, PID, "ahk_id " . active_id
    WinGet, active_class, Class, "ahk_id " . active_id
    WinGet, idList, List, "ahk_pid " . active_pid
    
    foundSelf := false
    Loop, % idList {
        id := idList%A_Index%

        ; Corrected syntax for WinGetClass command
        WinGetClass, thisClass, "ahk_id " . id
        if (foundSelf && thisClass = active_class && !IsMinimized(id)) {
            WinActivate, "ahk_id " . id
            return
        }
        if (id = active_id) {
            foundSelf := true
        }
    }

    ; If the script hasn't activated another window, start from the first again
    Loop, % idList {
        id := idList%A_Index%

        ; Corrected syntax for WinGetClass command
        WinGetClass, thisClass, "ahk_id " . id
        if (thisClass = active_class && !IsMinimized(id)) {
            WinActivate, "ahk_id " . id
            return
        }
    }
}

IsMinimized(WinID) {
    ; Corrected syntax for WinGet command
    WinGet, MinMax, MinMax, "ahk_id " . WinID
    return MinMax = -1
}
