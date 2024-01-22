; object classes for shortcut-use
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
      ; day-variable goes from +12 to -12, 0 represents today, put onto the `-key
      open_day(day){
         ; does not really work like that. It be complicated.
         FormatTime, OutputVar, dd.mm.yyyy
         ; math to get the appropriate date
         OutputVar = OutputVar + day
         ; I need to define shortcut_path... why shortcut_path? what a weird name
         shortcut_path = generator(day); some kind of list-lookup needs to be done here
         ; the list... is like an enum? I need to preset all the dates, basically.
         ; an Array? Sure, why not. I guess, the starting date of this mess gets me the... 13th entry. So the first time I want to run it, I make the zeroeth entry 12 days ago.
         ; and then I write all the links there
         ; then array position is day + date
         ; at the minimum, I would need to define... a lot.
         ; But I could do the entire year in advance like that though.
         ; And it would be reasonably sensible.
         ; try going for a month? That would already mean, I give up my current system
         ; which.... no it would not. I can hack that together for a bit.
         
         ; pretty much the thing above, except...
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

   class folder {
      __New(path) {
         this.path := path
         }
      open() {
         if(window_match(this.path, "exact"))
            window_activate(this.path, "exact")
         else {
            Run, % this.path
            }
         }
      }
   class OneNotePenPicker{
      static verticalButtonPos := 30
      ; 50 pixels horizontal distance between pens
      static redPen := 80
      static yellowPen := 130
      static greenPen := 180
      static bluePen := 230
      static orangePen := 280
      static tealPen := 330
      static purplePen := 380
      static brownPen := 430
      static whitePen := 480
      static blackPen := 530
      
      static line := 10
      static arrow := 30
      static biArrow := 50

      buttonClicker(target){
         CoordMode, Mouse, Client
         MouseGetPos, originalPosX, originalPosY
         MouseClick,, target, OneNotePenPicker.verticalButtonPos
         MouseMove, originalPosX, originalPosY
      }
      }
   class OneNoteColorPicker{
      static verticalButtonPos := 205
      ; 50 pixels horizontal distance between pens
    

      buttonClicker(target){
         CoordMode, Mouse, Client
         MouseGetPos, originalPosX, originalPosY
         MouseClick,, target, OneNoteColorPicker.verticalButtonPos
         MouseMove, originalPosX, originalPosY
      }
      }
   class Utilities{
      static stored_x := 0 
      static stored_y := 0
      store_screen_mouse_pos(){
         CoordMode, Mouse, Screen
         MouseGetPos, stored_x, stored_y
         Utilities.stored_x := stored_x
         Utilities.stored_y := stored_y
         CoordMode, Mouse, Client
      }
      restore_screen_mouse_pos(){
         CoordMode, Mouse, Screen
         MouseMove, Utilities.stored_x, Utilities.stored_y
         CoordMode, Mouse, Client
      }
   }
; helpful functions used by classes, I think
; should be merged with utilities, I believe
   open_run(program_name){
      Run, % program_name
      }

   window_activate(window_title, mode){
         Switch mode {
            Case "prefix":
               SetTitleMatchMode, 1
            Case "infix":
               SetTitleMatchMode, 2
            Case "exact":
               SetTitleMatchMode, 3
            Case "regex":
               SetTitleMatchMode, regex
            Default:
               SetTitleMatchMode, 2
            }
         WinActivate, % window_title
      }
   window_match(window_title, mode){
      ;Send, WIndow match successful
      Switch mode {
         Case "prefix":
            SetTitleMatchMode, 1
         Case "infix":
            SetTitleMatchMode, 2
         Case "exact":
            SetTitleMatchMode, 3
         Case "regex":
            SetTitleMatchMode, regex
         Default:
            SetTitleMatchMode, 2
         }
      Return WinExist(window_title)
      }

;standalone functions
; I think this ought to be a non-class utility class
   foreground_toggle(){ 
      Winset, Alwaysontop, , A ; this will inevitably conflict with alt+`-functionality of Alt tab terminator
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
      Send, {Up}{Up}{Enter}{Tab}{Up}{Enter}
      } 

