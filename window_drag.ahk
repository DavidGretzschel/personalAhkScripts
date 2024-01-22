; David's notes
; removed all the undesired and slow middle-click and double alt functionality
; have to live with the left/right-click release not being sufficient, need to release alt
; see if I can fix that in the first three lines of loop at some point...
; from here:
; https://www.autohotkey.com/board/topic/10618-autohotkey-and-synergy-down-keys-appear-up/
; -------------------------------------------------------------------------------
; This script was inspired by and built on many like it
; in the forum. Thanks go out to ck, thinkstorm, Chris,
; and aurelian for a job well done.

; Change history:
; November 07, 2006: Optimized resizing code in !RButton, courtesy of bluedawn.
; February 05, 2006: Fixed double-alt (the ~Alt hotkey) to work with latest versions of AHK.

; The Double-Alt modifier is activated by pressing
; Alt twice, much like a double-click. Hold the second
; press down until you click.
;
; The shortcuts:
;  Alt + Left Button  : Drag to move a window.
;  Alt + Right Button : Drag to resize a window.
;
; You can optionally release Alt after the first
; click rather than holding it down the whole time.

; This is the setting that runs smoothest on my
; system. Depending on your video card and cpu
; power, you may want to raise or lower this value.
Menu, Tray, Icon, %A_ScriptDir%\drag_icon.png
#SingleInstance, force
; DAVID: some kind of OS-performance-dependent setting? a tradeoff in responsiveness?
SetWinDelay,0
; DAVid: Affects MouseGetPos, Click, and MouseMove/Click/Drag now use screen coordinates
; second arg defaults to "screen" anyway...
; which is stupid, since if the entire line was ommited, it would defautl to "relative" to active window
CoordMode, Mouse, Screen
return
; end of preamble

;DAVID: just maps an action to alt+left
#IfWinNotActive, ahk_class Age of Empires ||: Definitive Edition
   !LButton::
   ; Get the initial mouse position and window id, and
   ; abort if the window is maximized.
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id

   ; winget... uses the sub-command MinMax on ahk_id %KDE_id%, which is the third output_var
   ; if window was maximized, KDE_Win gets 1 (or -1 if minimized, but that makes no sense), 0 if neither min nor max
   WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
   ; legacy-if, not if (expression). So if this is 0, it will not end block early
   ; return acts like a "break" here? Yes. But break is only for loops. Also break supports labels?
   If KDE_Win
      return
   ; DAVID:
   ; Get the initial window position.
   ; there is no WinGet-subcommand for position apparently. Maybe WinGet only is for
   ; attributes with  single output vars?
   ; the charming triple comma... so very readable :)
   ; this tells you that the third and fourth output variables (width and height) are not called
   ; the fifth one however is desired again... and is a WinTitle
   ; but WinTitle? That could mean so many differnt things! So we specify the ahk-criterion...
   ; so this is basically a kind of subcommand. Instead of having a function for getting the exact attribute
   ; we want. This is not exactly OOP as you know it, kid :)
   WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
   ; DAVID: not in OTB-style which apparently... is what you assumed was  the default
   ; aside: I really hate having stuff to the right of a closing brace
   Loop
   {
      ; DAVID: Ideally I would uncomment those 3, but the obvious async-solution for left-click as well
      ; does not work. So this "feature" is a compromise to work with Synergy. For now.
      ;GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
      ;If KDE_Button = U
      ;   break
      ; so thats why this was a nontrivial fix. Having to use DLL-calls. And I guess AHK is just a wrapper.
      ; AHK is so that you don't have to do all those DLL-calls. But if you need to do something like...
      ; use this hyperspecific deep windows-functionality: https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getasynckeystate
      ; then you go that route. I think the documentation even goes into mouse-buttons? Might explain why the above does not work.
      ; anyway... those DLL-calls are C++ functions
      ; https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
      ; and I guess instead of 0x12, it could have called VK_MENU... which is a confusing name for alt imo
      ; note that in the original C++ you do not separate type from argument name with commas. Huh
      ; what is this 0x8000 anding about? No clue. Ah. So ordinarly this would not return a zero. Bitmask op
      if (!(DllCall("GetAsyncKeyState", int, 0x12) & 0x8000))
         break
      
      ;if not DllCall("GetAsyncKeyState", int, 0x12) & 0x8000
      ;     break
      ; David:
      ; this is all about variable-updating... relative mouse movements added/subtracted to windowPos-output vars
      ; then using the (former) window-output vars to push them into WinMove
      ; not quite sure on the details as it reads horribly... probabl because var names all have annoying
      ; KDE-mention
      MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
      KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
      KDE_Y2 -= KDE_Y1
      KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
      KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
      WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
   }
   ; DAVID:
   ; I think this return is technically not needed? I'm not sure? My own hotkey-defs are always oneliners..
   ; actually, this return might be totally necessary!
   return

   ; mostly same stuff as before. Uses if (expression) instead of legacy now. Odd
   ; some kind of crazy stuff that seems unnecessary/inelegant with the mouse regions?
   ; hmm... maybe
   !RButton::
   ; Get the initial mouse position and window id, and
   ; abort if the window is maximized.
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
   If KDE_Win
      return
   ; Get the initial window position and size.
   WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
   ; Define the window region the mouse is currently in.
   ; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
   If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
      KDE_WinLeft := 1
   Else
      KDE_WinLeft := -1
   If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
      KDE_WinUp := 1
   Else
      KDE_WinUp := -1
   Loop
   {
      ;GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
      ;If KDE_Button = U
      ;  break
      if not DllCall("GetAsyncKeyState", int, 0x12) & 0x8000
         break
      ; --------------------
      MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
      ; Get the current window position and size.
      WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
      KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
      KDE_Y2 -= KDE_Y1
      ; Then, act according to the defined region.
      WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                              , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                              , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                              , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
      KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
      KDE_Y1 := (KDE_Y2 + KDE_Y1)
   }
   return