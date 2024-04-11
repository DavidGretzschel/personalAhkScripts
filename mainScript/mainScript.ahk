#SingleInstance, Force ; only one instance at a time
#WinActivateForce
Menu, Tray, Icon, %A_ScriptDir%\..\icons\mainScriptIcon.png ; loading the script icon
; one class for all objects, screw inheritance for now

class Shortcut {
    __New(windowName, shortcutPath) {
        this.windowName := windowName
        this.shortcutPath := shortcutPath
    }

   programOpen() {
      SetTitleMatchMode, 2 ; infix match
      this.forceOpen()
   }
      
   folderOpen() {
      SetTitleMatchMode, 3 ; exact match
      this.forceOpen()
    }  
   forceOpen(){
   if (WinExist(this.windowName)) {
      ;MsgBox, I am here and this is good
      WinActivate, % this.windowName
      Sleep, 500
      ;WinWaitActive, % this.windowName, , 2
      this.fallBackActivate()
   } else {
      Run, % this.shortcutPath
      Sleep, 3000
      ; if the shorcut does not exist, this would be infinitely recursive
      this.fallBackActivate()
   }
   }
   fallBackActivate() { 
    if (!WinActive(this.windowName)) {
        ; The window is not active, try to force it.
        DllCall("SetForegroundWindow", "ptr", WinExist(this.windowName))
    }
   }
}

