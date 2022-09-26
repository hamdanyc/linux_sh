#! /usr/bin/sh
# ~/Documents/awk_script/tnh_step2a.sh
# step 2:  join "ruj_sek_2021" with "pemutihan"
# source: ~/Documents/tanah/data/proses/putih.dat output: ~/Documents/tanah/data/proses/putih.dat

echo "prep to merge files.."
cd ~/Documents/tanah/data/proses/
truncate -s 0 ~/Documents/tanah/data/proses/putih.dat
for i in `ls *.csv`; do awk -F "," 'length($1) <= 3 {print}' $i; done >> ~/Documents/tanah/data/proses/putih.dat
echo "clean data"
sed -i -f ~/Documents/awk_script/tnh_proses.sed  ~/Documents/tanah/data/proses/putih.dat
echo "merge files.."
awk -f ~/Documents/awk_script/tnh_merge_v1.awk ~/Documents/tanah/data/proses/putih.dat ~/Documents/tanah/data/ruj_sek_2021.txt > ~/Documents/tanah/data/proses/putih_all.txt
echo "Eksrak nota ..."
truncate -s 0 ~/Documents/tanah/data/proses/nota.txt
for i in `ls *.csv`; do awk -F "," '! /^$/ && length($2) ==7 && $22 != "" {print $1 "," $2 "," $24 "," $25}' $i; done >> ~/Documents/tanah/data/proses/nota.txt
echo "clean data"
sed -i -f ~/Documents/awk_script/tnh_proses.sed  ~/Documents/tanah/data/proses/nota.txt
echo "merge to sek"
echo "output .. ~/Documents/tanah/data/proses/putih_all.txt & ~/Documents/tanah/data/proses/nota_all.txt"
awk -f ~/Documents/awk_script/tnh_merge_v1b.awk ~/Documents/tanah/data/proses/nota.txt ~/Documents/tanah/data/ruj_sek_2021.txt > ~/Documents/tanah/data/proses/nota_all.txt
