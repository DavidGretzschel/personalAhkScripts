class folder {
   __New(path) {
      this.path := path
      }
   open() {
      if(window_match(this.path, "exact"))
         window_activate(this.path, "exact")
      else {
         Run, % this.path
         }
      }
}
;objects
global programFilesFolder := new folder("C:\Program Files")
global programFiles86Folder := new folder("C:\Program Files (x86)")
global inbox := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\inbox")
global attention := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\attention projects")
global awareness := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\awareness projects")
global lesser_awareness := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\lesser awareness projects")
global reference := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\reference")
global resources := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND\resources")
global userland := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive\USERLAND")
global CDrive := new folder("C:")
global startup := new folder("C:\Users\david\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
global USERLAND_CLOUD := new folder("C:\Users\david\USERLAND_CLOUD\OneDrive")
global User := new folder("C:\Users\david")
global AppData := new folder("C:\Users\david\AppData") 