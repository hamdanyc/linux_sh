#! /usr/bin/awk
# ~/Documents/awk_script/tnh_step3.awk

awk -f ~/Documents/awk_script/tnh_merge.awk ~/Documents/tanah/data/tapak/kod_rujuk_tapak.txt ~/Documents/tanah/data/ruj_sek_2021.txt | sort -u > ~/Documents/tanah/data/proses/tapak_sek.txt
