# ClipboardInserter_html

**index.html:** A portable single-file HTML page for the clipboard-inserter browser add-on.   
**Clipboard Inserter Overlay Mode.ahk:** An autohotkey script that allows you to turn the Clipboard Inserter page into a transparent fullscreen overlay. And more.  

Tested on Firefox and Chromium.  
Made for personal use.  

## 🌐 Online version  
**https://onurtag.github.io/ClipboardInserter_html/**  

## 📝 Readme First  
**Recommended Fonts:**  
- Installing the following font family is not required but **highly recommended** for styling reasons:  
  - [Noto Sans JP font family by Google](https://fonts.google.com/specimen/Noto+Sans+JP)

**Clipboard Inserter extension settings:**  
- The following Clipboard Inserter settings are not required but **highly recommended** for performance reasons:  
  - element name: **pre**  
  - container selector: **#textlines**  

**Prepending mode:**  
- You can switch to prepending mode by setting the "Scroll" button to top (↑)  
(Or you can just use a [modified Clipboard Inserter extension](https://github.com/Onurtag/clipboard-inserter))  

**General tips:**  
- Hover the buttons on the page to read their descriptions.  
- Both appending and prepending should work for all buttons and functionality. (Even if you don't have a modified Clipboard Inserter)  

**Auto-hide Yomichan popups feature:**  
- For this feature to work, you need to configure the following yomichan setting:  
  - Set the security option **"Use a secure container around popups"** to **off**  
- This feature is enabled by default.  

**Keyboard shortcuts:**  
- Alt + S: Toggle Editing  
- A few more shortcuts can be enabled in the settings menu.  

**More detailed explanation of features:**  
- [Read the comments here](https://github.com/Onurtag/ClipboardInserter_html/blob/master/index.html#L11)  

## ☯️ Overlay Mode  

### - **Step-by-step instructions (just overlay mode)**  
<details>
<summary>
<i>Click here to expand</i>
</summary>

**Prerequisite:**  
Start the clipboard inserter page in popup mode using one of these methods:
- *Method 1: Autohotkey script*  
  1. Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
  2. Scroll down to the block that starts with ```"customStart1:"```
     - Comment the MsgBox line by adding a ```;``` in front of it
     - Uncomment ONE of the run lines (by removing the ```;``` ) and modify those two paths (browser exe path and clipboard inserter html path) for your setup.  
  3. Now you can right click the tray icon of the ahk script and start the clipboard inserter page in popup mode.  
- *Method 2: Popup extension*  
  1. Install one of these extensions: [Firefox](https://addons.mozilla.org/en-US/firefox/addon/popup/), [Chrome](https://chrome.google.com/webstore/detail/separate-window/cbgkkbaghihhnaeabfcmmglhnfkfnpon) (or any other popup extension)  
  2. Open ```index.html``` or the [online page](https://onurtag.github.io/ClipboardInserter_html/) and turn it into a popup.  

**Instructions:**  
**1.** Clone the repo or download and extract it to a folder.  
**2.** Install Autohotkey.  
**4.** On the popup clipboard inserter page:  
  - Set auto scroll to top (↑)  
  - Enable overlay mode hotkey in the settings menu  

**5.** Run the ahk script ```"Clipboard Inserter Overlay Mode.ahk"``` if you haven't already.  
**6.** While the clipboard inserter page is active, press the following keys:  
   - ```Ctrl + Alt + 8``` (enables always on Top)  
   - ```Ctrl + Alt + 9``` (enables transparency)  
   - ```Ctrl + Alt + 0``` (or '}' key) (enables overlay mode)  
   - ```F11``` (makes the window fullscreen)  

**7.** Done.  
If you have done everything correctly, you should now have a transparent Clipboard Inserter overlay.  
You can hover each button to read its description.  
Toggle the ```Text Visibility``` button if you want to hide the text until you need it. You can hover the same button to temporarily show the text until a new line is added.  

</details>

### - **Step-by-step instructions (overlay mode with Magpie)**  
<details>
<summary>
<i>Click here to expand</i>
</summary>

**Problems with this setup:**  
- You will be seeing two cursors. A bigger cursor for the game and a regular cursor for the overlay.  
- Your mouse is not confined to the window which means that you can accidently click a window outside the game window.  
You can use TSolidBackground (google it) to block this if you want (don't change the Alt+T keybind)  

**Prerequisite:**  
Start the clipboard inserter page in popup mode using one of these methods:
- *Method 1: Autohotkey script*  
  1. Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
  2. Scroll down to the block that starts with ```"customStart1:"```
     - Comment the MsgBox line by adding a ```;``` in front of it
     - Uncomment ONE of the run lines (by removing the ```;``` ) and modify those two paths (browser exe path and clipboard inserter html path) for your setup.  
  3. Now you can right click the tray icon of the ahk script and start the clipboard inserter page in popup mode.  
- *Method 2: Popup extension*  
  1. Install one of these extensions: [Firefox](https://addons.mozilla.org/en-US/firefox/addon/popup/), [Chrome](https://chrome.google.com/webstore/detail/separate-window/cbgkkbaghihhnaeabfcmmglhnfkfnpon) (or any other popup extension)  
  2. Open ```index.html``` or the [online page](https://onurtag.github.io/ClipboardInserter_html/) and turn it into a popup.  

**Instructions:**  
**1.** Clone the repo or download and extract it to a folder.  
**2.** Install Autohotkey and download Magpie.  
**4.** On the popup clipboard inserter page:  
  - Set auto scroll to top (↑)  
  - Enable overlay mode hotkey in the settings menu  

**5.** Setup Magpie for overlay mode (instructions are for Magpie v0.8.1):  
  - Copy Magpie to another folder and use the new folder if you want to keep your old settings and use Magpie normally.  
  - Change the magpie zoom ```"Hotkey"``` from F11 to something else (or don't)  
  - Settings > Application tab: Enable ```"Restore fullscreen when source window regains focus"```  
  - Settings > Zoom tab: Disable ```"Adjust cursor speed while zoomed"``` and ```"Confine the cursor in 3D games"```  
  - Settings > Zoom tab: Set ```"Zoom factor of the cursor"``` to ```"1.25x"``` and ```"Interpolation mode"``` to ```"bilinear"```  
  - Settings > Advanced tab: Enable ```"Show debugging options"``` and enable ```"Breakpoint mode"```  

**6.** Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
  - Under ```"Window Hooker Options"``` replace ```"GAME TITLE"``` with the window title of your game.  

**8.** Run the ahk script ```"Clipboard Inserter Overlay Mode.ahk"``` or restart it.  
**9.** While the clipboard inserter page is active, press the following keys:  
   - ```Ctrl + Alt + 8``` (enables always on Top)  
   - ```Ctrl + Alt + 9``` (enables transparency)  
   - ```Ctrl + Alt + 0``` (or '}' key) (enables overlay mode)  
   - ```F11``` (makes the window fullscreen)  

**10.** Right click the tray icon of the ahk script and click ```"Show Hooker Menu"``` and then click ```"Start Hook"```.  
**11.** Use your Magpie hotkey to zoom your game.  

**12.** Done.  
If you have done everything correctly, you should now have a transparent Clipboard Inserter overlay on top of Magpie.  
You can interact with the overlay and use Alt + Tab to switch to another window and back.  
You can hover each button to read its description.  
Toggle the ```Text Visibility``` button if you want to hide the text until you need it. You can hover the same button to temporarily show the text until a new line is added.  

</details>

<br>

For more info about overlay mode read the source code comments of the [example overlay mode ahk script](https://github.com/Onurtag/ClipboardInserter_html/blob/master/Clipboard%20Inserter%20Overlay%20Mode.ahk).  

