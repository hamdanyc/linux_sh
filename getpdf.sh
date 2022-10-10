cat aset_pertahanan.txt | xargs wget -c
for i in `ls ~/Documents/aset_pertahanan/pdf/*.pdf`; do pdftotext -layout -nodiag "$i"; done
awk '/aset|pertahanan/ gsub("aset.pertahanan","*** aset pertahanan ***") {print $0}' *.txt > aset_default
