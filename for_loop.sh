#!/bin/bash

file_list=$(ls Documents/rmd/*.Rmd)
for files in $file_list
do
	echo cat header.txt $files > Documents/rmd_ver/$files
done

# other example
# oneline cli

for i in `ls *.pdf.txt`; do awk -f keyword.awk "$i" > ref_key_file/"$i"; done
for i in `ls *.pdf`; do pdftotext -layout -nodiag "$i" > dir_txt/"$i"; done
for i in 'ref28.pdf.txt ref29.pdf.txt'; do echo $i; done
