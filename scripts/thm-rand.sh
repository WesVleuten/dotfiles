#!/bin/bash
python3 -c 'import json,requests,random;rooms = requests.get("https://tryhackme.com/api/hacktivities?page=1&free=all&order=most-popular&difficulty=all&type=challenge&limit=99999").json()["rooms"];print(random.choice(rooms)["title"])'
