#!/usr/bin/env bash

# Detect ImageMagick - newer versions use the command "magick" instead of "convert"
IMAGEMAGICK="$(which magick 2>/dev/null)"
if [[ -z "$IMAGEMAGICK" ]]; then
  IMAGEMAGICK="$(which convert 2>/dev/null)"
fi

# ImageMagick is not needed for primary font generation
if ! "$IMAGEMAGICK" wizard: /dev/null 2>/dev/null; then
  echo "No ImageMagick available; skipping demo image generation"
  IMAGEMAGICK=""
fi

# Detect Python; prefer python 3.x
PYTHON="$(which python3 2>/dev/null)"
if [[ -z "$PYTHON" ]]; then
  PYTHON="$(which python 2>/dev/null)"
fi

if [[ -z "$PYTHON" ]]; then
  echo "No Python installed.  Aborting." >&2
  exit -1
fi

PSFNORMALIZE="$(which psfnormalize 2>/dev/null)"

# If psfnormalize isn't present, try to install it, and the other req's
if [[ -z "$PSFNORMALIZE" ]]; then
  rm -rf ~/work/mawkin-sans/mawkin-sans/src/pysilfont > /dev/null 2>&1
  "$PYTHON" -m pip install -r requirements.txt
fi

set -e

psfnormalize mawkin_sans.ufo

"$PYTHON" -m fontmake --validate-ufo --autohint --ufo-paths mawkin_sans.ufo --output otf --output-path mawkin_sans.otf

if [[ -n "$IMAGEMAGICK" ]]; then
  echo "Generating title.png"
  "$IMAGEMAGICK" -background white -fill black \
            -font './mawkin_sans.otf' -pointsize 200 label:"Mawkin\n. .Sans" \
            title.png

  echo "Generating demo.png"
  "$IMAGEMAGICK" -background white -fill black \
            -font './mawkin_sans.otf' -pointsize 60 label:"the last metroid\n. .is in captivity\nthe galaxy\n. .is at peace\n\n2021\n\nMawkin\n. .Sans" \
            demo.png
fi

echo "Generating mawkin_sans.woff2"
# Convert OTF to WOFF2 for webfont
"$PYTHON" <<PY
from fontTools.ttLib import TTFont
f = TTFont('mawkin_sans.otf')
f.flavor='woff2'
f.save('docs/mawkin_sans.woff2')
PY
