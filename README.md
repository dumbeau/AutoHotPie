# AutoHotPie (Pie-Menus-V2)

When you first run it, press "r" to launch the intial demonstration menu.
Radial menus for Windows, designed for digital artists or macro enthusiasts, sponsored by unemployment :)

Here is a video that should describe how to work with this and the settings file as I am still working on a settings GUI for this:
https://youtu.be/IkGbTvAIKnQ

There is an annotated version of the settings file at ~\Resources\settings - annotated.txt



# Per-monitor DPI scaling not working?
This works in the exe version, but to enable your AHK's per-monitor DPI awareness, you'll need to download a resource editor in order to edit AutoHotKey.exe:
http://www.angusj.com/resourcehacker/

You'll need to modify AutoHotkey.exe (likely at C:\Program Files\AutoHotkey).  Open AutoHotkey.exe in Resource hacker, open up Manifest > 1 : 1033 and find the <dpiAware>true</dpiAware> tag and change "true" to "true/pm".  Compile, and save the executable.  You'll see AutoHotkey_Original.exe appear next to AutoHotkey.exe, you can save AutoHotkey_Original.exe if something breaks or delete it.  I haven't noticed this change to affect anything else in AutoHotKey so you should be able to use any other scripts you use.

