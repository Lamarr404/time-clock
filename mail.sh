#!/bin/bash

dossier=/home/$USER/horaires-`date +%Y-%m`
zip $dossier
swaks -t <mail of receiver> -s smtp.server:port -tls -au <Auth_Utilisateur> -ap <Auth_Pass> -f <email_sender> --h-Subject "Your_Subject" --attach /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`.zip
