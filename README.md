##  The purpose of this script is to record my schedules

### Parameters

Creates a new folder with the name of the date and the text file representing week 1

```bash
./horaires.sh -n or --new
```

Add a week file (the 1 is created during the new command then increment from 2)
```bash
./horaires.sh -w 2
```

Add hours in $h$ format in one of the weeks files
```bash
./horaires.sh -a 2h30 2 Lundi
```

### Source Code

```bash
#!/bin/bash


ARGUMENTS=$1
WEEK=$2
ROAD=$3
CHEMIN=/home/$USER/horaires-2022-05/horaires-2022-05-$ROAD
DAY=$4

case $1 in
	-n | --new) 

		mkdir -p /home/$USER/horaires-`date +%Y-%m`
		echo 'Lundi: Mardi: Mercredi: Jeudi: Vendredi: Samedi: Dimanche:' | tr " " "\n" > /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`/horaires-`date +%Y-%m`-1

		;;

	-w | --new-week)

		new_week=$(echo 'Lundi: Mardi: Mercredi: Jeudi: Vendredi: Samedi: Dimanche:' | tr " " "\n" > /home/$USER/horaires-`date +%Y-%m`/horaires-`date +%Y-%m`-$WEEK)

		;;

	-a | --add)

		TEST=$WEEK
	        sed -i "s/$DAY:/$DAY: $TEST/" $CHEMIN

	       ;;
       	*)
	echo "Invalid argument !"
	;;
esac
```

## This script is dedicated to compression and sends it from the folder containing the hourly files, every 30 of the month by email to my company thanks to a cron task.

### First things install the mail client swaks

```bash
sudo apt install swaks
```
### Source Code 

```bash
#!/bin/bash

dossier=/home/$USER/horaires-`date +%Y-%m`
zip $dossier
swaks -t <mail of receiver> -s smtp.server:port -tls -au <Auth_Utilisateur> -ap <Auth_Pass> -f <email_sender> --h-Subject "Your_Subject" --attach /home/$USER/horaires-`date +%Y-%m`.zip
```

### Cron :

Pour un envoie tout les 30 du mois
```bash
00 18 30 * * /home/$USER/Script/Bash/mail.sh
```
