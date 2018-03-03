#!/bin/bash
#Example for UART4:
echo BB-UART4 > /sys/devices/bone_capemgr.*/slots
cat /sys/devices/bone_capemgr.*/slots
ls /dev/ttyO*
stty -F /dev/ttyO4 115200
echo hello to UART4 > /dev/ttyO4