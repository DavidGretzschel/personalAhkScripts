class Shortcut {
   __New(windowName, shortcutPath) {
      this.windowName := windowName
      this.shortcutPath := shortcutPath
   }
   programOpen() {
      if(WinExist(this.windowName))
         WinActivate, % this.windowName
      else Run, % this.shortcutPath
   }
   folderOpen() {
      SetTitleMatchMode, 3
      if(WinExist(this.windowName))
         WinActivate, % this.windowName
      else Run, % this.shortcutPath
      }
}

class Page extends Shortcut {
   __New(windowName, shortcutPath) {
      base.___New()
      this.windowName := this.windowName . " - OneNote"
   }
   pageOpen() {
      SetTitleMatchMode, 3
      if(WinExist(this.windowName))
         WinActivate, % this.windowName
      else if(WinExist("ahk_exe ONENOTE.EXE")){
         WinActivate, ahk_exe ONENOTE.EXE
         Send, ^m
         Sleep, 250
         Run, % this.shortcutPath
         }
      else Run, % this.shortcutPath
   }
}

global EventHorizon := new Shortcut("Event Horizon - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#event%20horizon&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={E8E54099-3F9E-48E9-99ED-AE2AFB3FCDB3}&end")

F13 & 4::EventHorizon.pageOpen()