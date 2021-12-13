#!usr/bin/env bash

function randmac {
hexdump -n 6 -ve '1/1 "%.2x "' /dev/random | awk -v a="2,6,a,e" -v r="$RANDOM" 'BEGIN{srand(r);}NR==1{split(a,b,",");r=int(rand()*4+1);printf "%s%s:%s:%s:%s:%s:%s\n",substr($1,0,1),b[r],$2,$3,$4,$5,$6}'
}

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
clear='\033[0m'

interface1=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 1p)
interface2=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 2p)
interface3=$(ifconfig | cut -f 1 -d " " | sed 's/://' | sed 's/lo//' | sed '/^$/d' | sed -n 3p)

printf "Select an Interface:\n1- $interface1\n2- $interface2\n3-$interface3\n"
read selint

printf "${yellow}Change Mac Address Randomly or Specific:\n1-Randomly\n2-Specific\n${clear}"
read selopt

if [ "$selint" = "1" ] && [ "$selopt" = "1" ] ; then
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface1 down
	ifconfig $interface1 hw ether $finalmac
	ifconfig $interface1 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

elif [ "$selint" = "2" ] && [ "$selopt" = "1" ] ; then
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface2 down
	ifconfig $interface2 hw ether $finalmac
	ifconfig $interface2 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

elif [ "$selint" = "3" ] && [ "$selopt" = "1" ] ; then
	finalmac=$(randmac)
	service NetworkManager stop
	ifconfig $interface3 down
	ifconfig $interface3 hw ether $finalmac
	ifconfig $interface3 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

elif [ "$selint" = "1" ] && [ "$selopt" = "2" ] ; then
	printf "${yellow}Write a spesific mac address(You have to write even number first 8 byte):\n${clear}"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface1 down
	ifconfig $interface1 hw ether $spesificmac
	ifconfig $interface1 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

elif [ "$selint" = "2" ] && [ "$selopt" = "2" ] ; then
	printf "${yellow}Write a spesific mac address(You have to write even number first 8 byte):\n${clear}"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface2 down
	ifconfig $interface2 hw ether $spesificmac
	ifconfig $interface2 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

elif [ "$selint" = "3"] && ["$selopt" = "2" ] ; then
	printf "${yellow}Write a spesific mac address(You have to write even number first 8 byte):\n${clear}"
	read spesificmac
	service NetworkManager stop
	ifconfig $interface3 down
	ifconfig $interface3 hw ether $spesificmac
	ifconfig $interface3 up
	service NetworkManager start
	printf "${green}Mac Changed Succesfully${clear}"

else
	printf "${red}FATAL ERROR${clear}"
fi
