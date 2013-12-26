#! /bin/sh

# This script invokes pod2cpanhtml to generate HTML from POD. 
# This is done so the rendering can be checked by eye. 

mkdir -p html
pod2html \
    --infile=wicket/lib/Local/Wicket.pm \
    --outfile=html/Local-Wicket.html

exit 0
