#!/bin/bash
#Example for UART1:
echo BB-UART1 > /sys/devices/bone_capemgr.*/slots
cat /sys/devices/bone_capemgr.*/slots
ls /dev/ttyO*
stty -F /dev/ttyO1 115200
echo hello to UART1 > /dev/ttyO1