#!/bin/bash

csplit -z tosplit /661/ {*}

for file in xx*; do
    newName=$(egrep -o '2[0-9]{7}' $file)
    mv $file $newName.txt
done
rm -rf xx*
