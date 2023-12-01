#NoEnv
#Persistent

Toggle := 0

#z::
    Toggle := !Toggle
    If (Toggle) {
        SetTimer, SendInput, 1000
        TrayTip, AutoClicker, Script is running., 2
    }
    Else {
        SetTimer, SendInput, Off
        TrayTip, AutoClicker, Script is disabled., 2
    }
Return

SendInput:
    If (Toggle) {
        Send {Esc}
        Click
    }
Return