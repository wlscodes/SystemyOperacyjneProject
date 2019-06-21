#!/bin/bash

checkPath() {
if [ ! -e $1 ]
then
	echo "Nie odnaleziono katalogu: "$1
	exit
fi
}

echo -n "Podaj sciezke bezwzgledna katalogu z ktorego bedziemy kopiowac: "
read pathFrom
echo -n "Podaj sciezke bezwzgledna katalogu do ktorego bedziemy kopiowac: "
read pathTo
echo -n "Podaj rozszerzenie: "
read extension

#sciezka dla testow
pathFrom="/home/student/Desktop/folder"
pathTo="/home/student/Desktop"

checkPath $pathFrom
checkPath $pathTo

extension="*."$extension

count=`find $pathFrom -maxdepth 1 -iname $extension -type f | wc -l`

files=`find $pathFrom -maxdepth 1 -iname $extension -type f`

if [ $count -gt 0 ]
then
	for file in $files
	do
		filename=`basename $file`
		date=`date '+%Y%m%d'`
		cp $file $pathTo"/"$date$filename
	done
else
	echo "Brak plikow "$extension" w folderze"$pathFrom
fi

echo "Skopiowano "$count" plik/ow."
