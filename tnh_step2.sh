#! /usr/bin/sh
# ~/Documents/awk_script/tnh_step2.sh
# step 2: update school data & extr to master

echo "prep to merge files.."
cd ~/Documents/tanah/data/proses/
truncate -s 0 ~/Documents/tanah/data/proses/putih.dat
for i in `ls *.csv`; do awk 'awk -F "," '$1 ~ /^[0-9]/ {print $0 "," p}{p=$0}'' $i; done done >> ~/Documents/tanah/data/proses/putih.dat
echo "clean data"
sed -i -f ~/Documents/awk_script/tnh_proses.sed  ~/Documents/tanah/data/proses/putih.dat
# awk '$1 ~ /^(SK|SJK|KOMPLEKS|PUSAT|PUSA|SEK|SM|SMV|KV|KPD|PPD|KOLEJ)/ {print $0}' ~/Documents/tanah/data/proses/putih.dat > ~/Documents/tanah/data/proses/putih.txt
echo "merge files.."
# awk -f ~/Documents/awk_script/merge.awk ~/Documents/tanah/data/tapak/putih.txt ~/Documents/tanah/data/proses/putih_all.txt
