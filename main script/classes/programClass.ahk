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
;objects
global WhatsApp := new program("WhatsApp","C:\Users\david\AppData\Local\WhatsApp\WhatsApp.exe")
global Telegram := new program("Telegram","C:\Users\david\AppData\Roaming\Telegram Desktop\Telegram.exe")
global Discord := new program("Discord","C:\Users\david\AppData\Local\Discord\Update.exe --processStart Discord.exe")
global Photoshop := new program("Adobe Photoshop 2023","C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe")
global GHub := new program("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
global AhkScripts := new program("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK helper scripts\AHK helper scripts.code-workspace")
global Java := new program("Java_relearning (Workspace) - Visual Studio Code", "C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\projects\JavaAndCotlin\Java_relearning.code-workspace")
global JavaLearning := new program("JavaLearning.pdf (SECURED) - Adobe Acrobat Pro (64-bit)","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\projects\JavaAndCotlin\JavaLearning.pdf")
global Notepad := new program("temp text buffer","C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources\AHK helper scripts\shortcuts\temp text buffer.txt")   
global parSystemDefinition := new OneNote_page("icon library - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Knowledge%20Space&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={07F43C0D-19B5-4C15-A2F1-FD7A41CBF463}&object-id={63A29DA9-2966-498D-BB81-1952932824D6}&18")
;global sight := new OneNote_page("Sight - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/CW%2032%20rework.one#Sight&section-id={397EEADC-FC3A-4A06-BCB5-F80BE36D3011}&page-id={6F828C45-BCF7-442F-97ED-6A17CEAD1A9C}&end")
; a bit inelegant, as "unsaved" and the asterisk lead to silly complication...
;global Spotify := new program("Spotify","C:\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe")
;global intelliJ
;global webStorm