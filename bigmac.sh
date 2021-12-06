#!usr/bin/env bash

function randmac {
hexchars="0123456789ABCDEF"
for i in {1..12} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/:\1/g'
}

finalmac=$(randmac)
finalmac=${finalmac#?}

interface1=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 1p)
interface2=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 2p)
interface3=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 3p)

printf "Select an Interface:\n1- $interface1\n2- $interface2\n3-$interface3\n"
read selint

printf "Change Mac Address Randomly or Specific:\n1-Randomly\n2-Specific\n"
read selopt

if [$selint -eq 1] && [$selopt -eq 1] ; then
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface1 down
	ifconfig $interface hw ether $finalmac
	ifconfig $interface up
	service NetworkManager start

elif [$selint -eq 2] && [$selopt -eq 1]
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface2 down
	ifconfig $interface hw ether $finalmac
	ifconfig $interface up
	service NetworkManager start
	
elif [$selint -eq 3] && [$selopt -eq 1]
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface3 down
	ifconfig $interface hw ether $finalmac
	ifconfig $interface up
	service NetworkManager start

elif [$selint -eq 1] && [$selopt -eq 2]
	printf "Write a spesific mac address:\n"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface1 down
	ifconfig $interface hw ether $spesificmac
	ifconfig $interface up
	service NetworkManager start

elif [$selint -eq 2] && [$selopt -eq 2]
	printf "Write a spesific mac address:\n"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface2 down
	ifconfig $interface hw ether $spesificmac
	ifconfig $interface up
	service NetworkManager start

elif [$selint -eq 3] && [$selopt -eq 2]
	printf "Write a spesific mac address:\n"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface3 down
	ifconfig $interface hw ether $spesificmac
	ifconfig $interface up
	service NetworkManager start

else
	printf "FATAL ERROR"
fi