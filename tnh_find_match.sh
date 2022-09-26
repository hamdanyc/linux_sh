# awk -F"," 'NR==FNR{a[$1]=$2;next}{if (a[$1])print a[$1],$0;else print "Not Found", $0;}' OFS=";"  /Documents/tanah/data/tapak/sabah.csv  awk -F, 'FNR==NR {lines[$5]; next} $2 in lines' ~/Documents/tanah/data/tapak/sabah.csv  ~/Documents/tanah/data/proses/sabah.csv
# awk "NR==FNR{a[$5]=$3;next} a[$1]{print a[$1],$0}" ~/Documents/tanah/data/tapak/sabah.csv  ~/Documents/tanah/data/proses/sabah.csv
awk -F "," '$3 !~ /^$/ {print $3}' ~/Documents/tanah/data/proses/sabah.csv > ~/Documents/tanah/data/proses/sabah.txt
awk -F "," '$6 !~ /^$/ {print $6}' ~/Documents/tanah/data/tapak/sabah.csv > ~/Documents/tanah/data/tapak/sabah.txt
awk 'NR==FNR{a[$1]=$1;next} a[$1] {print a[$1],$0}' ~/Documents/tanah/data/tapak/sabah.txt  ~/Documents/tanah/data/proses/sabah.txt
awk 'BEGIN {i=1} NR==FNR{a[$0]=$1;next} $0 in a {print $0}' ~/Documents/tanah/data/tapak/sabah.txt  ~/Documents/tanah/data/proses/sabah.txt > sabah.dat


# Main
# sabah.csv original from  xls file
# sabah.txt  extract sch name only -- index for next step
# sabah.all  -- all ie. master file (../proses)
# sabah.dat  -- matched with master file (../tapak)
# not run awk 'BEGIN {i=1} NR==FNR{a[i++]=$0;next} {for (i in a) print i "," a[i]}' ~/Documents/tanah/data/proses/sabah.all  ~/Documents/tanah/data/proses/sabah.dat|
# not run awk 'NR==FNR{a[i++]=$0;next} END {for (i in a) if ($0 != a[i]) {print $0 "," a[i]}}' ~/Documents/tanah/data/proses/sabah.all  ~/Documents/tanah/data/proses/sabah.dat

# step 1: prep 
# source: *.csv target:rujuk_tapak.txt
# (dir ../data/tapak)
for i in `ls *.csv`; do sed '1,15d' "$i" >> negeri.dat; done # merge tapak all negeri
sed -i -f ~/Documents/awk_script/tnh_proses.sed ~/Documents/tanah/data/tapak/negeri.dat # clean data

awk 'BEGIN {FS=OFS=","} $6 !~ /^$/ {print $6 "," $4 "," $5 "," $7 "," $8 "," $9 "," $41 "," $41 "," $45}' ~/Documents/tanah/data/tapak/negeri.dat > ~/Documents/tanah/data/tapak/rujuk_tapak.dat # select flds for target.
# uniq && sort
awk '$1 ~ /^(SK|SJK|KOMPLEKS|PUSAT|PUSA|SEK|SM|SMV|KPD|PPD|KOLEJ)/ {print $0}' ~/Documents/tanah/data/tapak/rujuk_tapak.dat | sort | uniq > ~/Documents/tanah/data/tapak/rujuk_tapak.txt

# other proc
awk 'BEGIN {FS=OFS=","} $3 !~ /^$/ && NR > 4 {print $3 "," $0}' ~/Documents/tanah/data/proses/sabah.csv > ~/Documents/tanah/data/proses/sabah.txt
awk 'BEGIN {FS=OFS=","} $6 !~ /^$/ && NR > 15 {print $6 "," $0}' ~/Documents/tanah/data/tapak/sabah.csv > ~/Documents/tanah/data/tapak/sabah.txt
awk -f ~/Documents/awk_script/tnh_prep_tapak_v1.awk ~/Documents/tanah/data/tapak/sabah.csv > Documents/tanah/data/tapak/sabah.txt
awk -f ~/Documents/awk_script/tnh_prep_tapak.awk ~/Documents/tanah/data/tapak/sabah.csv > Documents/tanah/data/tapak/sabah.txt

# step 2: update school data & extr to master
for i in `ls *.csv`; do sed '1,3d' "$i" >> ~/Documents/tanah/data/proses/putih.dat; done # merge fail pemutihan all negeri
sed -i -f ~/Documents/awk_script/tnh_proses.sed  ~/Documents/tanah/data/proses/putih.dat
sed -i -e 's/SEKOLAH KEBANGSAAN/SK/g' -e 's/SEKOLAH SUKAN/SEK SUKAN/g' -e 's/SEKOLAH MENENGAH SAINS/SM SAINS /g' -e 's/SEKOLAH MENENGAH KEBANGSAAN/SMK/g' -e 's/PEJABAT PENDIDIKAN DAERAH/PPD/g' -e 's/"//g' ~/Documents/tanah/data/proses/sabah.txt
awk '$3 ~ /^(SK|SJK|KOMPLEKS|PUSAT|PUSA|SEK|SM|SMV|KPD|PPD|KOLEJ)/ {print $0}' ~/Documents/tanah/data/proses/sabah.txt > ~/Documents/tanah/data/proses/sabah.all

# step 3: merge files
# sabah.csv (../tapak) has 51/52 NF
awk -f ~/Documents/awk_script/merge.awk ~/Documents/tanah/data/tapak/sabah.txt ~/Documents/tanah/data/proses/sabah.txt 
# awk 'FNR==NR{a[$0]=$0; next} {print $0 "," a[$0]}' ~/Documents/tanah/data/proses/sabah.txt ~/Documents/tanah/data/tapak/sabah.csv
#awk -F "," 'FNR==NR {a[$3]= $2 "," $4; next} {print a[$3] "," $6}' ~/Documents/tanah/data/proses/sabah.txt ~/Documents/tanah/data/tapak/sabah.csv

# step 3 (deprecated): locate matched school from master
awk 'NR==FNR{a[$0]=$1;next} $0 in a {print $0}' ~/Documents/tanah/data/tapak/sabah.txt  ~/Documents/tanah/data/proses/sabah.txt > ~/Documents/tanah/data/proses/sabah.dat
awk 'NR==FNR{a[$0];next} $0 in a' ~/Documents/tanah/data/proses/sabah.all  ~/Documents/tanah/data/proses/sabah.dat
