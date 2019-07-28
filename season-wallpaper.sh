#!/bin/sh

# season-wallpaper.sh
# 
# Chooses a random wallpaper based on the season
# The wallpaper to be selected is stored in $HOME/Pictures/season-wallapper/<season>/
# 


# Set types
typeset -A season
typeset -i month

base_path="$(echo $HOME)/Pictures/season-wallpaper"

#path to season directory
season[spring]="${base_path}/spring/"
season[summer]="${base_path}/summer/*"
season[fall]="${base_path}/fall/"
season[winter]="${base_path}/winter/"

#get month number
month=$(date +%m)

#(UK) Season start/end (Exact date varies)
#
# - Spring -> March     (3)  to May      (5)
# - Summer -> June      (6)  to August   (8)
# - Fall   -> September (9)  to November (11)
# - Winter -> December  (11) to February (2) 

# determine current season
#Spring
if [[ $month -ge 3 && $month -le 5 ]] ; then
	current="spring"
#Summer
elif [[ $month -ge 6 && $month -le 8 ]] ; then
	current="summer"
#Fall
elif [[ $month -ge 9 && $month -le 11 ]] ; then
	current='fall'
#Winter
elif [[ $month -eq 12 ]] || [[ $month -ge 1 && $month -le 2 ]] ; then
	current='winter'
fi

# scale and set a random wallpaper
feh --randomize --bg-scale ${season[$current]}