#!/bin/sh
TUN0=`ip a s tun0 | grep -Po 'inet \K[\d.]+'`;
TUN1=`ip a s tun1 | grep -Po 'inet \K[\d.]+'`;
TUN2=`ip a s tun2 | grep -Po 'inet \K[\d.]+'`;

if [ -z "$TUN0" ] && [ -z "$TUN1" ] && [ -z "$TUN2" ]
then
	exit;
fi

OUTPUT="";

if [ ! -z "$TUN0" ]
then
	OUTPUT="$OUTPUT t0:$TUN0";
fi
if [ ! -z "$TUN1" ]
then
	OUTPUT="$OUTPUT t1:$TUN1";
fi
if [ ! -z "$TUN2" ]
then
	OUTPUT="$OUTPUT t2:$TUN2";
fi

echo "$OUTPUT ";
