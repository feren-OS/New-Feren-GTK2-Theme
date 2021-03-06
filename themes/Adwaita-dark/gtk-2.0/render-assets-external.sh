#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
ZOPFLIPNG="/usr/local/bin/zopflipng"

SRC_FILE="assets-external.svg"
ASSETS_DIR="assets"
INDEX="assets-external.txt"

for i in `cat $INDEX`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i-dark \
              --export-id-only \
              --export-background-opacity=0 \
              --export-type="png" --export-filename=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $ZOPFLIPNG -ym $ASSETS_DIR/$i.png $ASSETS_DIR/$i.png
fi
done
exit 0
