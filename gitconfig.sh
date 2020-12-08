#!/bin/bash

echo "Please enter your GIT name:";
read gitname;
echo "Please enter your GIT email:";
read gitemail;
git config --global user.email "$gitemail";
git config --global user.name "$gitname";

echo "Git updated";
