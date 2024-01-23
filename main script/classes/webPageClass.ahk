;class
class webpage {
   __New(pagename, shortcut_path) {
      this.pagename := pagename
      this.shortcut_path := shortcut_path
   }
   open() {
      if(window_match(this.pagename,"infix"))
            window_activate(this.pagename, "infix")
      else 
         Sleep,100
         ; open_run(this.shortcut_path)
         Run, % this.shortcut_path
   }
}
;objects
