#! /usr/bin/sh
# ~/Documents/awk_script/tnh_step1a.sh
# step 1: prep 
# source: *.csv output:kod_rujuk_tapak.txt
# (dir ../data/tapak)

echo "prep merge files.. negeri"
cd ~/Documents/tanah/data/tapak/
truncate -s 0 ~/Documents/tanah/data/tapak/rujuk_tapak.txt
# merge tapak all negeri
for i in `ls *.csv`; do sed '1,15d' $i; awk -F "|" '$7 ~ /[AZ]/ {print $7 "," $9 "," $8 "," $5 "," $6  "," $43 "," $44 "," $46 "," $47 "," $48 "," $52}' $i; done >> ~/Documents/tanah/data/tapak/rujuk_tapak.txt
echo "clean data"
# echo "uniq && sort"
sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/tapak/rujuk_tapak.txt
echo "merge & match sek to tapak"
awk -f ~/Documents/awk_script/tnh_merge_v1a.awk ~/Documents/tanah/data/tapak/rujuk_tapak.txt ~/Documents/tanah/data/ruj_sek_2021.txt > ~/Documents/tanah/data/tapak/rujuk_tapak_all.txt
echo "Done.."
echo "output : ~/Documents/tanah/data/tapak/rujuk_tapak_all.txt"


