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