#!/bin/bash -eu

# This script converts all *.heic files inside a directory to .jpg files 
# How to run: bash heic_to_jpg.sh my-directory-with-heic-files

DIR=$1
if [ -z $DIR ]; then
    echo "Usage: $0 directory_to_convert"
    exit 1
fi

if ! find . -maxdepth 1 -type d -name $DIR | grep -q '.'; then
  echo "Directory '$DIR' does not exist."
  exit 1
fi

find $DIR -type f -iname '*.heic' | while read i; do \
  fileNoExt="${i%.*}"; \
  jpgFile="${fileNoExt}_heic_conv.jpg"; \
  sips -s format jpeg -s formatOptions best "$i" --out "$jpgFile"; \
  touch -r "$i" "$jpgFile"; \
  rm "$i"; \
done
