#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\Clipboard Inserter.ico
Menu, Tray, NoStandard
Menu, Tray, Add, Start Clipboard Inserter (Chromeless), customStart1
Menu, Tray, Add, ; Adds a Seperator
Menu, Tray, Add, Show Hooker Menu, StartHookGui
Menu, Tray, Add, Stop Window Hooker, StopHook
Menu, Tray, Disable, Stop Window Hooker
Menu, Tray, Add, ; Adds a Seperator
Menu, Tray, Default, Show Hooker Menu ;Default
Menu, Tray, Standard

;❗❗❗❗❗ Overlay mode (green screen) troubleshooting
;1. It might not work on a browser that has hardware acceleration enabled. 
;2. On laptops it might not work unless you run your browser using integrated graphics.

;❗❗❗ --- Hotkeys ---
;Ctrl + Alt + 9: Toggle overlay mode (color green screen and hide window frame if thats enabled)
;Ctrl + Alt + 8: Toggle always on top
;These hotkeys only work on a few specific windows that I will be explaining below.  
;-----------------

;❗❗❗ --- Overlay Mode Options ---
;Enable/Disable hiding window frame. Hiding the window frame is useless if you are using F11 to fullscreen the window.
hideWindowFrame := 0
;-----------------

;Window hooker is just extra. Not necessary for Overlay Mode.
;❗ --- Window Hooker Options ---
;Window titles. TitleOne is the host window and TitleTwo is the overlay window that gets minimized/killed when TitleOne is not active.
TitleOne := "GAME TITLE"
TitleTwo := "Magpie_Host"
;Hook partial window titles instead of exact title
hookPartialTitle := 1
;KILLS window two instead of minimizing it. For Magpie.
killWindowTwoInstead := 1
;Window containing this string in its title does not minimize the overlay window when you activate it (similar to the main window or the alt+tab menu)  
hookerExcludeWindow := "Clipboard Inserter"
;Window with a title that matches this regex string gets activated when the host window is restored (when you activate the main window). This is a Regular Expression.
hookerTopOfWindowTwoRegex := "Clipboard Inserter.*(Overlay Mode)"
;-----------------

Hooking := 0
SetTitleMatchMode, 2
;Open hooker gui at startup
;Gosub, StartHookGui
;Finish initializing
Return

;Start Clipboard Inserter (Chromeless) using the tray menu  
customStart1:
    ;Customize the following Run line below for your environment and uncomment the line (remove the semicolon ; in front)  
    ;Run, "C:\Portables\VivaldiPortable\Application\vivaldi.exe" --profile-directory="Default" --app="file:///C:/Portables/ClipboardInserter_html/index.html"  
Return

;❗❗❗ The hotkeys below only work on the specified applications 
;❗❗ IF- application is either vivaldi.exe, chrome.exe or firefox.exe 
;❗❗ AND- only if the window title contains the string "Clipboard Inserter"  
;❗ comment the #If ... line below (like ;#If ...) if you want to use the hotkeys on any window

#If (WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe vivaldi.exe") || WinActive("ahk_exe firefox.exe")) && WinActive("Clipboard Inserter")

;Hotkey Ctrl + Alt + 9: Toggle overlay mode (color green screen and hide window frame if thats enabled)
~^!9::
    ToggleOverlay(hideWindowFrame)
return

;Hotkey Ctrl + Alt + 8: Toggle always on top
~^!8::
    WinGet, currentWindow, ID, A
    WinGet, WindowExStyle, ExStyle, ahk_id %currentWindow%
    if (WindowExStyle & 0x8) {
        WinSet, AlwaysOnTop, off, ahk_id %currentWindow%
        TrayTip, % "Overlay Mode AHK", % "Always on top status: OFF", 2
    } else {
        WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
        TrayTip, % "Overlay Mode AHK", % "Always on top status: ON", 2
    }
return

;(DISABLED) Hotkey Ctrl + Alt + -: Toggle overlay mode (1. moves the window, 2. always hides window frames and 3. makes it even more transparent)
;~^!-::
;    ToggleOverlay(True, 160, True)
;return

;disable global if
#If

;Hotkey Alt + T: Wait 150ms and then bring hooked window to the top (for TSolidBacgkround)
~!T::
    ;TrayTip, "overlaymode", % "hooking:" . Hooking . " Aone:" . WinActive("%TitleOne%") . " Etwo:" . WinExist("%TitleTwo%") . " Etsbbg:" . WinExist("TSolidBackground BG")
    If (Hooking) {
        Sleep, 150
        if (WinExist("TSolidBackground BG")) {
            WinSet, Top,, %TitleTwo%
        }
    }
Return

