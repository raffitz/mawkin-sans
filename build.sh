#!/usr/bin/env bash

set -e

psfnormalize mawkin_sans.ufo

fontmake --validate-ufo --autohint --ufo-paths mawkin_sans.ufo --output otf --output-path mawkin_sans.otf

convert -background white -fill black \
          -font './mawkin_sans.otf' -pointsize 200 label:"Mawkin\n. .Sans" \
          title.png

convert -background white -fill black \
          -font './mawkin_sans.otf' -pointsize 60 label:"the last metroid\n. .is in captivity\nthe galaxy\n. .is at peace\n\n\nMawkin\n. .Sans" \
          demo.png

# Convert OTF to WOFF2 for webfont
python3 <<PY
from fontTools.ttLib import TTFont
f = TTFont('mawkin_sans.otf')
f.flavor='woff2'
f.save('docs/mawkin_sans.woff2')
PY
