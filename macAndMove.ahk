#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Docs:
; https://autohotkey.com/docs/Hotkeys.htm
; https://autohotkey.com/docs/KeyList.htm
; Ref https://autohotkey.com/board/topic/60675-osx-style-command-keys-in-windows/

; You need to disable "Between input languages" shotcut from Control Panel\Clock, Language, and Region\Language\Advanced settings > Change lanugage bar hot keys

; $ is used to prevent the hotkey from triggering itself
; ! is Alt
; + is Shift
; # is Win
; ^ is Ctrl

; UNIVERAL SHORTCUTS
; cut, copy, paste, save, select all, undo, redo, find, new, close, quit, refresh, open, close tab, close window, minimize, maximize, fullscreen, quit, quit all, quit other, quit all other, quit all but active, quit all but pinned, quit all but unpinned, quit all but last, quit all but first, quit all but first and last, quit all but first and last and active, quit all but first and last and pinned, quit all but first and last and unpinned, quit all but first and last and active and pinned, quit all but first and last and active and unpinned, quit all but first and last and pinned and unpinned, quit all but first
$!x::Send ^x
$!c::Send ^c
$!v::Send ^v
$!s::Send ^s
$!a::Send ^a
$!z::Send ^z
$!+z::Send ^y
$!w::Send ^w
$!f::Send ^f
$!n::Send ^n
$!q::Send !{f4}
$!r::Send ^{f5}
$!m::Send {LWin Down}{Down}{LWin Up}
$!`::Send {Alt Down}{Shift Down}{Tab}{Shift Up}

; QUICK SWITCH TABS
; $!1::Send ^1
; $!2::Send ^2
; $!3::Send ^3
; $!4::Send ^4
; $!5::Send ^5
; $!6::Send ^6
; $!7::Send ^7
; $!8::Send ^8
; $!9::Send ^9
; $!0::Send ^0

; CHROME SHORTCUTS
; new tab, close tab, reopen closed tab, reopen closed window, reopen last closed tab, reopen last closed windo
$!t::Send ^t
$!+t::Send ^+t
$!+]::Send {Ctrl Down}{Tab Down}{Tab Up}{Ctrl Up}
$!+[::Send {Ctrl Down}{Shift Down}{Tab Down}{Tab Up}{Shift Up}{Ctrl Up}
$!l::Send ^l

; INPUT METHODS
; $+,::Send ^,
; $+.::Send ^.

; NAVIGATION
; 
$!Left::Send {Home}
$!Right::Send {End}
$!Up::Send {Lctrl down}{Home}{Lctrl up}
$!Down::Send {Lctrl down}{End}{Lctrl up}

; selection
$#Left::Send {ctrl down}{Left}{ctrl up}
; pressing shift+win+left will select the word to the left of the cursor
$#Right::Send {ctrl down}{Right}{ctrl up}
$#+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
$#+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}

; DELETE
; pressing shift+backspace+arrow will delete the word to the left of the cursor
$!+Left::Send {shift down}{Home}{shift up}
$!+Right::Send {shift down}{End}{shift up}
$!+Up::Send {Ctrl Down}{shift down}{Home}{shift up}{Ctrl Up}
$!+Down::Send {Ctrl Down}{shift down}{End}{shift up}{Ctrl Up}

; cmd+backspace will delete the entire line to the left of the cursor
!BS::Send {LShift down}{Home}{LShift Up}{Del}
; alt+backspace will delete the word to the left of the cursor
#BS::Send {LCtrl down}{BS}{LCtrl up}

; LETTERE ACCENTATE (solo accenti gravi)
; win + lettera per lettera accentata
#a::Send {U+00E0}
#e::Send {U+00E8}
#i::Send {U+00EC}
#o::Send {U+00F2}
#u::Send {U+00F9}

; MOVE WINDOW TO THE SIDE (like recatangular app)
; ctrl+win+arrow moves the window to the edge of the screen
^#Left::Send {LWin Down}{Left}{LWin Up}
^#Right::Send {LWin Down}{Right}{LWin Up}
^#Up::Send {LWin Down}{Up}{LWin Up}
^#Down::Send {LWin Down}{Down}{LWin Up}

; MOUSE AFK
; move mouse with win+z (toggles on/off)
#z::
    if (Toggle := !Toggle) ; Toggle the state variable
    {
        SetTimer, MoveMouse, 5000 ; Set the timer to execute the MoveMouse subroutine every 5 seconds
        Tooltip, Mouse movement activated! ; Display a tooltip indicating activation
    }
    else
    {
        SetTimer, MoveMouse, Off ; Turn off the timer
        Tooltip ; Remove the tooltip
    }
    return

; MoveMouse subroutine
MoveMouse:
    Random, randX, 0, A_ScreenWidth ; Generate a random X coordinate within the screen width
    Random, randY, 0, A_ScreenHeight ; Generate a random Y coordinate within the screen height
    MouseMove, randX, randY, 0 ; Move the mouse to the random coordinates instantly
    return

; MOUSE EXTRA KEYS
; button 4 = copy
XButton2::Send ^c
; button 5 = paste
XButton1::Send ^v