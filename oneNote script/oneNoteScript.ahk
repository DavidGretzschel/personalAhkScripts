#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\..\icons\oneNoteScriptIcon.png
class Pen{
   static verticalButtonPos := 70 ; 30
   ; 50 pixels horizontal distance between pens
   static redPen := 80 ; 200
   static yellowPen := 130 ; 260
   static greenPen := 180 ; 290
   static bluePen := 230 ; 330
   static orangePen := 280 ; 370
   static tealPen := 330 ; 410
   static purplePen := 380 ; 450
   static brownPen := 430 ; 490
   static whitePen := 480 ; 540
   static blackPen := 530 ; 560
   static line := 10
   static arrow := 30
   static biArrow := 50
}

buttonClicker(target){
   CoordMode, Mouse, Client
   MouseGetPos, originalPosX, originalPosY
   MouseClick,, target, Pen.verticalButtonPos
   MouseMove, originalPosX, originalPosY
}

#If WinActive("ahk_class Net UI Tool Window")
      q::buttonClicker(Pen.redPen)
      w::buttonClicker(Pen.yellowPen)
      e::buttonClicker(Pen.greenPen)
      r::buttonClicker(Pen.bluePen)
      t::buttonClicker(Pen.orangePen)
      a::buttonClicker(Pen.tealPen)
      s::buttonClicker(Pen.purplePen)
      d::buttonClicker(Pen.brownPen)
      f::buttonClicker(Pen.whitePen)
      ;q::Pen.buttonClicker(Pen.line)
      ;w::Pen.buttonClicker(Pen.arrow)
      ;e::Pen.buttonClicker(Pen.biArrow)
#If
