#!/bin/bash

echo "SUBNETTER"
echo "---------------------"

echo "Enter ip with CIDR notation: "

read ip

declare -A subnetmask
subnetmask=([23]=255.255.254.0 [24]=255.255.255.0 [25]=255.255.255.128)

declare -A binary
binary=([23]=11111111.11111111.11111110.00000000 [24]=11111111.11111111.11111111.00000000 [25]=11111111.11111111.11111111.10000000)

CIDR=${ip: -2}

hosts=$(echo "${binary[$CIDR]}" | grep -o '0' | wc -l)
networks=$(echo ${binary[$CIDR]: -8} | grep -o '1' | wc -l)

if [ -v subnetmask[$CIDR] ]; then
        echo "Subnet Mask: ${subnetmask[$CIDR]}"
        echo "Subnet Binary: ${binary[$CIDR]}"
        echo "IP Addresses: "$((2**"$hosts"))
        echo "Usable IP Addresses: "$((2**"$hosts"-2))
        echo "Networks: "$((2**"$networks"))
fi