;other variables I don't want to deal with right now
   ;global ON_attention := new OneNote_page("Attention main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Attention.one#Attention%20main%20page&section-id={438437C6-E0E7-4AAC-9793-98CDAEF92B0A}&page-id={CCFEB25D-7AAB-4345-8CAD-13FF953F0B8A}&end")
   ;global ON_awareness := new OneNote_page("Awareness main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Awareness.one#Awareness%20main%20page&section-id={6158A4E1-F4A6-456E-B921-5566F8F10327}&page-id={850233FE-E8E5-4BF6-8BC7-24E8BED4C5EC}&end")
   global ON_lesser_awareness := new OneNote_page("lesser Awareness main page - OneNote", "onenote:https://d.docs.live.net/0c2fc6153c0dbd75/Documents/Windows11_reboot/Awareness%20lesser.one#lesser%20Awareness%20main%20page&section-id={8295096F-A3A5-49F0-AE64-548D63D0D883}&page-id={440A22ED-B2AC-4D2F-B087-A5865C172116}&end")


   global Image_Search := new webpage("Image Search", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=noifhjlnpghodejompkdoaglbieachnk")
   global EnGer_dictionary := new webpage("EnGer-dictionary", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=lpdndlihbmbcgigicemogacedkpiionl")
   ; -------------- finances -------------- 
   global 1_Comdirect_balance := new webpage("Comdirect balance", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=lkcdcanfddbefakjklnmifnnncepgjld")
   global 2_Advanzia_balance := new webpage("Advanzia balance", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=mhbbjboeknjipfdhaeohlchnneoecifk")
   global 3_Consors_balance := new webpage("Consors balance", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=oikepikpcjoelhjbjbimjbojlmphimkl")
   global 4_Fyrst_balance := new webpage("Fyrst balance", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=bfdeeoejnkloejbkkfhomphhgjidokkn")
   global 5_DKB_balance := new webpage("DKB balance", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=acmikcjocccblbiibfdfjkghclpmmpip")
   global Amazon_orders := new webpage("Amazon_orders", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=obfpkkifcflgkglhhnjmhadimbdpjmlc")


; SuperMemo classes
   class Supermemo{
      KT_select(){
         Send, !c
      }
      new_item_child(){
         Supermemo.KT_select()
         Sleep, 1500
         KT.new_child()
         KT.back_to_Element()
      }
      new_item_sibling(){
         Supermemo.KT_select()
         Sleep, 200
         KT.new_sibling()
      }
      
   }
   class KT{
      jump_to_higher_branch(){
            Send,^{Up}
         }
      new_sibling(){
         KT.jump_to_higher_branch()
         KT.new_child()
      }
      new_child(){
         Send, {AppsKey}
         Sleep, 200
         Send, n
         Sleep, 200
         Send, i
         Sleep, 200
         Send, {Enter}
         KT.back_to_Element()
         Sleep, 100
         Send, q
      }
      back_to_Element(){
         Send, +{Escape}
      }

   }

   class Toolbar{
      static toolbar_y_coord := 10
      ; button x coordinates [client-mode]
      static concept_select_box := 820
      static concept_rootset_button := 790
      ; add any button you like here
      
      buttonClicker(button_x_coord){
         CoordMode, Mouse, Client
         WinActivate, ahk_class TElWind ;activates main window
         Utilities.store_screen_mouse_pos()
         MouseClick,,button_x_coord, Toolbar.toolbar_y_coord
         Utilities.restore_screen_mouse_pos()
      }
      }
; buttonclicker should probably be moved to class utilities
   ; ok ConceptSelectBox and OneNotePenClicker are absurd
   ; perhaps not. Conceptual overlap is accidental. The ON stuff is not SM associated.
   class ConceptSelectBox{
      ; this shifts all the time?
      ; was 655 before for 4k; 770 seems to work with 1080p
      static horizontal_button_pos := 655
      ; 30 pixels vertical distance between buttons
      static viewElement := 30
      static moveElement := 60
      static linkElement := 90
      static select_default_concept := 120
      static view_last_in_hook := 150
      static close_concept_select := 180
      
      buttonClicker(target){
         CoordMode, Mouse, Client
         MouseGetPos, originalPosX, originalPosY
         MouseClick,,ConceptSelectBox.horizontal_button_pos, target
         MouseMove, originalPosX, originalPosY
      }
      }

;stuff commented out
   ; bunch of cool util functions
   /* 
      activate_SuperMemo(){
         WinActivate, ahk_exe sm18.exe
         }
      assign_window(set_window_name){
         WinSetTitle, A, , %set_window_name%
         }


      
   */
; end jumpline