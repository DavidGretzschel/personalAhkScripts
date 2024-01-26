/*
; object classes for shortcut-use
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
*/





