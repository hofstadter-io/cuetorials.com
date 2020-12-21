#!/usr/bin/env bash
set -euo pipefail

function highlight () {
  FILE=$1
  FN="${F%.*}"
  chroma \
    --html-only \
    --html-inline-styles \
    --html-tab-width=4 \
    -f html \
    -s solarized-dark \
    $FN.cue > $FN.html
}

DIRS=$@
if [[ $# == 0 ]]; then
  DIRS=code
fi

for D in ${DIRS[@]}; do
  FILES=`find $D -name "*.cue"`
  for F in ${FILES[@]}; do
    echo $F
    highlight $F
  done
done
