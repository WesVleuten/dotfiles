#!/bin/sh
ip a s tun0 | grep -Po 'inet \K[\d.]+' || echo '!vpn'
