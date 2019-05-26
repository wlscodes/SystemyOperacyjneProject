#!/bin/bash
echo "Podaj katalog :"
read catalog
echo "Podaj plik :"
read file
path=$catalog"/"$file
echo $path

if [ -e $path ]
then
	cat $path
else
	echo "Plik nie istnieje"
fi
