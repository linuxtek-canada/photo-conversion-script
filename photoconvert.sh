#!/bin/bash

# Script will read in all files (jpg default) and rename them to the DateTimeOriginal value stored in EXIF data.
# In this case I renamed them to "Wedding-CreationDate.jpg".
# By default the resized files will be 1920x1080 retaining their aspect ratio.

INPUTDIR='/path/to/photo/folder'
OUTPUTDIR='/path/to/output/folder'

for file in $INPUTDIR/*; do
    INPUTFILE="$(basename "$file")"
    CREATIONDATE=`identify -format '%[EXIF:DateTimeOriginal]' $INPUTDIR/$INPUTFILE`
    NEWFILENAME="Wedding-`echo $CREATIONDATE | tr : - | tr [:blank:] -`.jpg"
    convert $INPUTDIR/$INPUTFILE -resize 1920x1080 $OUTPUTDIR/$NEWFILENAME     
done