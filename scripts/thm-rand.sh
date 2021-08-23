#!/bin/bash
curl 'https://tryhackme.com/api/hacktivities?page=1&free=all&order=most-popular&difficulty=all&type=challenge&limit=99999' |python3 -c 'import sys, json, random;rooms = json.load(sys.stdin)["rooms"];print(random.choice(rooms)["title"])'
