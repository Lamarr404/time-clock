
#!/bin/bash


ARGUMENTS=$1
WEEK=$2
ROAD=$3
CHEMIN=/home/lucho/Documents/clubvercors/horaires-2022-05/horaires-2022-05-$ROAD
DAY=$4

case $1 in
	-n | --new) 

		mkdir -p /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`
		echo 'Lundi: Mardi: Mercredi: Jeudi: Vendredi: Samedi: Dimanche:' | tr " " "\n" > /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`/horaires-`date +%Y-%m`-1

		;;

	-w | --new-week)

		new_week=$(echo 'Lundi: Mardi: Mercredi: Jeudi: Vendredi: Samedi: Dimanche:' | tr " " "\n" > /home/lucho/Documents/clubvercors/horaires-`date +%Y-%m`/horaires-`date +%Y-%m`-$WEEK)

		;;

	-a | --add)

		TEST=$WEEK
	        sed -i "s/$DAY:/$DAY: $TEST/" $CHEMIN

	       ;;
       	*)
	echo "Invalid argument !"
	;;
esac


