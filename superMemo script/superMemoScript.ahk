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

; SuperMemo_integration below
#If WinActive("ahk_exe sm19.exe")
      ^+o::Toolbar.buttonClicker(Toolbar.concept_select_box)
      ^!o::Toolbar.buttonClicker(Toolbar.concept_rootset_button)
      ^!a::SuperMemo.new_item_child()
      ^!e::SuperMemo.new_item_sibling()
      ; key remapping
      
      enter::
      ControlGetFocus, activeControl, ahk_class TElWind ahk_exe sm18.exe
      if (InStr(activeControl, "Internet Explorer_Server"))
         Send,+{Enter}
      else
         Send, {Enter}
      return 
      ; something about the question window, auto-answer
#If

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