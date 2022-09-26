#! /bin/sh
# awk_loop.sh

file_list="ref1.pdf.txt ref2.pdf.txt ref3.pdf.txt ref4.pdf.txt ref5.pdf.txt"
rm tmp
for files in $file_list
do
    awk -f ~/Documents/awk_script/biblio.awk $files >>  tmp
done
