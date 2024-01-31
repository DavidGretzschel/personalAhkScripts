;class
class Shortcut {
   __New(pagename, shortcut_path) {
      this.pagename := pagename
      this.shortcut_path := shortcut_path
   }
   open() {
      SetTitleMatchMode, 3
      if(WinExist(this.pagename)){
            WinActivate, % this.pagename
         }
      else if(WinExist("ahk_exe ONENOTE.EXE")){
         WinActivate, ahk_exe ONENOTE.EXE
         Send, ^m
         Sleep, 250
         Run, % this.shortcut_path
         }
      else Run, % this.shortcut_path
   }
   programOpen() {
      SetTitleMatchMode, 1 ; infix-mode
      if(WinExist(this.pagename))
         WinActivate, % this.pagename
      else {
         MsgBox, Opening %Shortcut_path%
         open_run(this.shortcut_path)
      }
   }
}
;objects

global eventHorizon := new Shortcut("event horizon - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#event%20horizon&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={E8E54099-3F9E-48E9-99ED-AE2AFB3FCDB3}&end")
global tempONbuffer := new Shortcut("temp OneNote buffer - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#temp%20OneNote%20buffer&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={A299E734-FDE2-4672-9A8D-F38DB96675FA}&end")

foreground_toggle(){ 
   Winset, Alwaysontop, , A
}
tall_slender_window(){
   WinMove, A,,,, 780, 1000
}
midsize_window(){
   WinMove, A,,,, 800, 800
}

quick_audio_switcher(){
   SetKeyDelay, 400
   Send,#b
   Send, {Up}{Up}{Up}{Up}{Enter}{Tab}{Up}{Enter}
   ; do I need a version for each direction? Lame
}
;programs
global WhatsApp := new Shortcut("WhatsApp","explorer.exe shell:appsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App")
global Discord := new Shortcut("Discord","C:\Users\david\AppData\Local\Discord\Update.exe --processStart Discord.exe")
global Notepad := new Shortcut("temp text buffer","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK targets\temp text buffer.txt")   
global Honeycam := new Shortcut("Honeycam", "C:\Program Files\Honeycam\Honeycam.exe")
global LogitechGHub := new Shortcut("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
global AhkScripts := new Shortcut("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\GitHub\personalAhkScripts\AHK helper scripts.code-workspace")

;webpage apps
global GoogleImages := new shortcut("Google Images", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=mncpghpmkopgmjlgjcmokgmhkflifgph")
global EnglishGermanDictionary := new shortcut("English German Dictionary", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=ojacioocednnlojnikigjajbbkckfbca")
global AmazonOrders := new shortcut("Amazon Orders", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=obfpkkifcflgkglhhnjmhadimbdpjmlc")