;Toggle overlay mode (color transparency)
ToggleOverlay(hideFrame:=False, transparency:=230, moveWindow:=False) {
    WinGetTitle, currentWindow, A
    IfWinExist %currentWindow%
    WinGet, colorVal, TransColor, A

    if (moveWindow) {
        if (colorVal == "") {
            ;Move here when transparency is enabled
            WinMove, A,, 1410, -32, 524, 476
        } else {
            ;Move back here when transparency is disabled
            WinMove, A,, 1395, 571, 524, 476
        }
    }
    
    ; !!! > When removing the caption from a window that will use WinSet TransColor, remove it only after setting the TransColor.
    
    if (colorVal == "") {
        WinSet, TransColor, 000000 %transparency%, A ;Makes your main color (#000000 here) transparent and you CAN click through it. The %transparency% means that everything else also becomes semi transparent.
        if (hideFrame) {
            WinSet, Style, -0xC00000 ; hide title bar (combination of border and dialog frame)
            WinSet, Style, -0x800000 ; hide thin-line border
            ;WinSet, Style, -0x400000 ; hide dialog frame
            WinSet, Style, -0x40000 ; hide thickframe/sizebox
        }
    } else {
        if (hideFrame) {
            WinSet, Style, +0xC00000 ; Show title bar (combination of border and dialog frame)
            WinSet, Style, +0x800000 ; Show thin-line border
            ;WinSet, Style, +0x400000 ; Show dialog frame
            WinSet, Style, +0x40000 ; Show thickframe/sizebox
        }
        WinSet, TransColor, 000000 255, A ;Disable color transparency and semi-transparency.
        WinSet, TransColor, Off, A  ;Doing this and the above line together was suggested on AHK docs.
    }
}

/*
; ---Useless now---
; Double press caps lock (within 200ms) to send Alt + O to the overlay window (using title regex)
~CapsLock::
    if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200) {
        ;Enable RegEx TitleMatchMode temporarily
        oldMatchModeCAPS := A_TitleMatchMode
        SetTitleMatchMode, RegEx
        ;Chromium doesn't receive the hotkey unless its activated (ControlSend doesnt work perfectly)
        ;Save previous active window
        prevActiveWin := WinActive("A")
        WinActivate, Clipboard Inserter HTML Enhanced.*?Overlay Mode
        ;Sleeps make it more consistent
        Sleep, 10
        Send, !o
        Sleep, 10
        ;Reactivate previous window
        WinActivate, ahk_id %prevActiveWin%
        SetTitleMatchMode, %oldMatchModeCAPS%
    }
Return
*/

;Hooker Start (copied over from TSolidBackground)
;Hooker Start (copied over from TSolidBackground)
;Hooker Start (copied over from TSolidBackground)
ShowHooker() {
    Global
    Gui, hook: Destroy
    Gui, hook: +AlwaysOnTop
    Gui, hook: Color, 653535
    Gui, hook: Font, s14 c836DFF Bold, Segoe UI
    Gui, hook: Add, Text, x238 y15, Window Hooker (Alpha)
    Gui, hook: Font, s14 ca3dDa5 bold underline
    Gui, hook: Add, Text, x120 y465, READ THE SOURCE CODE FOR OTHER OPTIONS
    Gui, hook: Font, s10 cDCDCCC norm bold
    Gui, hook: Add, Text, x90 y47, Window Hooker does this: `nWhen you tab on to the Main window, the Hooked window will be brought on top. `nWhen you leave the Main window, the Hooked window will be minimized.
    Gui, hook: Font, s10 cDCDCCC norm
    Gui, hook: Add, Text, x112 y112, Main Window:  
    Gui, hook: Add, Text, x112 y152, Hooked Window:  
    Gui, hook: Add, Checkbox, x112 y280 Checked%hookPartialTitle% vhookPartialTitle gSetnow, `nHook anything that contains the Main Window Title `n(off: Hooks only when the titles are identical)
    Gui, hook: Font, s10
    Gui, hook: Add, Text, x500 y355, Tip: You can `nalso stop the `nwindow hooker `nusing the `ntray menu.
    Gui, hook: Font, s10 cBlack norm
    Gui, hook: Add, Edit, x234 y111 w170 h20 vTitleOne, %TitleOne%
    Gui, hook: Add, Edit, x234 y151 w170 h20 vTitleTwo, %TitleTwo%
    Gui, hook: Add, Button, x421 y109 h23 gGetactiveOne, Get last active window
    Gui, hook: Add, Button, x421 y149 h23 gGetactiveTwo, Get last active window
    if (!Hooking) {
        Gui, hook: Add, Button, x237 y192 w164 h66 gStartHook, Start Hook
    } else {
        Gui, hook: Add, Button, x237 y192 w164 h66 gStopHook, Stop Hook
    }
    Gui, hook: Font, s10 cBlack norm Bold
    Gui, hook: Add, Button, x174 y515 w290 h24, Close
    Gui, hook: Show, w640 h560, Overlay Mode Window Hooker
    Return
}

StartHookGui:
    ShowHooker()
Return

hookButtonClose:
    Gui, Submit, NoHide
    Gui, hook: Destroy
Return

hookGuiEscape:
    Gui, Submit, NoHide
    ;Gosub, BackGui
    Gui, hook: Destroy
Return

Setnow:
    Gui, Submit, NoHide
Return

GetactiveOne:
    Gui, hook: Destroy
    Sleep, 75
    WinGetTitle, TitleOne, A
    ShowHooker()
Return

GetactiveTwo:
    Gui, hook: Destroy
    Sleep, 75
    WinGetTitle, TitleTwo, A
    ShowHooker()
Return

StartHook:
    Gui, Submit, NoHide
    Hooking := 1
    Gui, hook: Destroy
    Hooker()
    Menu, Tray, Enable, Stop Window Hooker
Return

StopHook:
    Gui, hook: Destroy
    KillHooker()
Return

;TitleOne: Base Window, TitleTwo: Hooked Window
Hooker() {
    Global
    ;WinGet, OneisNotMin, MinMax, %TitleTwo%
    ;CurrActiveID := WinExist("A")
    ;WinGetTitle, CurrActiveTitle, ahk_id %CurrActiveID%
    oldMatchMode := A_TitleMatchMode
    ;Set title mode and check for TitleOne
    if (hookPartialTitle) {
        SetTitleMatchMode, 2
        WinGetTitle, CurrActiveTitle, A
        checkTitleOne := InStr(CurrActiveTitle, TitleOne)
    } else {
        SetTitleMatchMode, 1
        WinGetTitle, CurrActiveTitle, A
        checkTitleOne := (CurrActiveTitle == TitleOne)
    }
    WinGet, TwoisNotMin, MinMax, %TitleTwo%
    WinGet, TwoWindowExStyle, ExStyle, %TitleTwo%
    ;If TitleOne was found
    if (checkTitleOne > 0) {
        ;if we are using kill mode, wait for window two to exist
        if (killWindowTwoInstead) {
            WinWait, %TitleTwo%,, 3
        }
        ;restore window two if it is minimized
        if (TwoisNotMin == -1) {
            ;Restore WindowTwo
            WinRestore, %TitleTwo%
        }

        if (TwoWindowExStyle & 0x8) {
            ;do nothing if TitleTwo is always on top
        } else {
            ;Enable always on top for TitleTwo
            WinSet, AlwaysOnTop, on, %TitleTwo%
        }
        
        ;Handle hookerTopOfWindowTwoRegex
        ;Enable RegEx TitleMatchMode temporarily
        oldMatchModeRX := A_TitleMatchMode
        SetTitleMatchMode, RegEx
        ;restore TopOfWindowTwo and move it to the top 
        WinRestore, % hookerTopOfWindowTwoRegex
        WinSet, Top,, % hookerTopOfWindowTwoRegex
        SetTitleMatchMode, %oldMatchModeRX%

    } else {
        ;Always ignore the window named "Kagami"
        protectVNR := 1
        ;check if active title is not equal to titletwo; if partial is disabled
        ;OR check if active title does not include titletwo; if partial is enabled
        if ((!hookPartialTitle && (CurrActiveTitle != TitleTwo)) || (hookPartialTitle && !InStr(CurrActiveTitle, TitleTwo))) {
                ;Check if the title is empty
            if ((CurrActiveTitle != "")
                ;and Check for VNR
                && (protectVNR && (CurrActiveTitle != "Kagami"))
                ;and Check for the four hidden TSolidBackground windows
                && (InStr(CurrActiveTitle, "TSolidBackground BG") == 0)
                ;and Check for the alt+tab menu
                && (InStr(CurrActiveTitle, "Task Switching") == 0)
                ;and Check for the custom title. (Can be improved if necessary)
                && (InStr(CurrActiveTitle, hookerExcludeWindow) == 0))
            {
                if (killWindowTwoInstead) {
                    ;Just kill it
                    WinClose, %TitleTwo%
                } else {
                    ;check if title two is always on top
                    if (TwoWindowExStyle & 0x8) {
                        WinSet, AlwaysOnTop, off, %TitleTwo%
                    } else {
                        ;do nothing if TitleTwo is NOT always on top
                    }
                    ;if TitleTwo is not minimized, minimize it.
                    if (TwoisNotMin != -1) {
                        WinMinimize, %TitleTwo%
                    }
                }

            }
        }
        /*
        IfWinNotExist, %TitleOne%
        {
            if (TwoisNotMin != -1) {
                WinMinimize, %TitleTwo%
            }
        }
        */
    }
    if (Hooking) {
        SetTimer, Hooker, 300
    } else {
        ;if disabled, turn always on top off for TitleTwo
        if (TwoWindowExStyle & 0x8) {
            WinSet, AlwaysOnTop, off, %TitleTwo%
        }
    }
    ;Restore title match mode
    SetTitleMatchMode, %oldMatchMode%
    Return
}

KillHooker() {
    Global
    Hooking := 0
    SetTimer, Hooker, Off
    ShowHooker()
    Menu, Tray, Disable, Stop Window Hooker
    Return
}
;Hooker End
;Hooker End
;Hooker End
;Hooker End
;Hooker End
