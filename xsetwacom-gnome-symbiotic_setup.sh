#!/usr/bin/env bash
{
    sleep 2
    #if ($DISPLAY -eq ":1")
    #then
      export DISPLAY=:1
      # Your path to Xauthority for current user
      export XAUTHORITY=/run/user/1000/gdm/Xauthority
    #fi

    DEVICE_STYLUS=`xsetwacom list dev | grep -E -o ".*stylus"`
    DEVICE_ERASER=`xsetwacom list dev | grep -E -o ".*eraser"`
    DEVICE_CURSOR=`xsetwacom list dev | grep -E -o ".*cursor"`
    DEVICE_PAD=`xsetwacom list dev | grep -E -o ".*pad"`
    DEVICE_TOUCH=`xsetwacom list dev | grep -E -o ".*touch"`

    xsetwacom set "$DEVICE_PAD" "PanScrollThreshold" "2000"
    xsetwacom set "$DEVICE_TOUCH" "ZoomDistance" "120"
    xsetwacom set "$DEVICE_TOUCH" "ScrollDistance" "80"
    xsetwacom set "$DEVICE_TOUCH" Area 0 0 8180 5290

} &
