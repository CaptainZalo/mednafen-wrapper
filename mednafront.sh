#!/bin/bash

cd /home/chip/roms

folderpath=$(ls)

system=$(eval zenity --list --column System $folderpath --width=480 --height=272)

cd $system

files=$(ls -Q)

rom=$(eval zenity --list --column "Roms" $files --width=480 --height=272)

if [ $? == 1 ]; then
echo "Cancelled."
else
mednafen -fs 1 "$rom"

fi
