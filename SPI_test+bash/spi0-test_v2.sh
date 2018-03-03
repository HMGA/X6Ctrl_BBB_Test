#!/bin/bash -e
#Example for test SPI with gpiochip

#SPI0-MOSI => GPIO0[4] => gpiochip4
#SPI0-MISO => GPIO0[3] => gpiochip3
#SPI0-SCK => GPIO0[2] => gpiochip2

#SPI1-MOSI => GPIO3[16] => gpiochip112
#SPI1-MISO => GPIO3[15] => gpiochip111
#SPI1-SCK => GPIO3[14] => gpiochip110

#Example for SPI0:
printf '\nStart test SPI0 (CH#2)\n\n'

if [ ! -d /sys/class/gpio/gpio4 ]; then echo 4 > /sys/class/gpio/export; fi
if [ ! -d /sys/class/gpio/gpio3 ]; then echo 3 > /sys/class/gpio/export; fi
if [ ! -d /sys/class/gpio/gpio2 ]; then echo 2 > /sys/class/gpio/export; fi
###if [ ! -d /sys/class/gpio/gpio60 ]; then echo 60 > /sys/class/gpio/export; fi

echo out > /sys/class/gpio/gpio4/direction
echo in > /sys/class/gpio/gpio3/direction
echo out > /sys/class/gpio/gpio2/direction
###echo low > /sys/class/gpio/gpio60/direction

for (( i=0 ; ; ++i ))
do
   if (( i > 0x0f )); then
      i=0
      printf '\n[press  + c to stop]\n\n'
   fi

   SCK=$(( (i & 0x01) > 0 ))
   MOSI=$(( (i & 0x02) > 0 ))
   echo 'set:' MOSI=$MOSI ,SCK=$SCK

   echo $MOSI > /sys/class/gpio/gpio4/value
   echo $SCK > /sys/class/gpio/gpio2/value
   echo 'MISO'; cat /sys/class/gpio/gpio3/value

   sleep .2
done

