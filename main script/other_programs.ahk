; should be renamed to contextHotkeys
#If WinActive("Age of Empires II: Definitive Edition")
      F4::F5
      #If



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
; since the classes only store values and otherwise do not differ in implementation, one might as well make that a utility function then. And we can probably make this a tool-clicky context and load objects, instead of using the static variables
#If WinActive("ahk_class Net UI Tool Window")
      1::OneNotePenPicker.buttonClicker(OneNotePenPicker.redPen)
      2::OneNotePenPicker.buttonClicker(OneNotePenPicker.yellowPen)
      3::OneNotePenPicker.buttonClicker(OneNotePenPicker.greenPen)
      4::OneNotePenPicker.buttonClicker(OneNotePenPicker.bluePen)
      5::OneNotePenPicker.buttonClicker(OneNotePenPicker.orangePen)
      6::OneNotePenPicker.buttonClicker(OneNotePenPicker.tealPen)
      7::OneNotePenPicker.buttonClicker(OneNotePenPicker.purplePen)
      8::OneNotePenPicker.buttonClicker(OneNotePenPicker.brownPen)
      9::OneNotePenPicker.buttonClicker(OneNotePenPicker.whitePen)
      
      ; deprecated, because it conflicts with other UI that uses that specific window-class
      ; search, note-select. Possibly all UI, actually.
      ; also inconsistent/confusing, since now numbers work in search as intended?
      ; shapes. Some of them would need another vertical offset though... own class? Eh. Probably add function argument
      ;q::OneNotePenPicker.buttonClicker(OneNotePenPicker.line)
      ;w::OneNotePenPicker.buttonClicker(OneNotePenPicker.arrow)
      ;e::OneNotePenPicker.buttonClicker(OneNotePenPicker.biArrow)
      ; trying to get a cheaper copy going for font color
      ;a::OneNoteColorPicker.buttonClicker(30)
      ;s::OneNoteColorPicker.buttonClicker(60)
      ;d::OneNoteColorPicker.buttonClicker(70)
      ;z::OneNoteColorPicker.buttonClicker(130)
      #If

#If WinActive("ConceptSelectBox")
      !1::ConceptSelectBox.buttonClicker(ConceptSelectBox.viewElement)
      !2::ConceptSelectBox.buttonClicker(ConceptSelectBox.moveElement)
      !3::ConceptSelectBox.buttonClicker(ConceptSelectBox.linkElement)
      !4::ConceptSelectBox.buttonClicker(ConceptSelectBox.select_default_concept)
      !5::ConceptSelectBox.buttonClicker(ConceptSelectBox.view_last_in_hook)
      !6::ConceptSelectBox.buttonClicker(ConceptSelectBox.close_concept_select)
      #If