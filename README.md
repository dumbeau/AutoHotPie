# AutoHotPie

Radial menus for Windows, designed for digital artists and macro enthusiasts, sponsored by unemployment :)

![2022-AHP-Update---Square-220224-2](https://user-images.githubusercontent.com/36665762/155584629-fd483863-2005-420f-ab3e-44369fe01884.gif)

# Installation

Go to [releases](https://github.com/dumbeau/AutoHotPie/releases), download the latest version and run the installer and install it. Currently, there will be bugs so use at your own risk.  I hope putting a circle on your screen brings you as much happiness as it brings me... shut up that's not lame.

# General Usage

### Macro mouses

Some macro mice don't send their key_up events when their key is released (Logitech MX Master, Elecom mice).  You can either use the hover or click modes, or you can use the\ Back (4th Click) or Forward (5th Click) and then they will work as they typically respond to the button release.  If you want more menus, consider setting either of these to the Profile Enable Key and pie menus to bare keys to create a pie menu macro layer.

### Pen Tablets

In order to activate a pie menu with a pen button, go into your pen software and set a key to send '4th click / Forward' or '5th Click / Back'. You may use any other key, but other keys may not send their 'key-up' signal when the pen button is released. You can then set the Pie menu key to respond to '4th click / Forward' or '5th Click / Back' in the 'Special Keys' menu.

### External controllers or Remotes

Most bluetooth controllers can have their buttons assigned to a keystroke in their software, however most do not send their 'key-up' signal when their button is released. To handle this, use the 'Hover over all selections' launch mode. The pie menu will stay open after the button is pressed, and selections can be hovered over to be selected.

# Develop with this Codebase
[AutoHotKey v1.1](https://www.autohotkey.com/) needs to be installed to run and compile AHK scripts.

### Setting up the electron app
1. Download this codebase and unzip.
2. Run `npm install` in the project directory.
3. Use the included vscode configurations to run the electron app or the AutoHotKey Pie Menus script respectively.  Otherwise, use `npm run start`.

### Modifying the HTML/CSS
The HTML/CSS is supplied by [Bootstrap Studio](https://bootstrapstudio.io/) (I know I'm a piece of garbage).
1. Open "AutoHotPie Settings.bsdesign"
2. Go the `Settings > Export`, and set the export destination to the `/src` directory of this codebase.
3. Save and Click `Export` or press `Ctrl+E`.
4. Run the electron app, `npm run build` will run a script to update the index.html that comes out of bs studio.
5. Whenever you make changes to the bsdesign file, Save and Export your changes.

### Create installer
Just run `npm run build-installer` and the installers will be created in the `/dist` directory.

# Questions?
[Discord](https://discord.gg/yszsupzR7d)
