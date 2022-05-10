#!/bin/bash

dossier=/home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`
zip $dossier
swaks -t e.recever@club-vercors.fr -s 127.0.0.1:1025 -tls -au Lucas.Charignon@protonmail.com -ap PIaHHTrZtbLbBbFYn3wVdA -f lucas.charignon@protonmail.com --h-Subject "Heures_Lucas_Charignon" --attach /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`.zip
