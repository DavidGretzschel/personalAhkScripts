#SingleInstance, Force
#Persistent
Menu, Tray, Icon, %A_ScriptDir%\..\icons\experimentIcon.png
firstToneActive := false
thirdToneActive := false

; Activate first tone deadkey mode
^!+-::firstToneActive := true
; Activate third tone deadkey mode
^!+^::thirdToneActive := true

#If (firstToneActive)
    a::SendTone("0101"), firstToneActive := false
    e::SendTone("0113"), firstToneActive := false
    i::SendTone("012B"), firstToneActive := false
    o::SendTone("014D"), firstToneActive := false
    u::SendTone("016B"), firstToneActive := false
    +a::SendTone("0100"), firstToneActive := false
    +e::SendTone("0112"), firstToneActive := false
    +i::SendTone("012A"), firstToneActive := false
    +o::SendTone("014C"), firstToneActive := false
    +u::SendTone("016A"), firstToneActive := false
#If

#If (thirdToneActive)
    a::SendTone("01CE"), thirdToneActive := false
    e::SendTone("011B"), thirdToneActive := false
    i::SendTone("01D0"), thirdToneActive := false
    o::SendTone("01D2"), thirdToneActive := false
    u::SendTone("01D4"), thirdToneActive := false
    +a::SendTone("01CD"), thirdToneActive := false
    +e::SendTone("011A"), thirdToneActive := false
    +i::SendTone("01CF"), thirdToneActive := false
    +o::SendTone("01D1"), thirdToneActive := false
    +u::SendTone("01D3"), thirdToneActive := false
#If

SendTone(toneCode) {
    Send, {U+%toneCode%}
}