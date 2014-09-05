#!/bin/bash
# XF86TouchpadToggle
synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
