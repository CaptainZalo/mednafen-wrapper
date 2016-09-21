#!/bin/bash
filetype=$(zenity --entry)

List=()
while IFS= read -d $'\0' -r file ; do
List=("${List[@]}" "$file")
done < <(find . -name ''*.$filetype'' -print0)

rom=$(zenity --list --column "Item" "${List[@]}")

if [ $? == 1 ]; then
echo "Cancelled."
else
mednafen -fs 1 "$rom"
fi
