#!/bin/bash
interface=$(ifconfig | cut -f 1 -d " " | head -n 1 | sed 's/://')
printf "Please write a mac address what you want:\n"
read selectedmac
function change {
ifconfig $interface down
ifconfig $interface hw ether $selectedmac
ifconfig $interface up
}
change


