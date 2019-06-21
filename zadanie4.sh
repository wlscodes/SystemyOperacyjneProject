#!/bin/bash

# czytaj liczbe
declare -i number=0
while [ $number -lt 1 ]
do
	echo -n "Podaj liczbe kont: "
	read number
done

echo "Chcesz stworzyc" $number "kont."

infor="studenci_informatyki"
etyka="studenci_etyki"

#sprawdz czy istenije grupa informatyki
if ! grep -q $infor /etc/group
then
	sudo groupadd $infor
	echo "Stworzono grupe: "$infor
else
	echo "Grupa "$infor" istnieje."
fi

#sprawdz czy istnieje grupa etyki
if ! grep -q $etyka /etc/group
then
	sudo groupadd $etyka
	echo "Stworzono grupe: "$etyka
else
	echo "Grupa "$etyka" istnieje."
fi

#petla do edycji userow
for (( i=1; $i <= $number; i++ ));
do
	#sprawdz czy taki user juz istnieje, jezeli nie to utworz
	if compgen -u | grep "user"$i -q
	then
		echo "user"$i "istnieje!"
	else
		sudo useradd -m "user"$i -p "password"$i
		echo "user"$i "stworzono"
	fi
	
	
	group=`echo "$number / 2" | bc`

	#dodaj do grup
	if [ $i -le $group ]
	then
		sudo usermod -a -G $infor "user"$i
		echo "user"$i" zostal dodany do grupy:"$infor
	else
		sudo usermod -a -G $etyka "user"$i
		echo "user"$i" zostal dodany do grupy:"$etyka
	fi
done

#Wypisz liste kont z grupami
echo "Lista kont: "
grep studenci /etc/group


#Czy chcesz usunac konta urzytkownikow?
echo "Czy chcesz usunac stworzone konta[Y-TAK] ?"
read delete
if [ "$delete" == "Y" ]
then
	for(( i=1; $i <= $number; i++ ))
	do
		sudo userdel -f "user"$i
		echo "Usunieto konto user"$i
	done
fi

#Wypisz liste kont po usunieciu
echo "Lista kont po usunieciu: "
grep studenci /etc/group
