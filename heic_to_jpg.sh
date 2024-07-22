#!/bin/bash -e

# ::INFO::
# This script converts all *.heic files inside a directory to .jpg files 
# How to run: bash heic_to_jpg.sh my-directory-with-heic-files

# read first argument
DIR="${1}"

# check if first argument is provided
if [ -z ${DIR} ]; then
    echo "How to run: '$0 my-directory-with-heic-files'"
    exit 1
fi

# check if directory provided is located in the same directory as the script
if ! find . -maxdepth 1 -type d -name ${DIR} | grep -q '.'; then
  echo "Directory '${DIR}' does not exist."
  exit 1
fi

# Find .heic files in provdided directory and convert them to .jpg
find "${DIR}" -type f -iname '*.heic' | while read -r heicFile; do
  # Remove the file extension
  fileWithoutExt="${heicFile%.*}"
  
  # Set the new file name with .jpg extension
  jpgFile="${fileWithoutExt}_heic_conv.jpg"
  
  # Convert the file to jpg format
  sips -s format jpeg -s formatOptions best "$heicFile" --out "$jpgFile"
  
  # Set the timestamp of the new file to match the original file
  touch -r "$heicFile" "$jpgFile"
  
  # Remove the original .heic file
  rm "$heicFile"
done
