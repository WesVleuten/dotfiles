#!/usr/bin/env bash

echo "VPN Select:"

options=`ls -1 | grep ".ovpn" `

select s in $options; do
    if [ -z $s ]; then
        echo "Cancelled"
        exit
    fi
    sudo openvpn $s
    exit
done

