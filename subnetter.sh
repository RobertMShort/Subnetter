#!/bin/bash

echo "SUBNETTER"
echo "---------------------"

echo "Enter ip with CIDR notation: "

read ip

declare -A subnetmask
subnetmask=([23]=255.255.254.0 [24]=255.255.255.0 [25]=255.255.255.128)

declare -A binary
binary=([23]=11111111.11111111.11111110.00000000 [24]=11111111.11111111.11111111.00000000 [25]=11111111.11111111.11111111.10000000)

declare -A ips
ips=([23]=9 [24]=8 [25]=7)

CIDR=${ip: -2}

if [ -v subnetmask[$CIDR] ]; then
	echo "Subnet Mask: ${subnetmask[$CIDR]}"
	echo "Subnet Binary: ${binary[$CIDR]}"
	echo "IP Addresses: "$((2**${ips[$CIDR]}))
	echo "Usable IP Addresses: "$((2**${ips[$CIDR]}-2))
fi

case $CIDR in

	"23")
		echo "Networks: 2"
		;;
		
	"24")
		echo "Networks: 1"
		;;

	"25")
        echo "Networks: 1/2"
		;;

	*)
		echo "Invalid IP"
		;;
esac
