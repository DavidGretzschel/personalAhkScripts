

; better written (supposedly) alt-drag only version of script for learning
; nicer variable names perhaps?
;-------------------------------------------------
; Window dragging via alt+lbutton                -
; Author: Lasmori (email AT lasmori D0T com)     -
;-------------------------------------------------

; DAVID: I disagree with this whitespace
; way better var-names already
; spaces behind commas help readability! Same code so far though.
; not calling it KDE_win is win in my book! Makes far more sense.
; I guess greater or smaller than 0. Why not !=? Ah... they both mean the same. Got it.
; also stupid legacy if
!LButton::

; this is already default! Though it might make sense to specify, if other parts of larger
; script determine non-relative movement for the mouse
CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

; Return if the window is maximized or minimized
; uhm... legacy if again? WTF is this <>0 business?
if window_minmax <> 0
{
  return
}

; I don't think this line makes any sense at all
CoordMode, Mouse, Screen
SetWinDelay, 0

; DAVID: Well that looks a lot shorter! Well, mainly because it does not have my comments :)
loop
{
  ; exit the loop if the left mouse button was released
  ; compare:
/* 
   GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
   If KDE_Button = U
      break 
*/
; without legacy if, this might be a oneliner though, I think
   ; anyway

  if !GetKeyState("LButton", "P")
  {
    break
  }

  ; move the window based on cursor position
  ; David: I'm not sure I get the CoordMode-switch here... actually
  ; to reverse that unnecessary line in the middle?!
  ; maybe she did not know that the scope of CoordMode is only within hotkey definition
  ; I once didn't know either :)
  ; Maybe it's... meant for WinMove... which inexplicably always uses absolute coordinates
  MouseGetPos, cur_x, cur_y
  WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}

return

!RButton::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
; because theres no function-equivalent to WinGet, we cannot turn this all into a oneliner
WinGet, window_minmax, MinMax, ahk_id %window_id%

; Return if the window is maximized or minimized
if window_minmax <> 0
{
  return
}

CoordMode, Mouse, Screen
; David: Okay I get it now. Makes sure that you can drag without pause
; I suppose -1 would make the process "greedy". Could be fun to try. Fast enough though
; if I had turned on window animations, I'd need a higher delay probably
SetWinDelay, 0

loop
{
  ; exit the loop if the left mouse button was released
  ; so... is GetKeyState a variable? Or a function... or a function call with output?
  ; ah right. Its a function-call! We are in OOP again, thank goodness.
  ; but legacy if. Bah. Revisit above where I wanted a oneliner...
  if !GetKeyState("RButton", "P")
  {
    break
  }

  ; move the window based on cursor position
  MouseGetPos, cur_x, cur_y
  WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}

return
; oh wait... I get it. This code moves with either mouse button!
; silly. Redundant. Ugh. Whatever. Time to rewrite this!