class program {
   __New(program_name, shortcut_path) {
      this.program_name := program_name
      this.shortcut_path := shortcut_path
      }
   open() {
      if(window_match(this.program_name, "infix"))
            window_activate(this.program_name, "infix")
      else
         open_run(this.shortcut_path)
   }
}

class webpage {
   __New(pagename, shortcut_path) {
      this.pagename := pagename
      this.shortcut_path := shortcut_path
   }
   open() {
      if(window_match(this.pagename,"infix"))
            window_activate(this.pagename, "infix")
      else 
         Sleep,100
         ; open_run(this.shortcut_path)
         Run, % this.shortcut_path
   }
}
; utilities functions, make a class for those
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

;webpages
;global Image_Search := new webpage("Image Search", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=noifhjlnpghodejompkdoaglbieachnk")
;global EnGer_dictionary := new webpage("EnGer-dictionary", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=lpdndlihbmbcgigicemogacedkpiionl")
;global Amazon_orders := new webpage("Amazon_orders", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=obfpkkifcflgkglhhnjmhadimbdpjmlc")

;programs
; WhatsApp is differently implemented at the moment
global Discord := new program("Discord","C:\Users\david\AppData\Local\Discord\Update.exe --processStart Discord.exe")
global GHub := new program("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
global AhkScripts := new program("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK helper scripts\AHK helper scripts.code-workspace")
global Notepad := new program("temp text buffer","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK targets\temp text buffer.txt")   
;global Java := new program("Java_relearning (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\projects\JavaAndCotlin\Java_relearning.code-workspace")
;global JavaLearning := new program("JavaLearning.pdf (SECURED) - Adobe Acrobat Pro (64-bit)","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\projects\JavaAndCotlin\JavaLearning.pdf")
;global parSystemDefinition := new OneNote_page("icon library - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Knowledge%20Space&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={07F43C0D-19B5-4C15-A2F1-FD7A41CBF463}&object-id={63A29DA9-2966-498D-BB81-1952932824D6}&18")
; a bit inelegant, as "unsaved" and the asterisk lead to silly complication...
;global Spotify := new program("Spotify","C:\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe")