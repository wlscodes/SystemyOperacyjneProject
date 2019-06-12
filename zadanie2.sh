#!/bin/bash

#menu
menu(){
#	clear
	echo "---*** MENU ***---"
	echo ""
	echo "1. Dodaj gracza"
	echo "2. Wyswietl liste"
	echo "3. Wyjdz"
	echo "------------------"
}

create(){
	echo -n "Podaj numer: "
	read number
	echo -n "Podaj imie: "
	read name
	echo -n "Podaj nazwisko: "
	read surname
	echo -n "Podaj klub: "
	read club
	echo -n "Podaj ilosc pkt: "
	read points
	echo $number", "$name", "$surname", "$club", "$points >> $1
}

#zmienne
exit=1
file="data.txt"

#tworzy nowy plik
echo "Nr_gracza, Imie, Nazwisko, Klub, Ilosc_pkt" > $file

while [ $exit = 1 ]
do
	menu
	read option
	case $option in
		1) create $file;;
		2) echo `awk '{print $2, $3, $1'} $file`;;
		3) exit=0;;
		*) echo "Wprowadziles cos nie tak";;
	esac
done
