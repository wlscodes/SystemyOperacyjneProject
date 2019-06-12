#!/bin/bash

#zadanie 4
number=0
read number

# sprawdz czy gupa istnieje studenci_informatyki
groupadd studenci_informatyki

# sprawdz czy grupa istnieje studenci_etyki
groupadd studenci_etyki

for i in {0..$number}
do
    # stworz usera
    useradd user$i

    # dodaj haslo
    password$i | chpasswd
    # sprawdz czy i < size/2
    if i < $number/2
        # dodaj do grupy studenci_informatyki
        usermod -a -G studenci_informatyki user$i
    else
        # dodaj do grupy studenci_etyki
        usermod -a -G studenci_etyki user$i
    fi
done
# wyswietl konta
# wyswietl grupy
