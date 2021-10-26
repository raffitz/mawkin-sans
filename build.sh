#!/usr/bin/env bash

set -e

psfnormalize mawkin_sans.ufo

fontmake --validate-ufo --autohint --ufo-paths mawkin_sans.ufo --output otf --output-path mawkin_sans.otf
