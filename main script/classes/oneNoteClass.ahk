;class
class OneNote_page {
   __New(pagename, shortcut_path) {
      this.pagename := pagename
      this.shortcut_path := shortcut_path
   }
   open() {
      if(window_match(this.pagename, "exact")){
            window_activate(this.pagename, "exact")
         } else if(window_match("ahk_exe ONENOTE.EXE", "exact"))
            {
            window_activate("ahk_exe ONENOTE.EXE", "exact")
            Send, ^m
            Sleep, 250
            Run, % this.shortcut_path
            }
         else
            Run, % this.shortcut_path
   }
}
;objects
global eventHorizon := new OneNote_page("event horizon - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/JVNJ/Central.one#event%20horizon&section-id={09BD1D1D-B55B-43CF-B3D4-1BD049F53541}&page-id={E8E54099-3F9E-48E9-99ED-AE2AFB3FCDB3}&end")


;legacy objects
;global icon_library := new OneNote_page("icon library - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/bag%204%20org%20templates.one#icon%20library&section-id={4FF23552-3DB1-418A-AB0D-4A2BEF8F0B3F}&page-id={A6098B45-44C2-4E70-A168-383B6DE26A64}&end")
;global inventory := new OneNote_page("inventory (current) - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#inventory%20(current)&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={1EB101E6-3434-45D4-839C-7FE73F0E3776}&end")
;global openingHours := new OneNote_page("opening hours - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#opening%20hours&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={A95DBF9F-4D98-4CFF-81C4-59C40ECBC86B}&end")
;global tempONbuffer := new OneNote_page("temp OneNote buffer - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/inbox.one#temp%20OneNote%20buffer&section-id={DA311FF8-F48A-48FA-A3E2-08B92ABE0AFA}&page-id={076846F2-CDF1-4BB6-B8EC-FC80A3AA7678}&end")
;global knowledgeSpace := new OneNote_page("Computational Knowledge Space - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#Knowledge%20Space&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={07F43C0D-19B5-4C15-A2F1-FD7A41CBF463}&end")
;global systemDefinition := new OneNote_page("system definition - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#system%20definition&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={48797675-632E-4EFD-9163-3E881C52CBB3}&end")
;global codeOfConduct := new OneNote_page("code of conduct - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#code%20of%20conduct&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={DB205FF7-8126-4209-94EE-FADB649316B4}&end")
;global continuityAssurance := new OneNote_page("continuity assurance - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#continuity%20assurance&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={B58634BA-F69F-4B64-8F6C-81D20B33AB0E}&end")
;global shoppingList := new OneNote_page("shopping list - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#shopping%20list&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={398640AC-D0B3-4C8F-BC4E-F4DD2C1EFD40}&end")
;global restInTheLight := new OneNote_page("rest in the light - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/MAPS.one#rest%20in%20the%20light&section-id={9BBD148C-41C3-4B97-BA02-886C2434B4F2}&page-id={EC3FA1B8-FADB-43C2-9C5A-80741D707D11}&end")
;global ON_attention := new OneNote_page("Attention main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Attention.one#Attention%20main%20page&section-id={438437C6-E0E7-4AAC-9793-98CDAEF92B0A}&page-id={CCFEB25D-7AAB-4345-8CAD-13FF953F0B8A}&end")
;global ON_awareness := new OneNote_page("Awareness main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Awareness.one#Awareness%20main%20page&section-id={6158A4E1-F4A6-456E-B921-5566F8F10327}&page-id={850233FE-E8E5-4BF6-8BC7-24E8BED4C5EC}&end")
;global ON_lesser_awareness := new OneNote_page("lesser Awareness main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Awareness%20lesser.one#lesser%20Awareness%20main%20page&section-id={8295096F-A3A5-49F0-AE64-548D63D0D883}&page-id={440A22ED-B2AC-4D2F-B087-A5865C172116}&end")