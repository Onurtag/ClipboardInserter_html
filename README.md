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
- Check the settings menu for extra features. (Hover top right cog icon (⚙) -> click wrench icon (🔧))  
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

**Instructions:**  

1. Download the repo and extract the zip to a folder that contains the string: ```ClipboardInserter``` (for auto url detection)  

2. Install Autohotkey.  

3. Open a working chromeless clipboard inserter page with the following steps:  
   *(These instructions are for chromium browsers (e.g. vivaldi). On Firefox you need to use a seperate profile with userChrome.css modifications to get a fullscreen chromeless browser)*  
   1. Install [this modded clipboard inserter extension](https://github.com/Onurtag/clipboard-inserter) (for auto url detection)  
      - Manage the extension and enable ```"allow access to file URLs"```  
      - (recommended) Modify extension options for better performance:  
      i. Element name: ```pre```  
      ii. Container selector: ```#textlines```  
      iii. Timer interval: ```200```  
      iv. Detect url containing: ```ClipboardInserter```  
      v. Use prepend instead of append: ```Enabled```  
      
   2. Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
   3. Scroll down to the block that starts with ```"customStart1:"``` and update the Run line according to your environment.  
   4. Run the ahk script, right click its tray icon and select ```Start Clipboard Inserter (Chromeless)```  
   5. You should now have a working chromeless clipboard inserter page.  

4. Setup the chromeless clipboard inserter page:  
   - Set auto scroll to top (↑ button)  
   - Enable overlay mode hotkey in the settings menu (🔧 button)  

5. While the chromeless clipboard inserter page is active, press the following keys:  
   - ```Ctrl + Alt + 8``` (enables always on Top)  
   - ```Ctrl + Alt + 9``` (enables color transparency)  
   - ```Ctrl + Alt + 0``` (enables overlay mode ☯)  
   - ```F11``` (makes the chromeless window fullscreen)  

6. Done.  

If you have done everything correctly, you should now have a transparent Clipboard Inserter overlay.  
You can interact with the overlay and use Alt + Tab to switch to another window and back.    

If you are using yomichan, set the security option ```"Use a secure container around popups"``` to ```off``` or the auto-hide functionality won't work.  

Use the ```↑/↓``` arrows near the copy button to move between the lines.  
Toggle the ```Text Visibility``` button if you want to hide the text until you need it. You can hover the same button to temporarily show the text until a new line is added.  
You should also hover each button on the page to read its description.  

</details>


### - **Step-by-step instructions (overlay mode with Magpie)**  
<details>
<summary>
<i>Click here to expand</i>
</summary>

**Problems:**  
- Annoying to setup for the first time.  
- You will be seeing two cursors. A larger cursor for the game and a regular cursor for the overlay.  
- Your mouse is not confined to the game window which means that you can accidently click a random window outside the game window.  
You can use TSolidBackground to block these clicks if you want (don't change the Alt+T keybind)  
- [Notebooks only] On some notebooks color transparency might not work on a browser that has hardware acceleration enabled. That setting is carried between profiles so its better to just use a seperate (portable) browser. Also try running the browser with integrated graphics.  

**Instructions:**  

1. Download the repo and extract the zip to a folder that contains the string: ```ClipboardInserter``` (for auto url detection)  

2. Install Autohotkey.  

3. Open a working chromeless clipboard inserter page with the following steps:  
   *(These instructions are for chromium browsers (e.g. vivaldi). On Firefox you need to use a seperate profile with userChrome.css modifications to get a fullscreen chromeless browser)*  
   1. Install [this modded clipboard inserter extension](https://github.com/Onurtag/clipboard-inserter) (for auto url detection)  
      - Manage the extension and enable ```"allow access to file URLs"```  
      - (recommended) Modify extension options for better performance:  
      i. Element name: ```pre```  
      ii. Container selector: ```#textlines```  
      iii. Timer interval: ```200```  
      iv. Detect url containing: ```ClipboardInserter```  
      v. Use prepend instead of append: ```Enabled```  
      
   2. Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
   3. Scroll down to the block that starts with ```"customStart1:"``` and update the Run line according to your environment.  
   4. Run the ahk script, right click its tray icon and select ```Start Clipboard Inserter (Chromeless)```  
   5. You should now have a working chromeless clipboard inserter page.  

4. Setup the chromeless clipboard inserter page:  
   - Set auto scroll to top (↑ button)  
   - Enable overlay mode hotkey in the settings menu (🔧 button)  

5. Setup Magpie for overlay mode (instructions are for Magpie v0.8.1):  
   1. Copy Magpie to another folder and use the new folder if you want to keep your old settings and use Magpie normally.  
   2. Change the magpie zoom ```"Hotkey"``` from F11 to something else (or don't)  
   3. Settings > Application tab: **Enable** ```"Restore fullscreen when source window regains focus"```  
   4. Settings > Zoom tab: **Disable** ```"Adjust cursor speed while zoomed"``` and **disable** ```"Confine the cursor in 3D games"```  
   5.  Settings > Zoom tab: Set ```"Zoom factor of the cursor"``` to ```"1.25x"``` and ```"Interpolation mode"``` to ```"bilinear"```  
   6.  Settings > Advanced tab: **Enable** ```"Show debugging options"``` and **enable** ```"Breakpoint mode"```  

6. Open ```"Clipboard Inserter Overlay Mode.ahk"``` with your text or code editor.  
    - Under ```"--- Window Hooker Options ---"``` replace ```"GAME TITLE"``` with the window title of your game. This can be a partial match.  

7. Run the ahk script or restart it.  

8. While the chromeless clipboard inserter page is active, press the following keys:  
   - ```Ctrl + Alt + 8``` (enables always on Top)  
   - ```Ctrl + Alt + 9``` (enables color transparency)  
   - ```Ctrl + Alt + 0``` (enables overlay mode ☯)  
   - ```F11``` (makes the chromeless window fullscreen)  

9.  Right click the tray icon of the ahk script and click ```"Show Hooker Menu"``` and then click ```"Start Hook"```.  

10. Use your Magpie hotkey to zoom the game.  

11. Done.  

If you have done everything correctly, you should now have a transparent Clipboard Inserter overlay on top of Magpie.  
You can interact with the overlay and use Alt + Tab to switch to another window and back.    

If you are using yomichan, set the security option ```"Use a secure container around popups"``` to ```off``` or the auto-hide functionality won't work.  

Use the ```↑/↓``` arrows near the copy button to move between the lines.  
Toggle the ```Text Visibility``` button if you want to hide the text until you need it. You can hover the same button to temporarily show the text until a new line is added.  
You should also hover each button on the page to read its description.  

</details>

<br>

For more info about overlay mode read the source code comments of the [example overlay mode ahk script](https://github.com/Onurtag/ClipboardInserter_html/blob/master/Clipboard%20Inserter%20Overlay%20Mode.ahk).  

