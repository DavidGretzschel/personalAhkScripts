; F13 OneNote Bulbasaur
   ; add an array here for the days, then just always remove the first entry
   ; 26.07.2023, 27.07.2023, 28.07.2023, 29.07.2023, 30.07.2023, 31.07.2023, 01.08.2023, 02.08.2023, 03.08.2023,04.08.2023, 05.08.2023, 06.08.2023, 07.08.2023, 08.08.2023, 09.08.2023
   global tempONbuffer := new OneNote_page("temp OneNote buffer - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/inbox.one#temp%20OneNote%20buffer&section-id={DA311FF8-F48A-48FA-A3E2-08B92ABE0AFA}&page-id={076846F2-CDF1-4BB6-B8EC-FC80A3AA7678}&end")
   global knowledgeSpace := new OneNote_page("Computational Knowledge Space - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Knowledge%20Space&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={07F43C0D-19B5-4C15-A2F1-FD7A41CBF463}&end")
   global today := new OneNote_page("26.07.2023 - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Today&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={210977FF-764D-4850-9AC8-33417E7AD1DF}&end")
   global tomorrow := new OneNote_page("27.07.2023 - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Tomorrow&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={6E9C15ED-4589-4528-B118-847B944A893F}&end")
   global ubermorrow := new OneNote_page("28.07.2023 - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Ubermorrow&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={10998081-21C3-4340-AE9A-9842C60D08DC}&end")
   global systemDefinition := new OneNote_page("system definition - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#system%20definition&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={48797675-632E-4EFD-9163-3E881C52CBB3}&end")
   global codeOfConduct := new OneNote_page("code of conduct - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#code%20of%20conduct&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={DB205FF7-8126-4209-94EE-FADB649316B4}&end")
   global continuityAssurance := new OneNote_page("continuity assurance - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#continuity%20assurance&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={B58634BA-F69F-4B64-8F6C-81D20B33AB0E}&end")

   global shoppingList := new OneNote_page("shopping list - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#shopping%20list&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={398640AC-D0B3-4C8F-BC4E-F4DD2C1EFD40}&end")
   global restInTheLight := new OneNote_page("rest in the light - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#rest%20in%20the%20light&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={EC3FA1B8-FADB-43C2-9C5A-80741D707D11}&end")

; F14 programs
   global WhatsApp := new program("WhatsApp","C:\Users\david\AppData\Local\WhatsApp\WhatsApp.exe")
   global Telegram := new program("Telegram","C:\Users\david\AppData\Roaming\Telegram Desktop\Telegram.exe")
   global Discord := new program("Discord","C:\Users\david\AppData\Local\Discord\Update.exe --processStart Discord.exe")
   global Photoshop := new program("Adobe Photoshop 2023","C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe")
   global GHub := new program("Logitech G HUB","C:\Program Files\LGHUB\lghub.exe")
   ; a bit inelegant, as "unsaved" and the asterisk lead to silly complication...

   ;global Spotify := new program("Spotify","C:\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe")
   ;global intelliJ
   ;global webStorm

   global icon_library := new OneNote_page("icon library - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/bag%204%20org%20templates.one#icon%20library&section-id={4FF23552-3DB1-418A-AB0D-4A2BEF8F0B3F}&page-id={A6098B45-44C2-4E70-A168-383B6DE26A64}&end")
   global inventory := new OneNote_page("inventory (current) - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#inventory%20(current)&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={1EB101E6-3434-45D4-839C-7FE73F0E3776}&end")
   global openingHours := new OneNote_page("opening hours - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#opening%20hours&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={A95DBF9F-4D98-4CFF-81C4-59C40ECBC86B}&end")
   global AhkScripts := new program("AHK helper scripts (Workspace) - Visual Studio Code", "C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\AHK helper scripts.code-workspace")
   global Java := new program("Java_relearning (Workspace) - Visual Studio Code", "C:\Users\david\OneDrive\USERLAND\projects\JavaAndCotlin\Java_relearning.code-workspace")
   global JavaLearning := new program("JavaLearning.pdf (SECURED) - Adobe Acrobat Pro (64-bit)","C:\Users\david\OneDrive\USERLAND\projects\JavaAndCotlin\JavaLearning.pdf")
   global Notepad := new program("temp text buffer","C:\Users\david\OneDrive\USERLAND\resources\AHK helper scripts\shortcuts\temp text buffer.txt")   
   global parSystemDefinition := new OneNote_page("icon library - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Knowledge%20Space&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={07F43C0D-19B5-4C15-A2F1-FD7A41CBF463}&object-id={63A29DA9-2966-498D-BB81-1952932824D6}&18")
   ;global sight := new OneNote_page("Sight - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/CW%2032%20rework.one#Sight&section-id={397EEADC-FC3A-4A06-BCB5-F80BE36D3011}&page-id={6F828C45-BCF7-442F-97ED-6A17CEAD1A9C}&end")

; F15 folders
   
   global programFilesFolder := new folder("C:\Program Files")
   global programFiles86Folder := new folder("C:\Program Files (x86)")
   global inbox := new folder("C:\Users\david\OneDrive\USERLAND\inbox")
   global attention := new folder("C:\Users\david\OneDrive\USERLAND\attention projects")
   global awareness := new folder("C:\Users\david\OneDrive\USERLAND\awareness projects")
   global lesser_awareness := new folder("C:\Users\david\OneDrive\USERLAND\lesser awareness projects")
   global reference := new folder("C:\Users\david\OneDrive\USERLAND\reference")
   global resources := new folder("C:\Users\david\OneDrive\USERLAND\resources")
   global userland := new folder("C:\Users\david\OneDrive\USERLAND")
   global CDrive := new folder("C:")
   global startup := new folder("C:\Users\david\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
   global OneDrive := new folder("C:\Users\david\OneDrive")
   global User := new folder("C:\Users\david")
   global AppData := new folder("C:\Users\david\AppData") 