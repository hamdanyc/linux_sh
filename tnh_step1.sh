#! /usr/bin/sh
# ~/Documents/awk_script/tnh_step1.sh
# step 1: prep 
# source: *.csv output:kod_rujuk_tapak.txt
# (dir ../data/tapak)

echo "prep sen sekolah 2021"
awk -F "|" 'NR > 2 {print  $8 "," $7 "," "," $11 "," $3 "," $21 "," $22}' ~/Documents/tanah/data/sek_kpm_2021.csv > ~/Documents/tanah/data/ruj_sek_2021.txt
sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/ruj_sek_2021.txt
echo "prep merge files.. negeri"
cd ~/Documents/tanah/data/tapak/
# for i in `ls -l *.csv|awk '{print $9}'`; do sed -e "1,5d" -e "s/$/,$i/" -e "s/\.csv//g" $i >> negeri.dat; done
truncate -s 0 ~/Documents/tanah/data/tapak/rujuk_tapak.dat
# merge tapak all negeri
# for i in `ls *.csv`; do sed '1,15d' $i; awk 'BEGIN {FS=OFS=","} $6 !~ /^$/ {print $6 "," $4 "," $5 "," $41 "," $45}' $i; done >> ~/Documents/tanah/data/tapak/rujuk_tapak.dat
for i in `ls *.csv`; do sed '1,15d' $i; awk 'BEGIN {FS = "|"} $2 ~ /[1-9]\/[1-9]\/2021/ {print $6 "," $7 "," $8 "," $9 "," $4 "," $5 "," $41 "," $45}' $i; done >> ~/Documents/tanah/data/tapak/rujuk_tapak.dat
echo "clean data"
# sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/tapak/negeri.dat
# select flds for target ~/Documents/awk_script/tnh_rt.awk
# sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/tapak/negeri.dat
# awk 'BEGIN {FS=OFS=","} $6 !~ /^$/ {print $6 "," $4 "," $5 "," $41 "," $45}' ~/Documents/tanah/data/tapak/negeri.dat > ~/Documents/tanah/data/tapak/rujuk_tapak.dat
awk -F "," '$1 ~ /^(SK|SJK|KOMPLEKS|PUSAT|PUSA|SEK|SM|SMV|KPD|KV|PPD|KOLEJ)/ {print $0}' ~/Documents/tanah/data/tapak/rujuk_tapak.dat > ~/Documents/tanah/data/tapak/rujuk_tapak.txt
# echo "uniq && sort"
sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/tapak/rujuk_tapak.txt
echo "merge & match sek to tapak"
awk -f ~/Documents/awk_script/tnh_merge.awk ~/Documents/tanah/data/tapak/rujuk_tapak.txt ~/Documents/tanah/data/ruj_sek_2021.txt > ~/Documents/tanah/data/tapak/rujuk_tapak_sek.txt
echo "Done.."