class Page extends Shortcut {
   __New(windowName, shortcutPath) {
      base.__New(windowName, shortcutPath)
      this.windowName := this.windowName . " - OneNote"
   }
   pageOpen() {
      SetTitleMatchMode, 3 ; exact match
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
   ; 2 joboffers that I must pagify
   ;https://accounts.google.com/gsi/iframe/select?client_id=1033099286690-k1a94lepbq5sf9pqhkd4deq6mjvcii94.apps.googleusercontent.com&auto_select=true&ux_mode=popup&ui_mode=card&as=YlFObcO%2BDySZP7VetidpTg&channel_id=8cb82e53d82a61ff59782ad967d7a07aa39d3b0ec69484e464884f985548384f&origin=https%3A%2F%2Fwww.jobvector.deugly objects to hide
   ;https://www.get-in-it.de/jobsuche/p233829?utm_source=arbeitsagentur&utm_medium=cpc&utm_campaign=launch-basic
   ;global IconLibrary := new Page("Icon Library", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#Icon%20Library&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={A6098B45-44C2-4E70-A168-383B6DE26A64}&end")
   global Hackerrank := ("Dashboard", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=iackfappejkhdonhmcekibmnbodkccki")
   global SofwareTester := new Page("Software Tester", "https://www.get-in-it.de/jobsuche/p233829?utm_source=arbeitsagentur&utm_medium=cpc&utm_campaign=launch-basic")
   global TempOneNote := new Page("Temp OneNote Buffer", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#temp%20OneNote%20buffer&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={A299E734-FDE2-4672-9A8D-F38DB96675FA}&end")
   global AhkScripts := new Shortcut("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\AHK helper scripts.code-workspace")
   global TextBuffer := new Shortcut("textBuffer.txt","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\textBuffer.txt")   
   global Gemini := new shortcut("Gemini", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=gdfaincndogidkdcdkhapmbffkckdkhn")
   global ChatGPT := new shortcut("ChatGPT", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=jckaldkomadaenmmgladeopgmfbahfjm")
   global BundesAgenturfuerArbeit := new shortcut("Bundesagentur", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=bogngfooocbbbhlaobopnokllnfjipoi")
   global GMail := new Shortcut("Gmail", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=fmgjjmmmlfnkbppncabfkddbjimcfncm")
   global Honeycam := new Shortcut("Honeycam", "C:\Program Files\Honeycam\Honeycam.exe")
; number row for system
   F13 & 1::TextBuffer.programOpen() ; replace with decent Vim instance ASAP
   F13 & 2::TempOneNote.pageOpen()
   F13 & 3::IconLibrary.pageOpen()
; top for skills
   F13 & q::AhkScripts.programOpen()
   ; Python Collatz
   F13 & e::Hackerrank.programOpen()
   ; Ubuntu
; homerow for writing
   F13 & a::IncrementalWriting.pageOpen()
   F13 & s::ChatGPT.programOpen()
   F13 & d::Gemini.programOpen()
; botrow for jobsearch
   F13 & z::BundesAgenturfuerArbeit.programOpen()
   F13 & x::GMail.programOpen()
   F13 & c::SofwareTester.programOpen()

/* SO I can ruthlessly delete stuff
;F13 OneNote Pages
;F14 programs and webapps
   global WhatsApp := new Shortcut("WhatsApp","explorer.exe shell:appsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App")
   global Spotify := new Shortcut("Spotify", "SpotifyAB.SpotifyMusic_zpdnekdrzrea0/Spotify.exe")
   
   global LogitechGHub := new Shortcut("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
   
   global DepartmentOfMysteries := new Shortcut("C:\Users\david\USERLAND...\DepartmentOfMysteries.kdbx - KeePass","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\passwords\DepartmentOfMysteries.kdbx")

   global GoogleImages := new shortcut("Google Images", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=mncpghpmkopgmjlgjcmokgmhkflifgph")
   global AmazonOrders := new shortcut("Amazon Orders", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=obfpkkifcflgkglhhnjmhadimbdpjmlc")
   
   global PublicIntentions := new shortcut("public Intentions", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=dklkdpbpoohkbafhodcckffbbjiddnkg")
; F15 folders
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

; F13 new style
   ;system number row
   ;skill top row
      ; IntelliJ
      ; HackerRank and such
      ; HackerRank and such
   ;writing + AI mid row
      ; Honeycam, probably
      ; Substack and such
      ; specific AI instances with the right context
   ;jobsearch bottom row
      ; StepStone, AGA, Xing, LinkedIn and such, pilotvector, getin, those two exact places I'm supposed to get
      ; StepStone, AGA, Xing, LinkedIn and such
      ; StepStone, AGA, Xing, LinkedIn and such
   
; F14 Programs + Webappps
   ; singleton apps on F-row
   F14 & F1::WhatsApp.programOpen()
   F14 & F2::Spotify.programOpen()
   F14 & F3::LogitechGHub.programOpen()

   ;multi-instance apps on qwerty
   F14 & e::DepartmentOfMysteries.programOpen()
   
   ;webapps on homerow
   ;F14 & d::AmazonOrders.programOpen()
   ;F14 & g::EnglishGermanDictionary.programOpen()
   
; F15 folders and setting-changers
   ; personal data folders on number row
   F15 & 1::UserlandOneDrive.folderOpen()
   F15 & 2::Inbox.folderOpen()
   F15 & 3::Reference.folderOpen()
   F15 & 4::Resources.folderOpen()
   F15 & 5::USERLAND_LOCAL.folderOpen()
   F15 & 6::USERLAND_CLOUD.folderOpen()
   ; system data folders on homerow
   F15 & q::CDrive.folderOpen()
   F15 & w::Startup.folderOpen()
   F15 & e::ProgramFilesfolder.folderOpen()
   F15 & r::ProgramFiles86.folderOpen()
   F15 & t::User.folderOpen()
   F15 & y::AppData.folderOpen()
; functions
   ToggleResolution() {
      static HiRes := true
      if (HiRes) {
         ; Change to resolution 2k
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" setdisplay 2560 1440 32
      } else {
         ; Change to resolution 4k
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" nircmd.exe setdisplay 3840 2160 32
      }
      HiRes := !HiRes
   }

   ToggleAudioDevice() {
      static toggle := 0
      toggle := !toggle  ; Switch between 0 and 1.
      
      if (toggle) {
         ; Set to Logitech G935/G933s Gaming Headset
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" setdefaultsounddevice "Headset" 1
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" setdefaultsounddevice "Headset" 2
      } else {
         ; Set to Realtek High Definition Audio
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" setdefaultsounddevice "LaptopSpeakers" 1
         Run, "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\mainScript\nircmd\nircmd.exe" setdefaultsounddevice "LaptopSpeakers" 2 
      } 
      }
*/