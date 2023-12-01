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