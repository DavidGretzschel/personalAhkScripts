#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\..\icons\superMemoScriptIcon.png
; SM a morass of overly complex functions
   ; This function checks if the currently active control is Internet Explorer_Server2
   HtmlTextInput() {
      ControlGetFocus, focusedControl, A  ; Gets the control focus in the active window
      return (focusedControl == "Internet Explorer_Server1" || focusedControl == "Internet Explorer_Server2")
   }
   buttonClicker(button_x_coord, y_coord){
      CoordMode, Mouse, Client
      WinActivate, ahk_class TElWind ;activates main window
      MouseClick,,button_x_coord, y_coord
   }

   new_topic_sibling(){
      up_one_level()
      new_topic_child()
   }
   new_item_sibling(){
      up_one_level()
      KT_activate()
      Sleep, 100
      new_item_child()
   }

   new_item_child(){
      new_element_child()
      Send, i{Enter}
      Sleep, 50
      Element_activate()
      imposing_item_template()
   }

   new_topic_child(){   
      new_element_child()
      Send, t{Enter}
      Sleep, 50
      Element_activate()
      imposing_article_template()
   }
   new_concept_child(){
      new_topic_child()
      KT_activate()
      Sleep, 800
      make_concept()             
   }
   
   ; helpers
   KT_activate(){
      Send, !c
   }
   Element_activate(){
      Send, +{Escape}
   }
   
   up_one_level(){
      Send, ^{Up}
   }
   new_element_child(){
      Sleep, 200
      KT_activate()
      Sleep, 200
      new_element_menu()
   }
   new_element_menu(){
      Send, {AppsKey}
      Sleep, 100
      Send, n
      Sleep, 100
   }
   make_concept(){
      Send, ^k
   }
   apply_template_window(){
      Send,+^m
   }
   imposing_article_template(){
      apply_template_window()
      Send, {Enter}
   }
   imposing_item_template(){
      apply_template_window()
      Send, i{Enter}
   }

class TB{
   static y_coord := 10
   static concept_select_box := 820
}


class CSB{
   ; this shifts all the time?
   static horizontal_button_pos := 650
   static alternate_horizontal_button_pos := 780
   ; 30 pixels vertical distance between buttons
   static viewElement := 30
   static moveElement := 60
   static linkElement := 90
   static select_default_concept := 120
   static view_last_in_hook := 150
   static close_concept_select := 180
   vertButtonClicker(target){
      CoordMode, Mouse, Client
      MouseGetPos, originalPosX, originalPosY
      MouseClick,,CSB.horizontal_button_pos, target
      MouseMove, originalPosX, originalPosY
   }
}

; Set a timer to check for the window periodically. The number is the frequency in milliseconds.
SetTimer, PressEnterOnDialog, 50
PressEnterOnDialog:

winTitles := ["Question", "Image registry", "New concept group", "Information", "Error!"]
for index, title in winTitles
{
    IfWinActive, %title%
        Send, {Enter}
    else IfWinExist, %title%
    {
        WinActivate
        Send, {Enter}
        break  ; Stop checking once a match is found and action is taken
    }
}
return

; so these should always work. They have a specific context, but I'll rely on only clicking them then
#If WinActive("ahk_exe sm19.exe")
      ^!1::buttonClicker(TB.concept_select_box, TB.y_coord)
      ^!q::new_item_sibling()
      ^!w::new_topic_sibling()
      ^!a::new_item_child()
      ^!s::new_topic_child()
      ^!d::new_concept_child()
#If


#If HtmlTextInput()
   ; swapping enter with shift enter
   Enter::Send, +{Enter}
   +Enter::Send, {Enter}
   ; aligning OneNote bullets with SM bullets
   ^.::Send, ^+l
   ^+l::Return,
#If

#If WinActive("ConceptSelectBox")
   !1::CSB.vertButtonClicker(CSB.viewElement)
   !2::CSB.vertButtonClicker(CSB.moveElement)
   !3::CSB.vertButtonClicker(CSB.linkElement)
   !4::CSB.vertButtonClicker(CSB.select_default_concept)
   !5::CSB.vertButtonClicker(CSB.view_last_in_hook)
   !6::CSB.vertButtonClicker(CSB.close_concept_select)
#If