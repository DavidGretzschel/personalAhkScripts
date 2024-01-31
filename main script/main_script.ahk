#SingleInstance, Force ; only one instance at a time
Menu, Tray, Icon, %A_ScriptDir%\script_icon.png ; loading the script icon
; one class for all objects, screw inheritance for now
class Shortcut {
   __New(windowName, shortcutPath) {
      this.windowName := windowName
      this.shortcutPath := shortcutPath
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

;OneNote Pages
   global EventHorizon := new Shortcut("event horizon - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#event%20horizon&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={E8E54099-3F9E-48E9-99ED-AE2AFB3FCDB3}&end")
   global TempOneNote := new Shortcut("temp OneNote buffer - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#temp%20OneNote%20buffer&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={A299E734-FDE2-4672-9A8D-F38DB96675FA}&end")
   global KeySpaceRegistry := new Shortcut("keyspace registry - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#keyspace%20registry&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={21E2ED5F-AD11-41EA-8993-ADA15C2CCE75}&end")

   global StructuredMind := new Shortcut("The Structured Mind System - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#The%20Structured%20Mind%20System&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={D4DD5B5D-2ACF-40F5-9555-1ACBC04F95C6}&end")
   global NetworkModeling := new Shortcut("Conscious Network Modeling, Shifting, Init - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#Conscious%20Network%20Modelling%20+%20Shifting&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={BDB9DD31-0FA0-4D75-B694-DDF5301C4E4A}&end")
;programs
   global WhatsApp := new Shortcut("WhatsApp","explorer.exe shell:appsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App")
   global Discord := new Shortcut("Discord","C:\Users\david\AppData\Local\Discord\Update.exe --processStart Discord.exe")
   
   global DepartmentOfMysteries := new Shortcut("C:\Users\david\USERLAND...\DepartmentOfMysteries.kdbx - KeePass","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\passwords\DepartmentOfMysteries.kdbx")
   global Notepad := new Shortcut("temp text buffer","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK targets\temp text buffer.txt")   
   global Honeycam := new Shortcut("Honeycam", "C:\Program Files\Honeycam\Honeycam.exe")
   global LogitechGHub := new Shortcut("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
   global AhkScripts := new Shortcut("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\AHK helper scripts.code-workspace")
;webapps
   global GoogleImages := new shortcut("Google Images", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=mncpghpmkopgmjlgjcmokgmhkflifgph")
   global EnglishGermanDictionary := new shortcut("English German Dictionary", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=ojacioocednnlojnikigjajbbkckfbca")
   global AmazonOrders := new shortcut("Amazon Orders", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=obfpkkifcflgkglhhnjmhadimbdpjmlc")
;folders
   global CDrive := new Shortcut("C:\","C:\")
   global SuperMemo := new Shortcut("C:\SuperMemo\","C:\SuperMemo\")
   global USERLAND_LOCAL := new Shortcut("C:\Users\david\\USERLAND_LOCAL\","C:\Users\david\\USERLAND_LOCAL\")
   global USERLAND_CLOUD := new Shortcut("C:\Users\david\USERLAND_CLOUD\","C:\Users\david\USERLAND_CLOUD\")

   global UserlandOneDrive := new Shortcut("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND")
   global Inbox := new Shortcut("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\inbox","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\inbox")
   global Reference := new Shortcut("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\reference","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\reference")
   global Resources := new Shortcut("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources")
   
   global Startup := new Shortcut("C:\Users\david\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup","C:\Users\david\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
   global ProgramFilesfolder := new Shortcut("C:\Program Files","C:\Program Files")
   global ProgramFiles86 := new Shortcut("C:\Program Files (x86)","C:\Program Files (x86)")
   global User := new Shortcut("C:\Users\david","C:\Users\david")
   global AppData := new Shortcut("C:\Users\david\AppData","C:\Users\david\AppData") 

;Hotkeys
;OneNote
   F13 & F1::WinSetTitle, A,, today
   F13 & F2::WinSetTitle, A,, tomorrow
   F13 & F3::WinSetTitle, A,, ubermorrow
   
   F13 & 1::WinActivate, today
   F13 & 2::WinActivate, tomorrow
   F13 & 3::WinActivate, ubermorrow
   F13 & 4::EventHorizon.pageOpen()

   F13 & q::TempOneNote.pageOpen()
   F13 & w::KeySpaceRegistry.pageOpen()
   F13 & e::StructuredMind.pageOpen()
   F13 & r::NetworkModeling.pageOpen()
   
; ; Programs + Webappps
   ; singleton apps on F-row
   F14 & F1::WhatsApp.programOpen()
   F14 & F2::Discord.programOpen()
   F14 & F3::Spotify.programOpen()
   F14 & F4::Honeycam.programOpen()
   F14 & F5::LogitechGHub.programOpen()

   ;multi-instance apps on qwerty
   F14 & q::Notepad.programOpen()
   F14 & w::AhkScripts.programOpen()
   F14 & e::DepartmentOfMysteries.programOpen()
   
   ;webapps on homerow
   F14 & a::GoogleImages.programOpen()
   F14 & s::EnglishGermanDictionary.programOpen()
   F14 & d::AmazonOrders.programOpen()
   
; folders
; big important data folders on homerow
   F15 & 1::CDrive.folderOpen()
   F15 & 2::SuperMemo.folderOpen()
   F15 & 3::USERLAND_LOCAL.folderOpen()
   F15 & 4::USERLAND_CLOUD.folderOpen()
   
; OneDrive stuff here
   F15 & q::UserlandOneDrive.folderOpen()
   F15 & w::Inbox.folderOpen()
   F15 & e::Reference.folderOpen()
   F15 & r::Resources.folderOpen()
;system-internal stuff here
   F15 & z::Startup.folderOpen()
   F15 & x::ProgramFilesfolder.folderOpen()
   F15 & c::ProgramFiles86.folderOpen()
   F15 & v::User.folderOpen()
   F15 & b::AppData.folderOpen()