#!/bin/bash
echo -n "Podaj sciezke bezwzgledna do katalogu: "
read directory
echo -n "Podaj nazwe pliku z rozszerzeniem: "
read file
path=$directory"/"$file
echo $path
if [ -e $path ]
then
	cat $path
else
	echo "Plik nie istnieje!"
fi
