#SingleInstance, Force
Menu, Tray, Icon, %A_ScriptDir%\..\icons\oneNoteScriptIcon.png

class Pen{
   static verticalButtonPos := 70
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
}
class Shape{
   static line := 70
   static arrow := 80
   static biArrow := 100
}

buttonClicker(target){
   CoordMode, Mouse, Client
   MouseGetPos, originalPosX, originalPosY
   MouseClick,, target, Pen.verticalButtonPos
   MouseMove, originalPosX, originalPosY
}

F16 & 1::pageLinkGetter()

pageLinkGetter(){
   Send,^!g
   Sleep, 200
   Send, {AppsKey}
   Sleep, 1000
   Send,l
   Sleep, 500
   Send, {Escape}
   ; Split the clipboard content into lines.
   Clipboard := Clipboard
   ClipboardAllLines := StrSplit(Clipboard, "`n")
   SecondLine := ClipboardAllLines[2]
   Clipboard := SecondLine
}
shapeClicker(shape){
   Send, !2
   Sleep, 500
   buttonClicker(shape)
}


penClicker(color){
   Send, !1
   buttonClicker(color)
   Sleep, 100
   Send, {Escape}
}
F16 & q::penClicker(Pen.redPen)
F16 & w::penClicker(Pen.yellowPen)
F16 & e::penClicker(Pen.greenPen)
F16 & r::penClicker(Pen.bluePen)
F16 & t::penClicker(Pen.orangePen)
F16 & a::penClicker(Pen.tealPen)
F16 & s::penClicker(Pen.purplePen)
F16 & d::penClicker(Pen.brownPen)
F16 & f::penClicker(Pen.whitePen)

F16 & z::shapeClicker(Shape.line)
F16 & x::shapeClicker(Shape.arrow)
F16 & c::shapeClicker(Shape.biArrow)

#IfWinActive, ahk_exe ONENOTE.EXE
; hotkey merging
   ^+[::Send, !+-
   ^+]::Send, !`{+}
#IfWinActive