#!usr/bin/env bash
interface=$(ifconfig | cut -f 1 -d " " | head -n 1 | sed 's/://')
printf "Please write a mac address what you want:\n"
read selectedmac
function change {
service NetworkManager stop
ifconfig $interface down
ifconfig $interface hw ether $selectedmac
ifconfig $interface up
service NetworkManager start
}
change
